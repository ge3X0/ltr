from PySide6 import QtWidgets, QtCore


class EvalLine(QtWidgets.QLineEdit):
    def __init__(self, field_id: str, values: list[dict[str, str]], start: int, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self.__field_id = field_id
        self.__values = values
        self.__start = start
        self.results = []

        self.editingFinished.connect(self.process_input)


    @QtCore.Slot()
    def process_input(self):
        if ',' in self.text():
            values = [int(s) for s in self.text()]
        else:
            values = [int(s) for s in self.text().split(',')]

        self.results = []
        for v, choices in zip(values, self.__values):
            self.results.append(choices.get(str(v - self.__start), "Unbekannter Wert"))

    def to_xml(self) -> str:
        values = ''.join(f"<value>{v}</value>" for v in self.results)
        return f"""<field name="{self.__field_id}">{values}</field>"""
