from PySide6 import QtWidgets, QtGui
from PySide6.QtCore import Qt, Slot

from pathlib import Path
import tomllib as toml
from zipfile import ZipFile
import re

from saxonche import PySaxonProcessor

from models import PatientData
from .data_tab import DataTabWidget
from .eval_line import EvalLine
from .exam_tab import ExamTab
from .num_line import NumLineEdit
from .split_line import SplitLineEdit
from .xbox import XBox


class MainWidget(QtWidgets.QWidget):
    """
    :ivar configs: Dictionary loaded from configs.toml
    :ivar fields: List of widgets containing data, each must implement to_xml()
    """

    @Slot()
    def template_changed(self, index: int):
        if 0 <= index < len(self.configs["template_files"]):
            self.configs["current_template"] = self.configs["template_files"][index]


    def __init__(self, configs: dict):
        super().__init__()

        self.proc = PySaxonProcessor(license=False)
        self.patient_data = PatientData()

        # Load Configuration

        self.configs = {
            "forms": [],
            "ignore_meds": [],
            "substitute_meds": {},
            "process_files": ["word/document.xml", "word/header1.xml"],
        }

        self.configs.update(configs)

        # Set standard Path values, important paths are handled before init

        self.configs["file_db"] = self.configs["base_path"] / self.configs.get("file_db", ".")
        self.configs["save_path"] = self.configs["base_path"] / self.configs.get("save_path", "data")
        self.configs["output_path"] = self.configs["base_path"] / self.configs.get("output_path", "output")

        # Easy transfer of template change to other widgets
        self.configs["current_template"]: Path = self.configs["template_files"][0]

        # Tab Widget is central widget

        self.setLayout(QtWidgets.QVBoxLayout())

        self.tab_widget = QtWidgets.QTabWidget()
        self.layout().addWidget(self.tab_widget)

        # Export Button

        export_layout = QtWidgets.QHBoxLayout()
        self.layout().addLayout(export_layout)

        export_button = QtWidgets.QPushButton("Dokument exportieren: ")
        export_layout.addWidget(export_button)
        export_button.clicked.connect(self.to_xml)
        export_button.setShortcut("Ctrl+E")

        template_picker = QtWidgets.QComboBox(self)
        export_layout.addWidget(template_picker)
        template_picker.addItems([str(f.stem) for f in self.configs["template_files"]])
        template_picker.currentIndexChanged.connect(self.template_changed)


        # Setup tabs

        # Data Tab

        self.forms = [DataTabWidget(self.proc, self.configs)]
        self.tab_widget.addTab(self.forms[0], "&Patient")
        self.forms[0].search_bar.setFocus()

        # Shortcut definition

        open_output_shortcut = QtGui.QShortcut("Ctrl+O", self)
        open_output_shortcut.activated.connect(self.forms[0].show_document)
        open_data_shortcut = QtGui.QShortcut("Ctrl+I", self)
        open_data_shortcut.activated.connect(self.forms[0].show_data_sheet)
        save_data_shortcut = QtGui.QShortcut("Ctrl+S", self)
        save_data_shortcut.activated.connect(self.save_data)

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

            for field in form_data.get("field", []):
                field_group = QtWidgets.QGroupBox(title=field.get("caption", ""))
                field_layout = QtWidgets.QVBoxLayout(field_group)
                field_layout.setAlignment(Qt.AlignmentFlag.AlignTop)
                form_group.layout().addWidget(field_group)

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

                    case _:
                        continue

                self.forms.append(new_widget)
                self.forms[0].dataLoaded.connect(new_widget.from_xml)
                field_layout.addWidget(new_widget)


    @Slot()
    def save_data(self, patient_file_name: str | None = None, silent_overwrite: bool = False) -> Path | None:
        if not patient_file_name:
            patient_file_name = self.forms[0].patient_file_name()

        data_file = self.configs["save_path"] / f"{patient_file_name}.xml"

        # Make sure we really want to overwrite existing files
        if (not silent_overwrite and data_file.exists()
                and QtWidgets.QMessageBox.StandardButton.Yes != QtWidgets.QMessageBox.question(
                    self, "Datei existiert", "Daten-Datei existiert bereits, überschreiben?")):
            return None

        data_file.parent.mkdir(exist_ok=True, parents=True)

        # Write patient data file by calling to_xml() on all tabs

        with data_file.open("bw+") as fl:
            xml = f"<?xml version=\"1.0\" encoding=\"UTF-8\" ?><data>{''.join(field.to_xml() for field in self.forms)}</data>"
            fl.write(xml.encode())

        return data_file


    @Slot()
    def to_xml(self):
        """Writes letter from collected data of all tabs"""

        # Generate patient data file
        patient_file_name = self.forms[0].patient_file_name()
        output_file = self.configs["output_path"] / self.configs["current_template"].stem / f"{patient_file_name}.docx"

        if (output_file.exists()
            and QtWidgets.QMessageBox.StandardButton.Yes != QtWidgets.QMessageBox.question(
                self, "Datei existiert", "Dokument existiert bereits, überschreiben?")):
            return None

        if not (data_file := self.save_data(patient_file_name, silent_overwrite=True)):
            return

        output_file.parent.mkdir(exist_ok=True, parents=True)

        # Load xsl style sheet and add "data" global variable referring to created data file

        translate_tab = {
            'Ä': "%C3%84", 'Ö': "%C3%96", 'Ü': "%C3%9C",
            'ä': "%C3%A4", 'ö': "%C3%B6", 'ü': "%C3%BC",
            'ß': "%C3%9F"
        }

        path_str = "".join(
            translate_tab[s] if s in translate_tab else s
            for s in str(data_file.absolute().as_posix())
        )

        xslt_proc = self.proc.new_xslt30_processor()
        xslt_proc.set_parameter("data_file", self.proc.make_string_value(path_str))
        transform = xslt_proc.compile_stylesheet(stylesheet_file=str(self.configs["xsl_file"].absolute()))

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
            with ZipFile(self.configs["current_template"]) as template:

                for doc_name in template.infolist():
                    # Just copy files that are not processed
                    if doc_name.filename not in self.configs["process_files"]:
                        output.writestr(doc_name, template.read(doc_name))
                        continue

                    # Prepare files for xsl processing by replacing {varname} with <varname />
                    with template.open(doc_name) as document:
                        xml_content = re.sub(r"(<w:t>)?(\{.+?})", repl, document.read().decode())

                    docxml = self.proc.parse_xml(xml_text=xml_content)
                    out_str = transform.transform_to_string(xdm_node=docxml)
                    output.writestr(doc_name, out_str)

        QtWidgets.QMessageBox.information(self, "Dokument geschrieben", "Dokument wurde fertig gestellt [STRG+O] zum öffnen")
        self.forms[0].letter_button.setVisible(True)
