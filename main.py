from PySide6 import QtWidgets, QtGui, QtCore
from PySide6.QtCore import Qt

from pathlib import Path
import tomllib as toml
from zipfile import ZipFile
import re
import subprocess

# from lxml import etree
from saxonche import PySaxonProcessor

from models import PatientData
from widgets import DataTabWidget, SplitLineEdit, NumLineEdit, XBox, EvalLine, ExamTab, LoadingDialog
from util import process_filename

# TODO:
#   - Fragebögen eingeben
#       - Arzt Adresse
#   - (Word Datei bearbeiten)

class MainWidget(QtWidgets.QWidget):
    """
    :ivar configs: Dictionary loaded from configs.toml
    :ivar fields: List of widgets containing data, each must implement to_xml()

    """

    def __init__(self):
        super().__init__()

        self.patient_data = PatientData()

        # Load Configuration

        self.configs = {
            "forms": [],
            "ignore_meds": [],
            "substitute_meds": {},
            "process_files": ["word/document.xml", "word/header1.xml"],
        }
        if Path("config.toml").exists():
            with open("config.toml", "rb") as config_file:
                self.configs.update(toml.load(config_file))

        self.configs["file_db"] = Path(self.configs.get("file_db", "./"))
        self.configs["save_path"] = Path(self.configs.get("save_path", "./data"))
        self.configs["output_path"] = Path(self.configs.get("output_path", "./output"))

        # TODO: Do we want to proceed, if these are missing?
        if "template_file" not in self.configs:
            QtWidgets.QMessageBox.warning(self,
            "Fehler in config.toml",
            "config.toml muss Schlüssel template_file beinhalten")

        self.configs["template_file"] = Path(self.configs["template_file"])
        if not self.configs["template_file"].exists():
            QtWidgets.QMessageBox.warning(self,
            "Datei nicht gefunden",
            "template_file existiert nicht")

        if "xsl_file" not in self.configs:
            QtWidgets.QMessageBox.warning(self,
            "Fehler in config.toml",
            "config.toml muss Schlüssel xsl_file beinhalten")

        self.configs["xsl_file"] = Path(self.configs["xsl_file"])
        if not self.configs["xsl_file"].exists():
            QtWidgets.QMessageBox.warning(self,
            "Datei nicht gefunden",
            "xsl_file existiert nicht")

        # Tab Widget is central widget

        self.setLayout(QtWidgets.QVBoxLayout())
        self.tab_widget = QtWidgets.QTabWidget()
        self.layout().addWidget(self.tab_widget)

        # Export Button
        # TODO: Better location?

        export_button = QtWidgets.QPushButton("Brief exportieren")
        export_button.clicked.connect(self.to_xml)
        export_button.setShortcut("Ctrl+E")
        self.layout().addWidget(export_button)

        # Shortcut definition

        open_output_shortcut = QtGui.QShortcut("Ctrl+O", self)
        open_output_shortcut.activated.connect(self.open_output_file)

        # Setup tabs

        # Data Tab

        self.forms = [DataTabWidget(self.configs)]
        self.tab_widget.addTab(self.forms[0], "&Patient")
        self.forms[0].search_bar.setFocus()

        # Examination Tab

        self.forms.append(ExamTab())
        self.forms[0].dataLoaded.connect(self.forms[1].from_xml)
        self.tab_widget.addTab(self.forms[1], "&Untersuchung")

        # Tabs loaded from ./forms

        for form_file_name in self.configs["forms"]:
            form_file = Path("./forms") / f"{form_file_name}.toml"

            if not form_file.exists():
                QtWidgets.QMessageBox.warning(self,
                "Formular nicht gefunden",
                f"Formulardatei '{form_file_name}.toml' nicht gefunden")
                continue

            with form_file.open("rb") as fl:
                form_data = toml.load(fl)

            # Create new Tab

            form_group = QtWidgets.QWidget()
            form_group.setLayout(QtWidgets.QVBoxLayout())
            self.tab_widget.addTab(form_group, form_data.get("name", "Unbenannt"))

            for field in form_data["field"]:
                field_group = QtWidgets.QGroupBox(title=field.get("caption", ""))
                field_layout = QtWidgets.QVBoxLayout(field_group)
                field_layout.setAlignment(Qt.AlignmentFlag.AlignTop)
                form_group.layout().addWidget(field_group)

                new_widget = None

                match field["field_type"]:
                    case "split_line":
                        new_widget = SplitLineEdit(
                            field_id=field["id"],
                            max_entries=field.get("max_entries", 99)
                        )

                    case "xbox":
                        new_widget = XBox(
                            field_id=field["id"],
                            values=field.get("values", []),
                            rows=field.get("rows", -1)
                        )

                    case "eval_line":
                        new_widget = EvalLine(
                            field_id=field["id"],
                            values=field.get("values", []),
                            start=field.get("start", 0)
                        )

                    case "num_line":
                        new_widget = NumLineEdit(
                            field_id=field["id"],
                            result_list=field.get("values", []),
                            start=field.get("start", 0)
                        )

                self.forms.append(new_widget)
                self.forms[0].dataLoaded.connect(new_widget.from_xml)
                field_layout.addWidget(new_widget)


    def keyPressEvent(self, event, /):

        if event.type() == QtCore.QEvent.Type.KeyPress:
            # Shortcut for moving between tabs (kinda broken)
            if event.modifiers() == Qt.KeyboardModifier.AltModifier:
                    next_tab = self.tab_widget.currentIndex()
                    if event.key() == Qt.Key.Key_Right:
                        next_tab += 1
                        if next_tab >= self.tab_widget.count():
                            next_tab = 0
                    elif event.key() == Qt.Key.Key_Left:
                        next_tab -= 1
                        if next_tab < 0:
                            next_tab = self.tab_widget.count() - 1
                    self.tab_widget.setCurrentIndex(next_tab)


    def to_xml(self):
        """Writes letter from collected data of all tabs"""

        # Generate patient data file
        # TODO: use this to load?
        patient_file_name = self.forms[0].patient_file_name()
        data_file = self.configs["save_path"] / f"{patient_file_name}.xml"
        output_file = self.configs["output_path"] / f"{patient_file_name}.docx"

        data_file_name = process_filename(data_file)
        data_file = Path(data_file_name)

        if (data_file.exists()
            and QtWidgets.QMessageBox.StandardButton.Yes != QtWidgets.QMessageBox.question(
                    self, "Datei existiert", "Daten-Datei existiert bereits, überschreiben?")):
                return

        data_file.parent.mkdir(exist_ok=True, parents=True)
        output_file.parent.mkdir(exist_ok=True, parents=True)

        # Write patient data file by calling to_xml() on all tabs

        with data_file.open("bw+") as fl:
            xml = f"<?xml version=\"1.0\" encoding=\"UTF-8\" ?><data>{''.join(field.to_xml() for field in self.forms)}</data>"
            fl.write(xml.encode())

        # Load xsl style sheet and add "data" global variable referring to created data file

        proc = PySaxonProcessor(license=False)


        with open(self.configs["xsl_file"], "rb") as xsl_file:
            xsl_xml = etree.parse(xsl_file)
            etree.SubElement(
                xsl_xml.getroot(),
                "{http://www.w3.org/1999/XSL/Transform}variable",
                # XSL cannot deal with windows backslashes
                { "name": "data", "select": f"document('{data_file_name}')"})
            transform = etree.XSLT(xsl_xml)

        # Internal function to concat docs templates {varname} if word inserted <t></t> tags
        def repl(m_str) -> str:
            full_m = m_str[2]
            tag_name = full_m[1:full_m.find('<')]
            tag_name += ''.join(m[1] for m in re.finditer(r"<w:t>(.+?)(?:</w:t>|})", full_m))
            # Found immediate opening tag, indicating messed up whitespace
            if m_str[1] is not None:
                return f"<w:t xml:space=\"preserve\"><{tag_name} />"
            return f"<{tag_name} />"

        # Replace docs templates {varname} with <varname /> for xsl processing and load template docs file

        with ZipFile(output_file, "w") as output:
            with ZipFile(self.configs["template_file"]) as template:
                for doc_name in template.infolist():

                    # Just copy files that are not processed
                    if doc_name.filename not in self.configs["process_files"]:
                        output.writestr(doc_name, template.read(doc_name))
                        continue

                    # Prepare files for xsl processing by replacing {varname} with <varname />
                    with template.open(doc_name) as document:
                        xml_content = re.sub(r"(<w:t>)?(\{.+?})", repl, document.read().decode())
                        docxml = etree.fromstring(xml_content.encode())

                    out_xml = transform(docxml)
                    output.writestr(doc_name, etree.tostring(out_xml))

        QtWidgets.QMessageBox.information(self, "Brief geschrieben", "Brief wurde fertig gestellt [STRG+O] zum öffnen")


    def open_output_file(self):
        patient_file_name = self.forms[0].patient_file_name()
        output_file = self.configs["output_path"] / f"{patient_file_name}.docx"
        if not output_file.exists():
            QtWidgets.QMessageBox.warning(self, "Datei nicht gefunden", "Für den aktuellen Datensatz kann kein Brief gefunden werden")
            return

        subprocess.run(f"powershell -Command \"& {{Start-Process '{output_file.absolute()}'\"}}")


if __name__ == "__main__":
    app = QtWidgets.QApplication([])

    app.setStyleSheet("""
    QPushButton { padding: 12px; }
    QLineEdit { padding: 12px; }
    """)
    app.setFont(QtGui.QFont("Arial", 14))

    widget = MainWidget()
    widget.showMaximized()
    widget.show()

    exit(app.exec())

