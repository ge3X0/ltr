from PySide6 import QtWidgets, QtCore
from PySide6.QtCore import Qt

from datetime import datetime
from zipfile import ZipFile
import re

from lxml import etree

from patient_data import Medication, Diagnosis, Field, PatientData
from models import DiagnosesTableModel, MedicationTableModel


class DataTabWidget(QtWidgets.QWidget):
    def __extract_patient_data(self, patient_data):
        icd_pattern = re.compile(r"\b([,.:\-\w äöüÄÖÜß]+)\s+([A-Z]\d{2}(?:\.\d+)?)")
        md_name = r"([/.\-()\w\s\däöüÄÖÜß]{5,18})"
        md_dosage = r"([\d.,/]+)\s*"
        md_unit = r"((?:g|mg|µg|ug|IE|ml|l|Hub|Kps\.?|Tbl\.?|°|Trpf\.?)(?:\s*/\s*(?:g|mg|µg|ug|ml|l))?)"
        n = r"\s*([\d.,/]+°?)\s*"
        med_pattern = re.compile(f"^{md_name}\\s+{md_dosage}{md_unit}{n}-{n}-{n}(?:-{n})?", flags=re.MULTILINE)
        simple_med_pattern = re.compile(f"(?:^|,\\s*)([^,\\n(]+)(?:\\([^)]+)?", flags=re.MULTILINE)

        def __read_meds(text_line: str, when_key: str, how_key: str):
            meds = [Medication(
                name=med[1], dosis=med[2], unit=med[3],
                morning=med[4], noon=med[5], evening=med[6], night=med[7] if med[7] is not None else "0")
                for med in med_pattern.finditer(text_line)]

            if not meds:
                meds = [Medication(name=med[1])
                        for med in simple_med_pattern.finditer(text_line) if med[1] not in self.configs["ignore_meds"]]

            self.patient_data.medication[when_key][how_key] = meds

        ns = {"w": "http://schemas.openxmlformats.org/wordprocessingml/2006/main"}

        # for i, cell in enumerate(patient_data.iterfind(".//w:tc", namespaces=ns)):
        #     print(i, end=' ')
        #     text = ''.join(map(lambda x: x.text, cell.iterfind(".//w:t", namespaces=ns)))
        #     print(text)

        for i, cell in enumerate(patient_data.iterfind(".//w:tc", namespaces=ns)):
            text = '\n'.join(map(lambda x: x.text, cell.iterfind(".//w:t", namespaces=ns)))
            match i:
                case Field.Name:
                    # TODO: validate, strip
                    self.patient_data.last_name, self.patient_data.first_name = map(lambda x: x.strip(), text.splitlines()[0].split(','))

                case Field.Birthday:
                    self.patient_data.birthday = datetime.strptime(text, "%d.%m.%Y")

                case Field.Address:
                    self.patient_data.address = text.replace('\n', '').strip()

                case Field.Occupation:
                    # TODO: occupation, gdb
                    pass

                case Field.Doctor:
                    self.patient_data.doc_name = text[text.find(' ') + 1:].strip()

                case Field.Psychotherapist:
                    # Removing "Psych.: "-Prefix
                    self.patient_data.pt_name = text[text.find(' ') + 1:].strip()

                case Field.Admission:
                    self.patient_data.admission = datetime.strptime(text, "%d.%m.%Y")

                case Field.Discharge:
                    self.patient_data.discharge = datetime.strptime(text, "%d.%m.%Y")

                case Field.Allergies:
                    # TODO: standard on empty
                    self.patient_data.allergies = text

                case Field.DiagPain | Field.DiagMisuse | Field.DiagPsych | Field.DiagSom:
                    # TODO: show diagnoses, warn icd10
                    for m in icd_pattern.finditer(text):
                        self.patient_data.diagnoses.append(Diagnosis(m[1], m[2]))

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
        self.search_bar.setStyleSheet("padding: 12px")
        self.search_bar.returnPressed.connect(self.select_patient)

        file_completer = QtWidgets.QCompleter(
            [file_name.stem for file_name in self.configs["file_db"].glob("*.docx", case_sensitive=False)])
        file_completer.setCaseSensitivity(Qt.CaseSensitivity.CaseInsensitive)
        self.search_bar.setCompleter(file_completer)

        search_button = QtWidgets.QPushButton("Neu laden")
        search_button.setStyleSheet("padding: 12px")
        search_button.pressed.connect(self.select_patient)

        search_box = QtWidgets.QHBoxLayout()
        search_box.addWidget(self.search_bar)
        search_box.addWidget(search_button)

        dt_layout.addLayout(search_box)

        # Setup Data display

        dt_layout.addWidget(QtWidgets.QLabel("\nPatientendaten\n"))
        self.patient_label = QtWidgets.QLabel()
        dt_layout.addWidget(self.patient_label)

        # Setup ICD10 Table

        dt_layout.addWidget(QtWidgets.QLabel("\nDiagnosen\n"))

        self.diagnoses_table = QtWidgets.QTableView()
        self.diagnoses_table.setSelectionMode(QtWidgets.QAbstractItemView.SelectionMode.NoSelection)
        self.diagnoses_table.setSelectionBehavior(QtWidgets.QAbstractItemView.SelectionBehavior.SelectRows)
        self.diagnoses_table.setModel(DiagnosesTableModel([]))
        dt_layout.addWidget(self.diagnoses_table)

        # Setup Medication Table

        dt_layout.addWidget(QtWidgets.QLabel("\nAktuelle Dauermedikation\n"))

        self.medication_table = QtWidgets.QTableView()
        self.medication_table.setSelectionMode(QtWidgets.QAbstractItemView.SelectionMode.NoSelection)
        self.medication_table.setSelectionBehavior(QtWidgets.QAbstractItemView.SelectionBehavior.SelectRows)
        self.medication_table.setModel(MedicationTableModel([], []))
        self.medication_table.setSpan(0, 0, 1, 7)
        self.medication_table.setSpan(1, 0, 1, 7)
        dt_layout.addWidget(self.medication_table)


    @QtCore.Slot()
    def select_patient(self):
        patient_path = self.configs["file_db"] / f"{self.search_bar.text()}.docx"
        if not patient_path.exists():
            # TODO: throw
            print("Not found")
            return

        with ZipFile(patient_path) as archive:
            with archive.open("word/document.xml") as fl:
                patient_data = etree.parse(fl)

        self.patient_data = PatientData()
        self.__extract_patient_data(patient_data)
        self.display_data()


    def display_data(self):
        self.patient_label.setText(
            f"Datensatz: {self.patient_data.first_name} {self.patient_data.last_name} (*{self.patient_data.birthday.strftime('%d.%m.%Y')})\n\n"
            f"Aufenthalt: {self.patient_data.admission.strftime('%d.%m.%Y')} - {self.patient_data.discharge.strftime('%d.%m.%Y')}\n\n"
            f"Wohnhaft: {self.patient_data.address}\n\n"
            f"Arzt: {self.patient_data.doc_name}\n\nPT: {self.patient_data.pt_name}"
        )

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
        return (f"{self.patient_data.last_name}_{self.patient_data.first_name}_"
                f"{self.patient_data.birthday.strftime('%d%m%Y')}_{self.patient_data.admission.strftime('%d%m%Y')}.xml")


    def to_xml(self) -> str:
        return self.patient_data.to_xml()
