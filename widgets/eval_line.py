from PySide6 import QtWidgets, QtCore
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

        self.setToolTip(f"Liste von {len(values)} Zahlen, separiert oder bei Einzelnummern auch ohne Leerzeichen")


    def to_xml(self) -> str:
        results = []
        it = self.text() if ',' not in self.text() and ' ' not in self.text() else re.finditer(r"\d+", self.text())

        for val_idx, s in enumerate(it):
            if val_idx >= len(self.__values):
                QtWidgets.QMessageBox.warning(self, "Eval Line", f"Zu viele Einträge in {self.__field_id}")
                break

            if not s.isdigit():
                QtWidgets.QMessageBox.warning(self, "Eval Line", f"Unerwartetes Zeichen '{s}' in {self.__field_id}")
                continue

            if -1 < (idx := int(s) - self.__start) < len(self.__values[val_idx]):
                results.append(self.__values[val_idx][str(idx)])
            else:
                results.append("Unbekannter Wert")

        while len(results) < len(self.__values):
            results.append(self.__values[len(results)]["0"])

        values = ''.join(f"<value>{v}</value>" for v in results)
        return f"""<field name="{self.__field_id}">{values}</field>"""


    @QtCore.Slot()
    def from_xml(self, xml):
        element = xml.find(f'.//field[@name="{self.__field_id}"]')
        self.setText(", ".join([e.text for e in element.iter("value")]))

