from PySide6 import QtWidgets, QtCore
from PySide6.QtCore import Qt

from zipfile import ZipFile
from pathlib import Path
import os

from saxonche import PySaxonProcessor, PyXPathProcessor

from models import DiagnosesTableModel, MedicationTableModel
from models import PatientData, PatientDataLoader, PatientDataErrorType, PatientTableModel
from models import Configuration


class DataTabWidget(QtWidgets.QWidget):
    dataLoaded: QtCore.Signal = QtCore.Signal(PyXPathProcessor)


    @property
    def patient_data(self) -> PatientData:
        """Helper Method to access PatientData property of dataloader"""
        return self.data_loader.patient_data


    def __init__(self, proc: PySaxonProcessor, configs: Configuration, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self.proc: PySaxonProcessor = proc

        # self.patient_data: PatientData = PatientData()
        self.configs: Configuration = configs
        self.data_loader: PatientDataLoader = PatientDataLoader(self.configs)

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
        # patient_path = self.configs["file_db"] / f"{self.patient_data.last_name}, {self.patient_data.first_name} {self.patient_data.admission.strftime('%d%m%Y')}.docx"
        if not patient_path.exists():
            QtWidgets.QMessageBox.warning(self,
                "Datei nicht gefunden",
                f"Konnte die Datei {patient_path} nicht öffnen")
            return

        os.startfile(patient_path)


    @QtCore.Slot()
    def show_document(self):
        """Display currently selected document for currently loaded patient"""

        output_file = self.configs["output_path"] / self.configs["current_template"].stem / f"{self.patient_file_name()}.docx"
        if not output_file.exists():
            QtWidgets.QMessageBox.warning(self,
                "Datei nicht gefunden", 
                f"Konnte die Datei {output_file} nicht öffnen")
            return

        os.startfile(output_file.absolute())


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

        xpath = self.proc.new_xpath_processor()
        loader_error = self.data_loader.load_patient_data(xpath, patient_data_xml)

        if loader_error.error_type != PatientDataErrorType.NoError:
            QtWidgets.QMessageBox.warning(self,
                "Fehler beim Laden",
                loader_error.message)
            return

        self.display_data()

        # Check for loadable data
        data_file = Path(self.configs["save_path"] / f"{self.patient_file_name()}.xml")

        if not data_file.exists():
            self.letter_button.setVisible(False)
            self.dataLoaded.emit(None)
            return

        self.letter_button.setVisible(True)

        xml = self.proc.parse_xml(xml_file_name=str(data_file.absolute().as_posix()))
        xpath.set_context(xdm_item=xml)

        self.dataLoaded.emit(xpath)


    def display_data(self):
        """Shows patient data on label and tables"""

        self.patient_table.setModel(PatientTableModel(self.patient_data))
        self.patient_table.resizeColumnsToContents()
        self.data_sheet_button.setVisible(True)

        self.diagnoses_table.setModel(DiagnosesTableModel(self.patient_data.diagnoses))
        self.diagnoses_table.resizeColumnsToContents()

        self.medication_table.clearSpans()
        self.medication_table.setModel(MedicationTableModel(
            self.patient_data.medication["current"]["base"],
            self.patient_data.medication["current"]["other"]))
        self.medication_table.setSpan(0, 0, 1, 7)
        self.medication_table.setSpan(len(self.patient_data.medication["current"]["base"]) + 1, 0, 1, 7)
        self.medication_table.resizeColumnsToContents()


    def patient_file_name(self) -> str:
        """Generate unique filename from loaded patient data"""

        return self.configs["output_filename"].format(
            vorname = self.patient_data.first_name.replace("..", ""),
            nachname = self.patient_data.last_name.replace("..", ""),
            aufnahme = self.patient_data.admission.strftime("%d%m%Y"),
            entlassung = self.patient_data.discharge.strftime("%d%m%Y"),
            geburtstag = self.patient_data.birthday.strftime("%d%m%Y"))


    def to_xml(self) -> str:
        """Return xml representation of this class"""
        return self.patient_data.to_xml()
