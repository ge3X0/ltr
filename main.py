from PySide6 import QtWidgets, QtGui, QtCore
from PySide6.QtCore import Qt

from pathlib import Path
import tomllib as toml
from zipfile import ZipFile
import re

from lxml import etree

from patient_data import PatientData
from widgets import DataTabWidget, SumLineEdit, NumLineEdit, XBox, EvalLine, ExamTab

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

# TODO:
#   - Ask if overwrite is wanted on new load


class MainWidget(QtWidgets.QWidget):

    def __init__(self):
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
        self.configs["save_path"] = Path(self.configs.get("save_path", "./"))

        # TODO: check exists
        self.configs["template_file"] = Path(self.configs.get("template_file", "."))
        self.configs["xsl_file"] = Path(self.configs.get("xsl_file", "."))

        # Tab Widget is central widget

        self.setLayout(QtWidgets.QVBoxLayout())
        self.tab_widget = QtWidgets.QTabWidget()
        self.layout().addWidget(self.tab_widget)

        # Setup tabs

        self.fields = [DataTabWidget(self.configs)]
        self.tab_widget.addTab(self.fields[0], "Patientendaten")
        self.fields[0].search_bar.setFocus()

        self.fields.append(ExamTab())
        self.tab_widget.addTab(self.fields[1], "Untersuchungsdaten")

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
                    case "sum_line":
                        new_widget = SumLineEdit(
                            field_id=field["id"],
                            max_entries=field.get("max_entries", 99),
                            max_sum=field.get("max_sum", 99999999),
                            results=field.get("results", None)
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
            if event.key() == Qt.Key.Key_S and event.modifiers() == Qt.KeyboardModifier.ControlModifier:
                self.to_xml()


    def to_xml(self):
        data_file = self.configs["save_path"] / self.fields[0].patient_file_name()

        if data_file.exists():
            # TODO: throw
            pass

        data_file.parent.mkdir(exist_ok=True, parents=True)

        with data_file.open("bw+") as fl:
            xml = f"<?xml version=\"1.0\" encoding=\"UTF-8\" ?><data>{''.join(field.to_xml() for field in self.fields)}</data>"
            fl.write(xml.encode())

        with open(self.configs["xsl_file"], "rb") as xsl_file:
            xsl_xml = etree.parse(xsl_file)
            xsl_root = xsl_xml.getroot()
            etree.SubElement(xsl_root, "{http://www.w3.org/1999/XSL/Transform}variable", {
                "name": "data",
                "select": f"document('{data_file.absolute().as_posix()}')"})
            transform = etree.XSLT(xsl_xml)

        def repl(m_str) -> str:
            full_m = m_str[0]
            tag_name = full_m[1:full_m.find('<')]
            tag_name += ''.join(m[1] for m in re.finditer(r"<w:t>(.+?)</w:t>", full_m))
            return f"<{tag_name} />"

        with ZipFile(self.configs["template_file"]) as archive:
            with archive.open("word/document.xml") as document:
                xml_content = re.sub(r"\{.+?}", repl, document.read().decode())
                docxml = etree.fromstring(xml_content.encode())

        # print(etree.tostring(docxml, pretty_print=True).decode())

        out_xml = transform(docxml)
        out_xml.write("./data/output.xml", pretty_print=True)
        # print(etree.tostring(out_xml, pretty_print=True).decode())


if __name__ == "__main__":
    app = QtWidgets.QApplication([])

    app.setFont(QtGui.QFont("Arial", 14))

    widget = MainWidget()
    widget.resize(800, 600)
    widget.show()

    exit(app.exec())

