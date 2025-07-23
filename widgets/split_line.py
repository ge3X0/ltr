from PySide6 import QtWidgets, QtCore
from saxonche import PyXPathProcessor

import re


class SplitLineEdit(QtWidgets.QLineEdit):
    """
    Simple line edit which finds all numbers (not digits) in its input and saves them
    """

    def __init__(self, field_id: str, max_entries: int, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self.__field_id = field_id
        self.__max_entries = max_entries

        self.setToolTip(f"Separierte Zahleneinträge, maximal {max_entries} Einträge")


    def results(self):
        values = [int(i[0]) for i in re.finditer(r"\d+", self.text())]
        if not values:
            QtWidgets.QMessageBox(self, "SplitLine", "No valid values found in {self.__field_id}")
        return values[:self.__max_entries]


    def to_xml(self) -> str:
        values = ''.join(f"<value>{v}</value>" for v in self.results())
        return f"""<field name="{self.__field_id}">{values}</field>"""

    @QtCore.Slot()
    def from_xml(self, xpath: PyXPathProcessor | None):
        if (xpath is None
        or (elements := xpath.evaluate(f'.//field[@name="{self.__field_id}"]/value')) is None):
            self.setText("")
            return

        self.setText(", ".join([e.string_value for e in elements]))
