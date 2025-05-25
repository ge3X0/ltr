from PySide6 import QtWidgets, QtCore, QtGui

from pathlib import Path
import tomllib as toml

from patient_data import PatientData
from widgets import DataTabWidget, SumLineEdit, NumLineEdit

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

        # Tab Widget is central widget

        self.setLayout(QtWidgets.QVBoxLayout())
        self.tab_widget = QtWidgets.QTabWidget()
        self.layout().addWidget(self.tab_widget)

        # Setup tabs

        self.tab_widget.addTab(DataTabWidget(self.configs), "Patientendaten")

        for form_file in Path("./forms/").glob("*.toml"):
            with form_file.open("rb") as fl:
                form_data = toml.load(fl)

            form_group = QtWidgets.QGroupBox(title=form_data.get("name", default=""))
            form_layout = QtWidgets.QVBoxLayout(form_group)

            for field in form_data["field"]:
                field_group = QtWidgets.QGroupBox(title=field.get("caption", default=""))
                field_layout = QtWidgets.QVBoxLayout(field_group)

                match field["field_type"]:
                    case "sum_line":
                        field_layout.addWidget(SumLineEdit(
                            max_entries=field.get("max_entries", default=99),
                            max_sum=field.get("max_sum", default=99999999),
                            results=field.get("results", None)
                        ))

                    case "xbox":
                        pass

                    case "eval_line":
                        pass

                    case "num_line":
                        field_layout.addWidget(NumLineEdit(
                            result_list=field.get("values", []),
                            start=field.get("start", 0)
                        ))

                form_layout.addWidget(field_group)





if __name__ == "__main__":
    app = QtWidgets.QApplication([])

    app.setFont(QtGui.QFont("Arial", 14))

    widget = MainWidget()
    widget.resize(800, 600)
    widget.show()

    exit(app.exec())

