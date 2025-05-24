from PySide6 import QtWidgets, QtCore, QtGui
from PySide6.QtCore import Qt

from pathlib import Path
import tomllib as toml
from zipfile import ZipFile
from lxml import etree
from datetime import datetime
import re

from patient_data import PatientData, Medication, Diagnosis, Field

# TODO:
#   - Fragebögen eingeben
#       - MIDAS, WHODAS
#       - BDI2, Symptome
#       - Allgemeinsymptome
#       - Vorbehandler
#       - Arzt Adresse
#   - Text einsetzen
#       - Allgemeine Patientendaten
#       - Gendern
#       - ICD10-gesteuerte Textbausteine
#       - Medikamenten-gesteuerte Textbausteine
#   - Status für spätere Bearbeitung speichern?
#   - Word Datei schreiben
#   - (Word Datei bearbeiten)


class DiagnosesTableModel(QtCore.QAbstractTableModel):
    def __init__(self, diagnoses: list[Diagnosis]):
        super().__init__()
        self.diagnoses = diagnoses

    def rowCount(self, /, parent = ...):
        return len(self.diagnoses) if not parent.isValid() else 0

    def columnCount(self, /, parent = ...):
        return 2 if not parent.isValid() else 0

    def data(self, index, /, role = ...):
        if role == Qt.ItemDataRole.DisplayRole:
            return getattr(self.diagnoses[index.row()], "icd10" if index.column() == 0 else "name")
        return None

    def headerData(self, section, orientation, /, role = ...):
        if role != Qt.ItemDataRole.DisplayRole or orientation == Qt.Orientation.Vertical:
            return None

        return "ICD 10" if section == 0 else "Bezeichnung"


class MedicationTableModel(QtCore.QAbstractTableModel):
    def __init__(self, medication: list[Medication]):
        super().__init__()
        self.medication = medication

    def rowCount(self, /, parent = ...):
        return len(self.medication) if not parent.isValid() else 0

    def columnCount(self, /, parent = ...):
        return 7 if not parent.isValid() else 0

    def data(self, index, /, role = ...):
        if role == Qt.ItemDataRole.DisplayRole:
            return getattr(
                self.medication[index.row()],
                ["name", "dosis", "unit", "morning", "noon", "evening", "night"][index.column()]
            )
        return None

    def headerData(self, section, orientation, /, role = ...):
        if role != Qt.ItemDataRole.DisplayRole or orientation == Qt.Orientation.Vertical:
            return None


class MainWidget(QtWidgets.QWidget):
    def __init__(self):
        # TODO: Read file_db path from config.toml
        super().__init__()

        self.patient_data = PatientData()

        if Path("config.toml").exists():
            with open("config.toml", "rb") as config_file:
                self.configs = toml.load(config_file)
        else:
            # TODO: standard configs
            self.configs = {
                "ignore_meds": []
            }

        self.configs["file_db"] = Path(self.configs.get("file_db", "./"))

        self.search_bar = QtWidgets.QLineEdit()
        self.search_bar.returnPressed.connect(self.select_patient)

        self.file_completer = QtWidgets.QCompleter(
            [file_name.stem for file_name in self.configs["file_db"].glob("*.docx", case_sensitive=False)])
        self.file_completer.setCaseSensitivity(Qt.CaseSensitivity.CaseInsensitive)
        self.search_bar.setCompleter(self.file_completer)

        self.patient_label = QtWidgets.QLabel()

        self.diagnoses_table = QtWidgets.QTableView()
        self.diagnoses_table.horizontalHeader().setStretchLastSection(True)
        self.diagnoses_table.setSelectionMode(QtWidgets.QAbstractItemView.SelectionMode.NoSelection)
        self.diagnoses_table.setModel(DiagnosesTableModel([]))

        layout = QtWidgets.QVBoxLayout(self)
        layout.setAlignment(Qt.AlignmentFlag.AlignTop)
        layout.addWidget(self.search_bar)
        layout.addWidget(self.patient_label)
        layout.addWidget(self.diagnoses_table)


    @QtCore.Slot()
    def select_patient(self):
        # Make sure file exists
        patient_path = self.configs["file_db"] / f"{self.search_bar.text()}.docx"
        if not patient_path.exists():
            # TODO: throw
            print("Not found")
            return

        # Setup regex for diagnoses and medication

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
                morning=med[4], noon=med[5], evening=med[6], night=med[7])
                for med in med_pattern.finditer(text_line)]

            if not meds:
                meds = [Medication(name=med[1])
                for med in simple_med_pattern.finditer(text_line) if med[1] not in self.configs["ignore_meds"]]

            self.patient_data.medication[when_key][how_key] = meds

        # Read files

        with ZipFile(patient_path) as archive:
            with archive.open("word/document.xml") as fl:
                patient_data = etree.parse(fl)

        ns = {"w": "http://schemas.openxmlformats.org/wordprocessingml/2006/main"}

        # for i, cell in enumerate(patient_data.iterfind(".//w:tc", namespaces=ns)):
        #     print(i, end=' ')
        #     text = ''.join(map(lambda x: x.text, cell.iterfind(".//w:t", namespaces=ns)))
        #     print(text)

        self.patient_data = PatientData()

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

        self.display_data()


    def display_data(self):
        self.patient_label.setText(
            f"{self.patient_data.first_name} {self.patient_data.last_name} (*{self.patient_data.birthday.strftime('%d.%m.%Y')})\n"
            f"Aufenthalt: {self.patient_data.admission.strftime('%d.%m.%Y')} - {self.patient_data.discharge.strftime('%d.%m.%Y')}\n"
            f"Wohnhaft: {self.patient_data.address}\n"
            f"Arzt: {self.patient_data.doc_name}, PT: {self.patient_data.pt_name}\n"
        )

        self.diagnoses_table.setModel(DiagnosesTableModel(self.patient_data.diagnoses))



if __name__ == "__main__":
    app = QtWidgets.QApplication([])

    app.setFont(QtGui.QFont("Arial", 14))

    widget = MainWidget()
    widget.resize(800, 600)
    widget.show()

    exit(app.exec())

