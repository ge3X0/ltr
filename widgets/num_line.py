from PySide6 import QtWidgets, QtCore
from saxonche import PyXPathProcessor
import re


class NumLineEdit(QtWidgets.QLineEdit):
    """Sophisticated line input to find values and ranges over values from a string list
    selected by indices from its input
    """

    def __init__(self, field_id: str, result_list: list[str], start: int = 0, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self.__field_id: str = field_id
        self.__result_list: list[str] = result_list
        self.__start: int = start

        self.setToolTip(f"Separierte Zahleneinträge zwischen {start} und {len(result_list) + start}, auch Blöcke z.B. 2-15 sind möglich")


    def to_xml(self) -> str:
        result: list[int] = []
        span = False

        for token in re.finditer(r"\d+|-", self.text()):
            if token[0] == '-':
                span = True
                continue

            dig = int(token[0]) - self.__start
            if span and result:
                result.extend(range(result[-1] + 1, dig))
            result.append(dig)
            span = False

        # TODO: suboptimal, use only one loop
        vals = [self.__result_list[idx] for idx in result if 0 <= idx < len(self.__result_list)]
        values = ''.join(f"<value>{v}</value>" for v in vals)

        return f"""<field name="{self.__field_id}">{values}</field>"""

    @QtCore.Slot()
    def from_xml(self, xpath: PyXPathProcessor | None):
        if (xpath is None
        or (elements := xpath.evaluate(f'.//field[@name="{self.__field_id}"]/value')) is None):
            self.setText("")
            return

        self.setText(", ".join([e.string_value for e in elements]))
