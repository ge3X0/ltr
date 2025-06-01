from PySide6 import QtWidgets
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


    def to_xml(self) -> str:
        if ',' not in self.text() and ' ' not in self.text():
            values = [int(s) for s in self.text()]
        else:
            values = [int(s[0]) for s in re.finditer(r"\d+", self.text())]

        while len(values) != len(self.__values):
            values.append(0)

        results = []
        for v, choices in zip(values, self.__values):
            results.append(choices.get(str(v - self.__start), "Unbekannter Wert"))

        values = ''.join(f"<value>{v}</value>" for v in results)
        return f"""<field name="{self.__field_id}">{values}</field>"""
