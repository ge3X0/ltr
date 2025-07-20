from PySide6 import QtWidgets, QtCore
from saxonche import PyXPathProcessor

import re



class EvalLine(QtWidgets.QLineEdit):
    """QLineEdit provided with an array of an array of values to map its numeric input onto
    :ivar results: List of strings retrieved from mapping input onto provided values
    """

    def __init__(self, field_id: str, values: list[dict[str, str]], start: int, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self.__field_id = field_id
        self.__values = values
        self.__start = start

        self.setToolTip(f"Liste von {len(values)} Zahlen, handelt es sich um einzelne Ziffern pro Posten, kann auf eine Separierung verzichtet werden")


    def to_xml(self) -> str:
        results: list[str] = []

        # Test if we look for separations or not
        it = self.text() if ',' not in self.text() and ' ' not in self.text() else [m[0] for m in re.finditer(r"\d+", self.text())]

        for val_idx, s in enumerate(it):
            if val_idx >= len(self.__values):
                break

            if not s.isdigit():
                QtWidgets.QMessageBox.warning(self, "Eval Line", f"Unerwartetes Zeichen '{s}' in {self.__field_id}")
                continue

            if -1 < (idx := int(s) - self.__start) < len(self.__values[val_idx]):
                results.append(self.__values[val_idx][str(idx)])
            else:
                QtWidgets.QMessageBox.warning(self, "Eval Line", f"Wert {idx} ist kein gültiger Wert an Position {val_idx + 1}")
                results.append("Unbekannt")

        if len(results) != len(self.__values):
            QtWidgets.QMessageBox.information(self, "Eval Line", f"Es wurden {len(results)} von erwarteten {len(self.__values)} in {self.__field_id} gefunden.\nÜbrige Stellen werden mit Standardwerten gefüllt, überhängige werden ignoriert")

            while len(results) < len(self.__values):
                results.append(self.__values[len(results)]["0"])

        values = ''.join(f"<value>{v}</value>" for v in results)
        return f"""<field name="{self.__field_id}">{values}</field>"""


    @QtCore.Slot()
    def from_xml(self, xpath: PyXPathProcessor | None):
        if (xpath is None
            or (elements := xpath.evaluate(f'.//field[@name="{self.__field_id}"]/value')) is None):
            self.setText("")
            return

        vals: list[str] = []

        for idx, e in enumerate(elements):
            if idx >= len(self.__values):
                break

            for val, stm in self.__values[idx].items():
                if stm == e.string_value:
                    vals.append(str(int(val) + self.__start))
                    break

            # Append standard value, if no other matched
            else:
                vals.append(str(self.__start))

        while len(vals) < len(self.__values):
            vals.append(str(self.__start))

        self.setText(", ".join(vals))

