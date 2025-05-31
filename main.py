from PySide6 import QtWidgets, QtGui, QtCore
from PySide6.QtCore import Qt

from pathlib import Path
import tomllib as toml
from zipfile import ZipFile
import re

from lxml import etree

from patient_data import PatientData
from widgets import DataTabWidget, SplitLineEdit, NumLineEdit, XBox, EvalLine, ExamTab

# TODO:
#   - Fragebögen eingeben
#       - Arzt Adresse
#   - Status für spätere Bearbeitung speichern?
#   - (Word Datei bearbeiten)

# TODO:
#   - Ask if overwrite is wanted on new load


class MainWidget(QtWidgets.QWidget):

    def __init__(self):
        super().__init__()

        self.patient_data = PatientData()

        self.configs = {}
        if Path("config.toml").exists():
            with open("config.toml", "rb") as config_file:
                self.configs = toml.load(config_file)

        # TODO: all standards?
        self.configs["ignore_meds"] = self.configs.get("ignore_meds", [])
        self.configs["process_files"] = self.configs.get("process_files", ["word/document.xml", "word/header1.xml"])
        self.configs["file_db"] = Path(self.configs.get("file_db", "./"))
        self.configs["save_path"] = Path(self.configs.get("save_path", "./data"))
        self.configs["output_path"] = Path(self.configs.get("output_path", "./output"))

        self.configs["template_file"] = Path(self.configs.get("template_file", "./dummy_938928477"))
        if not self.configs["template_file"].exists():
            QtWidgets.QMessageBox.warning(self, "Datei nicht gefunden", "config.toml beinhaltet keine template_file Option")

        self.configs["xsl_file"] = Path(self.configs.get("xsl_file", "./dummy_938928477"))
        if not self.configs["xsl_file"].exists():
            QtWidgets.QMessageBox.warning(self, "Datei nicht gefunden", "config.toml beinhaltet keine xsl_file Option")

        # Tab Widget is central widget

        self.setLayout(QtWidgets.QVBoxLayout())
        self.tab_widget = QtWidgets.QTabWidget()
        self.layout().addWidget(self.tab_widget)

        # Export Button

        export_button = QtWidgets.QPushButton("Brief exportieren")
        export_button.clicked.connect(self.to_xml)
        self.layout().addWidget(export_button)

        # Setup tabs

        self.fields = [DataTabWidget(self.configs)]
        self.tab_widget.addTab(self.fields[0], "&Patientendaten")
        self.fields[0].search_bar.setFocus()

        self.fields.append(ExamTab())
        self.tab_widget.addTab(self.fields[1], "&Untersuchungsdaten")

        for form_file in Path("./forms/").glob("*.toml"):
            with form_file.open("rb") as fl:
                form_data = toml.load(fl)

            form_group = QtWidgets.QWidget()
            form_layout = QtWidgets.QVBoxLayout(form_group)
            self.tab_widget.addTab(form_group, form_data.get("name", "Unbekanntes Formular"))

            for field in form_data["field"]:
                field_group = QtWidgets.QGroupBox(title=field.get("caption", ""))
                field_layout = QtWidgets.QVBoxLayout(field_group)
                field_layout.setAlignment(Qt.AlignmentFlag.AlignTop)

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

                self.fields.append(new_widget)
                field_layout.addWidget(new_widget)
                form_layout.addWidget(field_group)


    def keyPressEvent(self, event, /):
        if event.type() == QtCore.QEvent.Type.KeyPress:
            if event.modifiers() == Qt.KeyboardModifier.ControlModifier:
                if event.key() == Qt.Key.Key_E:
                    self.to_xml()
            elif event.modifiers() == Qt.KeyboardModifier.AltModifier:
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
        # Generate patient data file
        # TODO: use this to load?
        data_file = self.configs["save_path"] / f"{self.fields[0].patient_file_name()}.xml"
        output_file = self.configs["output_path"] / f"{self.fields[0].patient_file_name()}.docx"

        if (data_file.exists()
            and QtWidgets.QMessageBox.StandardButton.Yes != QtWidgets.QMessageBox.question(
                    self, "Datei existiert", "Daten-Datei existiert bereits, überschreiben?")):
                return

        data_file.parent.mkdir(exist_ok=True, parents=True)
        output_file.parent.mkdir(exist_ok=True, parents=True)

        # Write patient data file by calling to_xml() on all tabs
        with data_file.open("bw+") as fl:
            xml = f"<?xml version=\"1.0\" encoding=\"UTF-8\" ?><data>{''.join(field.to_xml() for field in self.fields)}</data>"
            fl.write(xml.encode())

        # Load xsl style sheet and add "data" global variable referring to created data file
        with open(self.configs["xsl_file"], "rb") as xsl_file:
            xsl_xml = etree.parse(xsl_file)
            etree.SubElement(
                xsl_xml.getroot(),
                "{http://www.w3.org/1999/XSL/Transform}variable",
                # XSL cannot deal with windows backslashes
                { "name": "data", "select": f"document('{data_file.absolute().as_posix()}')"})
            transform = etree.XSLT(xsl_xml)

        # Internal function to concat docs templates {varname} if word inserted <t></t> tags
        def repl(m_str) -> str:
            full_m = m_str[2]
            tag_name = full_m[1:full_m.find('<')]
            tag_name += ''.join(m[1] for m in re.finditer(r"<w:t>(.+?)</w:t>", full_m))
            if m_str[1] is not None:
                return f"<w:t xml:space=\"preserve\"><{tag_name} />"
            return f"<{tag_name} />"

        # Replace docs templates {varname} with <varname /> for xsl processing and load template docs file
        with ZipFile(output_file, "w") as output:
            with ZipFile(self.configs["template_file"]) as template:
                for doc_name in template.infolist():
                    if doc_name.filename in self.configs["process_files"]:
                        with template.open(doc_name) as document:
                            xml_content = re.sub(r"(<w:t>)?(\{.+?})", repl, document.read().decode())
                            docxml = etree.fromstring(xml_content.encode())
                        out_xml = transform(docxml)
                        output.writestr(doc_name, etree.tostring(out_xml))
                    else:
                        output.writestr(doc_name, template.read(doc_name))

        QtWidgets.QMessageBox.information(self, "Brief geschrieben", "Brief wurde fertig gestellt")


if __name__ == "__main__":
    app = QtWidgets.QApplication([])

    app.setFont(QtGui.QFont("Arial", 14))

    widget = MainWidget()
    widget.resize(800, 600)
    widget.show()

    exit(app.exec())

