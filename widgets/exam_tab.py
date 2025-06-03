from PySide6 import QtWidgets, QtCore


class ExamTab(QtWidgets.QWidget):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        layout = QtWidgets.QVBoxLayout(self)

        gender_group = QtWidgets.QGroupBox("Geschlecht")
        layout.addWidget(gender_group)
        layout.setAlignment(QtCore.Qt.AlignmentFlag.AlignTop)
        gender_layout = QtWidgets.QHBoxLayout(gender_group)

        self.gender_btn_group = QtWidgets.QButtonGroup()

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

        body_group = QtWidgets.QGroupBox("Größe und Gewicht")
        layout.addWidget(body_group)
        body_layout = QtWidgets.QGridLayout(body_group)
        body_layout.addWidget(QtWidgets.QLabel("Größe"), 0, 0)
        body_layout.addWidget(QtWidgets.QLabel("Gewicht"), 0, 1)
        self.height_inp = QtWidgets.QLineEdit()
        self.weight_inp = QtWidgets.QLineEdit()
        body_layout.addWidget(self.height_inp, 1, 0)
        body_layout.addWidget(self.weight_inp, 1, 1)

        rr_group = QtWidgets.QGroupBox("Blutdruck und Puls")
        layout.addWidget(rr_group)
        rr_layout = QtWidgets.QGridLayout(rr_group)
        rr_layout.addWidget(QtWidgets.QLabel("Systolisch"), 0, 0)
        rr_layout.addWidget(QtWidgets.QLabel("Diastolisch"), 0, 1)
        rr_layout.addWidget(QtWidgets.QLabel("Puls"), 0, 2)
        self.sys_inp = QtWidgets.QLineEdit()
        self.dia_inp = QtWidgets.QLineEdit()
        self.p_inp = QtWidgets.QLineEdit()
        rr_layout.addWidget(self.sys_inp, 1, 0)
        rr_layout.addWidget(self.dia_inp, 1, 1)
        rr_layout.addWidget(self.p_inp, 1, 2)

    def to_xml(self) -> str:
        return f"""<exam>
        <gender>{self.gender_btn_group.checkedButton().text()}</gender>
        <height>{self.height_inp.text()}</height>
        <weight>{self.weight_inp.text()}</weight>
        <sys>{self.sys_inp.text()}</sys>
        <dia>{self.dia_inp.text()}</dia>
        <pulse>{self.p_inp.text()}</pulse>
        </exam>"""

    @QtCore.Slot()
    def from_xml(self, xml):
        gender = dict(zip(["m", "f", "d"], self.gender_btn_group.buttons()))
        gender[xml.find("//exam/gender").text].setChecked(True)

        self.height_inp.setText(xml.find("//exam/height").text)
        self.weight_inp.setText(xml.find("//exam/weight").text)
        self.sys_inp.setText(xml.find("//exam/sys").text)
        self.dia_inp.setText(xml.find("//exam/dia").text)
        self.p_inp.setText(xml.find("//exam/pulse").text)



