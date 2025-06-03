from PySide6 import QtWidgets, QtCore
from PySide6.QtCore import Qt

from datetime import datetime
from zipfile import ZipFile
from pathlib import Path
import re
import subprocess

from lxml import etree

from patient_data import Medication, Diagnosis, Field, PatientData
from models import DiagnosesTableModel, MedicationTableModel
from util import process_filename


class DataTabWidget(QtWidgets.QWidget):
    dataLoaded = QtCore.Signal(etree.ElementBase)

    def __extract_patient_data(self, patient_data):
        """Get data from *.docx file
        :param patient_data: etree object containing docx-tabledata
        """

        # Define regex patterns

        icd_pattern = re.compile(r"^\s*(\b[,./:\-\w\s?äöüÄÖÜß]+?)([A-Z]\d{2}(?:\.\d+)?).*$", flags=re.MULTILINE)

        md_name = r"([/.\-()\w\s\däöüÄÖÜß]+?)"
        md_dosage = r"([\-\d?.,/]+)\s*"
        md_unit = r"((?:g|mg|µg|ug|IE|ml|l|Hub|Kapsel|Kps\.?|Tablette|Tbl\.?|°|Tropfen|Trpf\.?)(?:\s*/\s*(?:g|mg|µg|ug|ml|l))?)"
        n = r"\s*([\d.,/]+°?)\s*"
        med_pattern = re.compile(f"^{md_name}\\s{md_dosage}{md_unit}{n}-{n}-{n}(?:-{n})?.*?$")

        # TODO: find dosages
        simple_med_pattern = re.compile(f"(?:^|,\\s*)((?:,(?=\\d)|[^,\\n(])+)(?:\\([^)]+)?", flags=re.MULTILINE)

        # MS Word namespace for work with etree
        ns = {"w": "http://schemas.openxmlformats.org/wordprocessingml/2006/main"}

        # Internal method to extract medication from cell
        def __read_meds(text_line: str, when_key: str, how_key: str):
            meds = []

            # Match medication per line
            for entry in text_line.splitlines():

                # Try sophisticated pattern
                if med := med_pattern.match(entry):
                    med_name = med[1].strip()
                    if med_name in self.configs["ignore_meds"]:
                        continue
                    meds.append(Medication(
                        name=med[1].strip(), dosis=med[2], unit=med[3],
                        morning=med[4], noon=med[5], evening=med[6], night=med[7] if med[7] is not None else "0"
                    ))

                # If first match didn't find anything, try simple pattern
                else:
                    for med in simple_med_pattern.finditer(entry):
                        med_name = med[1].strip()
                        if med_name in self.configs["ignore_meds"]:
                            continue
                        meds.append(Medication(name=med[1].strip()))

            # Substitute medication names with alternatives from config.toml
            for md in meds:
                for word, subst in self.configs["substitute_meds"].items():
                    md.name = md.name.replace(word, subst)

            self.patient_data.medication[when_key][how_key] = meds


        # for i, cell in enumerate(patient_data.iterfind(".//w:tc", namespaces=ns)):
        #     print(i, end=' ')
        #     text = ''.join(map(lambda x: x.text, cell.iterfind(".//w:t", namespaces=ns)))
        #     print(text)

        # Walk over each cell in table
        for i, cell in enumerate(patient_data.iterfind(".//w:tc", namespaces=ns)):

            # Extract text data, respect w:p tags as newlines
            text = '\n'.join(
                ''.join(t.text for t in p.iterfind(".//w:t", namespaces=ns))
                for p in cell.iterfind(".//w:p", namespaces=ns)
            )

            # Process per field
            match i:
                case Field.Name:
                    names = list(map(lambda x: x.strip(), text.splitlines()[0].split(',')))
                    if len(names) != 2:
                        QtWidgets.QMessageBox.warning(self, "Eingabefehler", "Patientenname in Datendatei scheint falsch formatiert")
                        continue

                    self.patient_data.last_name, self.patient_data.first_name = names

                case Field.Birthday:
                    self.patient_data.birthday = datetime.strptime(text.splitlines()[0], "%d.%m.%Y")

                case Field.Address:
                    line = text.replace('\n', '')
                    if (m := re.match(r"([\w\s.,]+?)([\d\s]+)$", line)) is not None:
                        self.patient_data.address = m[1].strip()
                        self.patient_data.phone = m[2].strip()
                    else:
                        self.patient_data.address = line.strip()

                case Field.Occupation:
                    # TODO: extract gdb
                    self.patient_data.occupation = text

                case Field.Doctor:
                    # Remove "Arzt: "-prefix
                    self.patient_data.doc_name = text[text.find(' ') + 1:].strip()

                case Field.Psychotherapist:
                    # Remove "Psych.: "-prefix
                    self.patient_data.pt_name = text[text.find(' ') + 1:].strip()

                case Field.Admission:
                    self.patient_data.admission = datetime.strptime(text, "%d.%m.%Y")

                case Field.Discharge:
                    self.patient_data.discharge = datetime.strptime(text, "%d.%m.%Y")

                case Field.Allergies if text:
                    self.patient_data.allergies = text

                case Field.DiagPain | Field.DiagMisuse | Field.DiagPsych | Field.DiagSom:
                    for m in icd_pattern.finditer(text):
                        diag = Diagnosis(m[1].strip(), m[2])

                        # Special case: chronic migraine
                        if diag.icd10 == "G43.8" or diag.icd10 == "G43.3":
                            diag.icd10 = "G43.8/3"
                        self.patient_data.diagnoses.append(diag)

                case Field.MedCurrAcute:
                    __read_meds(text, "current", "acute")

                case Field.MedCurrBase:
                    __read_meds(text, "current", "base")

                case Field.MedCurrOther:
                    __read_meds(text, "current", "other")

                case Field.MedFormAcute:
                    __read_meds(text, "former", "acute")

                case Field.MedFormBase:
                    __read_meds(text, "former", "base")


    def __init__(self, configs: dict, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self.patient_data = PatientData()
        self.configs = configs

        dt_layout = QtWidgets.QVBoxLayout(self)
        dt_layout.setAlignment(Qt.AlignmentFlag.AlignTop)

        # Setup Search bar and completer

        self.search_bar = QtWidgets.QLineEdit()
        self.search_bar.returnPressed.connect(self.select_patient)

        file_completer = QtWidgets.QCompleter(
            [file_name.stem for file_name in self.configs["file_db"].glob("*.docx", case_sensitive=False)])
        file_completer.setCaseSensitivity(Qt.CaseSensitivity.CaseInsensitive)
        self.search_bar.setCompleter(file_completer)

        search_button = QtWidgets.QPushButton("Neu laden")
        search_button.setShortcut("F5")
        search_button.setToolTip("Lade Daten erneut [F5]")
        search_button.pressed.connect(self.select_patient)

        search_box = QtWidgets.QHBoxLayout()
        search_box.addWidget(self.search_bar)
        search_box.addWidget(search_button)

        dt_layout.addLayout(search_box)

        # Setup Data display

        sheet_layout = QtWidgets.QHBoxLayout()
        dt_layout.addLayout(sheet_layout)
        sheet_layout.addWidget(QtWidgets.QLabel("\nPatientendaten\n"))

        self.data_sheet_button = QtWidgets.QPushButton("Schnuppi öffnen")
        self.data_sheet_button.setShortcut("Ctrl+I")
        self.data_sheet_button.setToolTip("Datenblatt öffnen [Strg + I]")
        self.data_sheet_button.clicked.connect(self.show_data_sheet)
        self.data_sheet_button.setVisible(False)
        sheet_layout.addWidget(self.data_sheet_button)

        self.patient_label = QtWidgets.QLabel()
        dt_layout.addWidget(self.patient_label)

        # Setup ICD10 Table

        dt_layout.addWidget(QtWidgets.QLabel("\nDiagnosen\n"))

        self.diagnoses_table = QtWidgets.QTableView()
        self.diagnoses_table.setSelectionMode(QtWidgets.QAbstractItemView.SelectionMode.NoSelection)
        # self.diagnoses_table.setSelectionBehavior(QtWidgets.QAbstractItemView.SelectionBehavior.SelectRows)
        self.diagnoses_table.setModel(DiagnosesTableModel([]))
        dt_layout.addWidget(self.diagnoses_table)

        # Setup Medication Table

        dt_layout.addWidget(QtWidgets.QLabel("\nAktuelle Dauermedikation\n"))

        self.medication_table = QtWidgets.QTableView()
        self.medication_table.setSelectionMode(QtWidgets.QAbstractItemView.SelectionMode.NoSelection)
        # self.medication_table.setSelectionBehavior(QtWidgets.QAbstractItemView.SelectionBehavior.SelectRows)
        self.medication_table.setModel(MedicationTableModel([], []))
        self.medication_table.setSpan(0, 0, 1, 7)
        self.medication_table.setSpan(1, 0, 1, 7)
        dt_layout.addWidget(self.medication_table)


    @QtCore.Slot()
    def show_data_sheet(self):
        """Display Schnuppi for currently loaded patient"""

        patient_path = self.configs["file_db"] / f"{self.search_bar.text()}.docx"
        if not patient_path.exists():
            QtWidgets.QMessageBox.warning(self, "Datei nicht gefunden", f"Konnte die Datei {patient_path} nicht öffnen")
            return

        subprocess.run(f"powershell -Command \"& {{Start-Process '{patient_path.absolute()}'\"}}")


    @QtCore.Slot()
    def select_patient(self):
        """Load all data for the currently selected patient"""

        patient_path = self.configs["file_db"] / f"{self.search_bar.text()}.docx"
        if not patient_path.exists():
            QtWidgets.QMessageBox.warning(self, "Datei nicht gefunden", f"Konnte die Datei {patient_path} nicht öffnen")
            return

        with ZipFile(patient_path) as archive:
            with archive.open("word/document.xml") as fl:
                patient_data = etree.parse(fl)

        self.patient_data = PatientData()
        self.__extract_patient_data(patient_data)
        self.display_data()

        # Check for loadable data

        data_file_name = process_filename(self.configs["save_path"] / f"{self.patient_file_name()}.xml")
        data_file = Path(data_file_name)

        xml = None
        if data_file.exists():
            with data_file.open("rb") as fl:
                xml = etree.parse(fl)

        self.dataLoaded.emit(xml)


    def display_data(self):
        """Shows patient data on label and tables"""

        # self.patient_label.setTextFormat(Qt.TextFormat.RichText)
        # TODO: As Table
        self.patient_label.setText(
            f"Datensatz: {self.patient_data.first_name} {self.patient_data.last_name} (*{self.patient_data.birthday.strftime('%d.%m.%Y')})\n\n"
            f"Aufenthalt: {self.patient_data.admission.strftime('%d.%m.%Y')} - {self.patient_data.discharge.strftime('%d.%m.%Y')}\n\n"
            f"Wohnhaft: {self.patient_data.address}\n\n"
            f"Telefon: {self.patient_data.phone}\n\n"
            f"Arzt: {self.patient_data.doc_name}\n\nPT: {self.patient_data.pt_name}"
        )
        self.data_sheet_button.setVisible(True)

        self.diagnoses_table.setModel(DiagnosesTableModel(self.patient_data.diagnoses))
        self.diagnoses_table.resizeColumnsToContents()

        self.medication_table.setSpan(len(self.medication_table.model().base_medication) + 1, 0, 1, 1)
        self.medication_table.setModel(MedicationTableModel(
            self.patient_data.medication["current"]["base"],
            self.patient_data.medication["current"]["other"]))
        self.medication_table.setSpan(0, 0, 1, 7)
        self.medication_table.setSpan(len(self.patient_data.medication["current"]["base"]) + 1, 0, 1, 7)
        self.medication_table.resizeColumnsToContents()


    def patient_file_name(self) -> str:
        """Generate unique filename from loaded patient data"""
        # TODO: let user define file name via config.toml
        return (f"A-{self.patient_data.last_name}, {self.patient_data.first_name} {self.patient_data.admission.strftime('%d%m%Y')}")


    def to_xml(self) -> str:
        return self.patient_data.to_xml()
