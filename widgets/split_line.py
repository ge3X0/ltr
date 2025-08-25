from saxonche import PyXPathProcessor

import re


class SplitLineEdit(QtWidgets.QLineEdit):
    # TODO: This could be EvalLine?
    """
    Simple line edit which finds all numbers (not digits) in its input and saves them
    """

    def __init__(self, field_id: str, max_entries: int, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self.__field_id = field_id
        self.__max_entries = max_entries

        self.setToolTip(
            f"Erwartet {max_entries} numerische Einträge, Ziffern können ohne Trennzeichen geschrieben werden,"
            "wenn jeder Posten nur aus einer Ziffer besteht")


    def results(self) -> list[int]:
        used_separators: bool = any(not c.isdigit() for c in self.text())

        if used_separators:
            values = [int(i[0]) for i in re.finditer(r"\d+", self.text())]
        else:
            values = [int(i) for i in self.text()]

        if not values:
            QtWidgets.QMessageBox.warning(self, f"{self.__field_id}",
                f"{self.__field_id} enthält keine gültigen Werte")

        if len(values) > self.__max_entries:
            QtWidgets.QMessageBox.warning(self, f"{self.__field_id}",
                f"Nur {self.__max_entries} Einträge werden prozessiert")

        elif len(values) < self.__max_entries:
            QtWidgets.QMessageBox.warning(self, f"{self.__field_id}",
                f"Erwartete {self.__max_entries} in {self.__field_id}. Fülle mit 0 auf.")

            while len(values) < self.__max_entries:
                values.append(0)

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

