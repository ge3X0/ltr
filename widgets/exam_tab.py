from PySide6 import QtWidgets, QtCore
from saxonche import PyXPathProcessor

from enum import IntEnum


class ExamTab(QtWidgets.QWidget):
    class Field(IntEnum):
        Height = 0
        Weight = 1
        Systolic = 2
        Diastolic = 3
        Pulse = 4


    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        layout = QtWidgets.QVBoxLayout(self)

        # Create gender buttons

        gender_group = QtWidgets.QGroupBox("Geschlecht")
        layout.addWidget(gender_group)
        layout.setAlignment(QtCore.Qt.AlignmentFlag.AlignTop)
        gender_layout = QtWidgets.QHBoxLayout(gender_group)

        self.gender_btn_group: QtWidgets.QButtonGroup = QtWidgets.QButtonGroup()

        m_btn = QtWidgets.QRadioButton("m")
        self.gender_btn_group.addButton(m_btn)
        gender_layout.addWidget(m_btn)

        f_btn = QtWidgets.QRadioButton("f")
        self.gender_btn_group.addButton(f_btn)
        gender_layout.addWidget(f_btn)

        d_btn = QtWidgets.QRadioButton("d")
        self.gender_btn_group.addButton(d_btn)
        gender_layout.addWidget(d_btn)

        f_btn.setChecked(True)

        # Create value inputs

        self.inp: list[QtWidgets.QLineEdit] = []

        body_group = QtWidgets.QGroupBox("Größe und Gewicht")
        layout.addWidget(body_group)
        body_layout = QtWidgets.QGridLayout(body_group)
        body_layout.addWidget(QtWidgets.QLabel("Größe"), 0, 0)
        body_layout.addWidget(QtWidgets.QLabel("Gewicht"), 0, 1)
        self.inp.append(QtWidgets.QLineEdit())
        self.inp.append(QtWidgets.QLineEdit())
        body_layout.addWidget(self.inp[ExamTab.Field.Height], 1, 0)
        body_layout.addWidget(self.inp[ExamTab.Field.Weight], 1, 1)

        rr_group = QtWidgets.QGroupBox("Blutdruck und Puls")
        layout.addWidget(rr_group)
        rr_layout = QtWidgets.QGridLayout(rr_group)
        rr_layout.addWidget(QtWidgets.QLabel("Systolisch"), 0, 0)
        rr_layout.addWidget(QtWidgets.QLabel("Diastolisch"), 0, 1)
        rr_layout.addWidget(QtWidgets.QLabel("Puls"), 0, 2)
        self.inp.append(QtWidgets.QLineEdit())
        self.inp.append(QtWidgets.QLineEdit())
        self.inp.append(QtWidgets.QLineEdit())
        rr_layout.addWidget(self.inp[ExamTab.Field.Systolic], 1, 0)
        rr_layout.addWidget(self.inp[ExamTab.Field.Diastolic], 1, 1)
        rr_layout.addWidget(self.inp[ExamTab.Field.Pulse], 1, 2)


    def to_xml(self) -> str:
        field_names: list[str] = [
            "Größe", "Gewicht", "RR systolisch", "RR diastolisch", "Puls" ]
        invalid_fields: list[int] = []
        values: list[int] = []

        for idx, inp in enumerate(self.inp):
            try:
                values.append(int(inp.text()))
            except ValueError:
                invalid_fields.append(idx)
                values.append(0)

        if invalid_fields:
            QtWidgets.QMessageBox.warning(self, "Exam Tab",
                f"Untersuchungsfelder {', '.join(field_names[i] for i in invalid_fields)} enthalten nicht-numerische Werte, werden mit 0 ersetzt")

        weight: int = values[ExamTab.Field.Weight]
        height: float = values[ExamTab.Field.Height] / 100
        bmi: float = 0 if height == 0 else weight / (height * height)

        return f"""
<exam>
    <gender>{self.gender_btn_group.checkedButton().text()}</gender>
    <height>{values[ExamTab.Field.Height]}</height>
    <weight>{values[ExamTab.Field.Weight]}</weight>
    <bmi>{bmi}</bmi>
    <sys>{values[ExamTab.Field.Systolic]}</sys>
    <dia>{values[ExamTab.Field.Diastolic]}</dia>
    <pulse>{values[ExamTab.Field.Pulse]}</pulse>
</exam>"""


    @QtCore.Slot()
    def from_xml(self, xpath: PyXPathProcessor | None):
        if xpath is None or xpath.evaluate_single(".//exam") is None:
            self.gender_btn_group.buttons()[1].setChecked(True)
            for inp in self.inp:
                inp.setText("")
            return

        gender = dict(zip(["m", "f", "d"], self.gender_btn_group.buttons()))

        gender[xpath.evaluate_single(".//exam/gender").string_value].setChecked(True)

        values = ["height", "weight", "sys", "dia", "pulse"]
        for i, v in enumerate(values):
            self.inp[i].setText(xpath.evaluate_single(f".//exam/{v}").string_value)

