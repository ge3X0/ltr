from PySide6 import QtWidgets, QtCore
from PySide6.QtCore import Qt
from saxonche import PyXPathProcessor
from itertools import batched
from typing import override
from collections.abc import Iterable


class XCheckBox(QtWidgets.QCheckBox):
    """Used for custom focus forwarding on pressing 'x' or 'y'"""

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)               # pyright: ignore[reportUnknownArgumentType]
        self.setFocusPolicy(Qt.FocusPolicy.StrongFocus)


    @override
    def keyReleaseEvent(self, e, /):
        k = e.key()
        if k == Qt.Key.Key_X or k == Qt.Key.Key_Y:
            self.setChecked(k == Qt.Key.Key_X)
            if (next_box := self.nextInFocusChain()) is not None:
                next_box.setFocus()
        else:
            return super().keyReleaseEvent(e)


class XBox(QtWidgets.QWidget):

    def __init__(self, field_id: str, values: list[str], rows: int = -1, *args, **kwargs):

        def __make_checkboxes(vals: Iterable[str]):
            col = QtWidgets.QVBoxLayout()

            for v in vals:
                # Insert separator for "--"
                if v == "--":
                    col.addSpacing(18)
                    continue

                cb = XCheckBox(v)
                self.__checkboxes.append(cb)
                col.addWidget(cb)

            layout.addLayout(col)


        super().__init__(*args, **kwargs)               # pyright: ignore[reportUnknownArgumentType]

        self.__field_id = field_id
        self.__checkboxes: list[QtWidgets.QCheckBox] = []

        layout = QtWidgets.QHBoxLayout(self)

        if rows > 0:
            for val_batch in batched(values, rows):
                __make_checkboxes(val_batch)
        else:
            __make_checkboxes(values)

        button_col = QtWidgets.QVBoxLayout()
        button_col.setAlignment(Qt.AlignmentFlag.AlignTop)
        select_all_btn = QtWidgets.QPushButton("Auswahl umkehren")
        button_col.addWidget(select_all_btn)
        select_all_btn.setMaximumWidth(220)
        select_all_btn.clicked.connect(self.invert_selection)

        layout.addLayout(button_col)

    
    @QtCore.Slot()
    def invert_selection(self):
        """Inverts selection of checkboxes"""
        for cb in self.__checkboxes:
            cb.setChecked(not cb.isChecked())


    def results(self) -> list[str]:
        """Returns list of all values of selected checkboxes"""
        return [cb.text() for cb in self.__checkboxes if cb.isChecked()]


    def to_xml(self) -> str:
        values = ''.join(f"<value>{v}</value>" for v in self.results() if '*' not in v)
        return f"""<field name="{self.__field_id}">{values}</field>"""


    @QtCore.Slot()
    def from_xml(self, xpath: PyXPathProcessor | None):
        if (xpath is None
        or (elements := xpath.evaluate(f'.//field[@name="{self.__field_id}"]/value')) is None):
            for cb in self.__checkboxes:
                cb.setChecked(False)
            return

        text_list = [e.string_value for e in elements if e is not None]
        for cb in self.__checkboxes:
            if '*' in cb.text():
                continue
            cb.setChecked(cb.text() in text_list)
