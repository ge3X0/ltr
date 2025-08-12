from PySide6 import QtWidgets, QtCore
from PySide6.QtCore import Qt

from datetime import datetime
from zipfile import ZipFile
from pathlib import Path
import re
import subprocess

from typing import Any

from saxonche import PySaxonProcessor, PyXdmNode, PyXPathProcessor

from models.patient_data import Medication, Diagnosis, Field, PatientData
from models.models import DiagnosesTableModel, MedicationTableModel, PatientTableModel


# TODO better diff between data and gui

class DataTabWidget(QtWidgets.QWidget):
    dataLoaded: QtCore.Signal = QtCore.Signal(PyXPathProcessor)

    # Internal method to extract medication from cell
    def __read_meds(self, text_line: str, when_key: str, how_key: str):
        """Tries to read medication from string
        :param text_line: str, Multiline text to extract medication from
        :param when_key: str, Used to sort into medication
        :param how_key: str, Used to sort into medication
        """

        meds: list[Medication] = []

        # Match medication per line
        for entry in map(lambda l: re.sub(r"\(.+?\)", "", l).strip(), text_line.splitlines()):
            if med := self.med_pattern.match(entry):
                med_name = med[1].strip()

                if med_name in self.configs["ignore_meds"]:
                    continue

                meds.append(Medication(
                    name=med_name, dosis=med[2], unit=med[3],
                    morning=med[4], noon=med[5], evening=med[6], night=med[7] if med[7] is not None else "0"
                ))

            else:
                for med in self.simple_med_pattern.finditer(entry):
                    med_name = med[1].strip()

                    if med_name in self.configs["ignore_meds"]:
                        continue

                    meds.append(Medication(
                        name=med_name,
                        dosis=med[2] if med[2] is not None else "?",
                        unit=med[3] if med[3] is not None else "",
                    ))

        # Substitute medication names with alternatives from config.toml
        for md in meds:
            for word, subst in self.configs["substitute_meds"].items():
                md.name = md.name.replace(word, subst)

        self.patient_data.medication[when_key][how_key] = meds


    def __extract_patient_data(self, patient_data_xml: PyXdmNode):
        """Get data from *.docx file
        :param patient_data_xml: etree object containing docx-tabledata
        """

        xpath = self.proc.new_xpath_processor()
        xpath.declare_namespace("w", "http://schemas.openxmlformats.org/wordprocessingml/2006/main")
        xpath.set_context(xdm_item=patient_data_xml)

        # Walk over each cell in table
        for cell_idx, cell in enumerate(xpath.evaluate(".//w:tc")): # pyright: ignore
            if cell is None:
                QtWidgets.QMessageBox.warning(self,
                    "Fehler beim Lesen der Daten",
                    "Unerwarteter Fehler: Keine Tabellen")
                return

            xpath.set_context(xdm_item=cell) # pyright: ignore[reportArgumentType]

            # Group by paragraph, ignore lists
            if (p_nodes := xpath.evaluate(".//w:p[not(.//w:numPr)]")) is None:
                continue

            text: str = '\n'.join(p.string_value for p in p_nodes) # pyright: ignore[reportOptionalMemberAccess]

            # Process per field
            match cell_idx:
                case Field.Name:
                    names = list(map(lambda x: x.strip(), text.splitlines()[0].split(',')))
                    if len(names) != 2:
                        QtWidgets.QMessageBox.warning(self,
                          "Eingabefehler",
                          "Patientenname in Datendatei scheint falsch formatiert")
                        continue

                    self.patient_data.last_name, self.patient_data.first_name = names


                case Field.Birthday:
                    # TODO: error on invalid birthday
                    self.patient_data.birthday = datetime.strptime(text.splitlines()[0], "%d.%m.%Y")


                case Field.Address:
                    line = text.replace('\n', '')
                    if (m := re.match(r"([\w\s.,-]+?)-?([\d\s]+)$", line)) is not None:
                        self.patient_data.address = m[1].strip()
                        self.patient_data.phone = m[2].strip()
                    else:
                        self.patient_data.address = line.strip()


                case Field.Occupation:
                    self.patient_data.occupation = text


                case Field.Doctor:
                    # Remove "Arzt: "-prefix
                    if (m := re.match(r"Arzt:\s*(.+)", text)):
                        self.patient_data.doc_name = m[1].strip()
                    else:
                        self.patient_data.doc_name = text


                case Field.Psychotherapist:
                    # Remove "Psych.: "-prefix
                    if (m := re.match(r"Psych\.:\s*(.+)", text)):
                        self.patient_data.pt_name = m[1].strip()
                    else:
                        self.patient_data.pt_name = text


                case Field.Admission:
                    # TODO error on invalid dates
                    self.patient_data.admission = datetime.strptime(text, "%d.%m.%Y")


                case Field.Discharge:
                    self.patient_data.discharge = datetime.strptime(text, "%d.%m.%Y")


                case Field.Allergies if text:
                    self.patient_data.allergies = text


                case Field.DiagPain | Field.DiagMisuse | Field.DiagPsych | Field.DiagSom:
                    for line in text.splitlines():
                        for m in self.icd_pattern.finditer(line):
                            diag = Diagnosis(m[1].strip(), m[2])
                            subst: list[str] | None = self.configs["substitute_diagnoses"].get(diag.icd10, None)

                            if subst is not None:   # No Substitution
                                if not subst:       # Empty list -> ignore diagnosis
                                    continue
                                if len(subst) != 2:
                                    QtWidgets.QMessageBox.warning(self, "Diagnose - Substitution",
                                        "substitute_diagnoses benötigt exakt 2 Parameter in config.toml")
                                    continue
                                diag.icd10, diag.name = subst

                            # TODO: Add sorting option to config.toml
                            if diag.icd10 == "G44.4":
                                self.patient_data.diagnoses.insert(0, diag)
                            else:
                                self.patient_data.diagnoses.append(diag)


                case Field.MedCurrAcute:
                    self.__read_meds(text, "current", "acute")


                case Field.MedCurrBase:
                    self.__read_meds(text, "current", "base")


                case Field.MedCurrOther:
                    self.__read_meds(text, "current", "other")


                case Field.MedFormAcute:
                    self.__read_meds(text, "former", "acute")


                case Field.MedFormBase:
                    self.__read_meds(text, "former", "base")

                case _:
                    pass


    def __init__(self, proc: PySaxonProcessor, configs: dict[str, Any], *args, **kwargs):
        super().__init__(*args, **kwargs)

        self.proc: PySaxonProcessor = proc
        self.icd_pattern: re.Pattern[str] = re.compile(r"^\s*(\b[,./:\-\w\s?äöüÄÖÜß]+?)([A-Z]\d{2}(?:\.\d+)?).*$")

        md_name = r"([/.\-()\w\säöüÄÖÜß?]+?)"
        md_dosage = r"([\-\d?.,/]+)\s*"
        md_unit = r"((?:g|mg|µg|ug|ng|IE|ml|l|Hub|Kapsel|Kps\.?|Tablette|Tbl\.?|°|Tropfen|Trpf\.?)(?:\s*/\s*(?:g|mg|µg|ug|ng|ml|l|d|Tag|h|Stunde))?)"
        n = r"\s*([\d.,/]+°?)\s*"
        self.med_pattern: re.Pattern[str] = re.compile(f"^{md_name}\\s{md_dosage}{md_unit}{n}-{n}-{n}(?:-{n})?.*?$")

        self.simple_med_pattern: re.Pattern[str] = re.compile(
            f"(?:^|,\\s*)"      # Start of line or after comma
            # f"((?:,(?=\\d)|[^,(])+?)"
            f"{md_name}"
            f"(?:\\s{md_dosage}{md_unit})?"
            # f"(?:\\s\\([^)]+)?"
            f"(?=$|,\\s)")

        self.patient_data: PatientData = PatientData()
        self.configs: dict[str, Any] = configs

        main_layout = QtWidgets.QVBoxLayout(self)
        main_layout.setAlignment(Qt.AlignmentFlag.AlignTop)

        # Setup Search bar and completer

        search_box = QtWidgets.QHBoxLayout()
        main_layout.addLayout(search_box)

        self.search_bar: QtWidgets.QLineEdit = QtWidgets.QLineEdit()
        search_box.addWidget(self.search_bar)

        self.search_bar.returnPressed.connect(self.select_patient)

        file_completer = QtWidgets.QCompleter(
            [file_name.stem for file_name in self.configs["file_db"].glob("*.docx", case_sensitive=False)])
        file_completer.setCaseSensitivity(Qt.CaseSensitivity.CaseInsensitive)
        self.search_bar.setCompleter(file_completer)

        search_button = QtWidgets.QPushButton("Neu laden")
        search_box.addWidget(search_button)

        search_button.setShortcut("F5")
        search_button.setToolTip("Lade Daten erneut [F5]")
        search_button.pressed.connect(self.select_patient)


        # Setup Data Area

        scroll_area= QtWidgets.QScrollArea()
        scroll_area.setWidgetResizable(True)
        scroll_widget = QtWidgets.QWidget()
        scroll_widget.setSizePolicy(QtWidgets.QSizePolicy.Policy.Expanding, QtWidgets.QSizePolicy.Policy.Expanding)
        data_layout = QtWidgets.QVBoxLayout(scroll_widget)

        # Setup Data display

        data_layout.addWidget(QtWidgets.QLabel("Patientendaten\n"))

        sheet_layout = QtWidgets.QHBoxLayout()
        data_layout.addLayout(sheet_layout)

        self.patient_table: QtWidgets.QTableView = QtWidgets.QTableView()
        self.patient_table.setSelectionMode(QtWidgets.QAbstractItemView.SelectionMode.NoSelection)
        sheet_layout.addWidget(self.patient_table);

        # Setup Buttons

        buttons_layout = QtWidgets.QVBoxLayout()
        buttons_layout.setAlignment(Qt.AlignmentFlag.AlignTop)
        sheet_layout.addLayout(buttons_layout)

        self.data_sheet_button: QtWidgets.QPushButton = QtWidgets.QPushButton("Schnuppi öffnen")
        self.data_sheet_button.setToolTip("Datenblatt öffnen [Strg+I]")
        self.data_sheet_button.clicked.connect(self.show_data_sheet)
        self.data_sheet_button.setVisible(False)
        buttons_layout.addWidget(self.data_sheet_button)

        self.letter_button: QtWidgets.QPushButton = QtWidgets.QPushButton("Dokument öffnen")
        self.letter_button.setToolTip("Dokument öffnen [Strg+O]")
        self.letter_button.clicked.connect(self.show_document)
        self.letter_button.setVisible(False)
        buttons_layout.addWidget(self.letter_button)

        # Setup ICD10 Table

        data_layout.addWidget(QtWidgets.QLabel("\nDiagnosen\n"))

        self.diagnoses_table: QtWidgets.QTableView = QtWidgets.QTableView()
        self.diagnoses_table.setSelectionMode(QtWidgets.QAbstractItemView.SelectionMode.NoSelection)
        self.diagnoses_table.setModel(DiagnosesTableModel([]))
        data_layout.addWidget(self.diagnoses_table)

        # Setup Medication Table

        data_layout.addWidget(QtWidgets.QLabel("\nAktuelle Dauermedikation\n"))

        self.medication_table: QtWidgets.QTableView = QtWidgets.QTableView()
        self.medication_table.setSelectionMode(QtWidgets.QAbstractItemView.SelectionMode.NoSelection)
        self.medication_table.setModel(MedicationTableModel([], []))
        self.medication_table.setSpan(0, 0, 1, 7)
        self.medication_table.setSpan(1, 0, 1, 7)
        data_layout.addWidget(self.medication_table)

        scroll_area.setWidget(scroll_widget)
        main_layout.addWidget(scroll_area)


    @QtCore.Slot()
    def show_data_sheet(self):
        """Display Schnuppi for currently loaded patient"""

        patient_path = self.configs["file_db"] / f"{self.search_bar.text()}.docx"
        if not patient_path.exists():
            QtWidgets.QMessageBox.warning(self,
                "Datei nicht gefunden",
                f"Konnte die Datei {patient_path} nicht öffnen")
            return

        subprocess.run(f"powershell -Command \"& {{Start-Process '{patient_path.absolute()}'\"}}")


    @QtCore.Slot()
    def show_document(self):
        """Display currently selected document for currently loaded patient"""

        output_file = self.configs["output_path"] / self.configs["current_template"].stem / f"{self.patient_file_name()}.docx"
        if not output_file.exists():
            QtWidgets.QMessageBox.warning(self,
                "Datei nicht gefunden", 
                f"Konnte die Datei {output_file} nicht öffnen")
            return

        subprocess.run(f"powershell -Command \"& {{Start-Process '{output_file.absolute()}'\"}}")


    @QtCore.Slot()
    def select_patient(self):
        """Load all data for the currently selected patient. Emits dataLoaded signal"""

        file_path = self.search_bar.text().replace("..", "")
        patient_path = self.configs["file_db"] / f"{file_path}.docx"

        if not patient_path.exists():
            QtWidgets.QMessageBox.warning(self, "Datei nicht gefunden",
              f"Konnte die Datei {patient_path} nicht öffnen")
            return

        with ZipFile(patient_path) as archive:
            with archive.open("word/document.xml") as fl:
                patient_data_xml = self.proc.parse_xml(xml_text=fl.read().decode())

        self.patient_data = PatientData()
        self.__extract_patient_data(patient_data_xml)
        self.display_data()

        # Check for loadable data
        data_file = Path(self.configs["save_path"] / f"{self.patient_file_name()}.xml")

        if not data_file.exists():
            self.letter_button.setVisible(False)
            self.dataLoaded.emit(None)
            return

        self.letter_button.setVisible(True)

        xml = self.proc.parse_xml(xml_file_name=str(data_file.absolute().as_posix()))
        xpath = self.proc.new_xpath_processor()
        xpath.set_context(xdm_item=xml)

        self.dataLoaded.emit(xpath)


    def display_data(self):
        """Shows patient data on label and tables"""

        self.patient_table.setModel(PatientTableModel(self.patient_data))
        self.patient_table.resizeColumnsToContents()
        self.data_sheet_button.setVisible(True)

        self.diagnoses_table.setModel(DiagnosesTableModel(self.patient_data.diagnoses))
        self.diagnoses_table.resizeColumnsToContents()

        # Reset cells from last table
        self.medication_table.setSpan(len(self.medication_table.model().base_medication) + 1, 0, 1, 1) # pyright: ignore

        self.medication_table.setModel(MedicationTableModel(
            self.patient_data.medication["current"]["base"],
            self.patient_data.medication["current"]["other"]))
        self.medication_table.setSpan(0, 0, 1, 7)
        self.medication_table.setSpan(len(self.patient_data.medication["current"]["base"]) + 1, 0, 1, 7)
        self.medication_table.resizeColumnsToContents()


    def patient_file_name(self) -> str:
        """Generate unique filename from loaded patient data"""

        # Remove directory string parts
        first_name = self.patient_data.first_name.replace("..", "")
        last_name = self.patient_data.last_name.replace("..", "")

        # TODO: let user define file name via config.toml
        return f"A-{last_name}, {first_name} {self.patient_data.admission.strftime('%d%m%Y')}"


    def to_xml(self) -> str:
        """Return xml representation of this class"""
        return self.patient_data.to_xml()
