from PySide6 import QtWidgets, QtCore


class EvalLine(QtWidgets.QLineEdit):
    """QLineEdit provided with an array of an array of values to map its numeric input onto
    :ivar results: List of strings retrieved from mapping input onto provided values
    """

    def __init__(self, field_id: str, values: list[dict[str, str]], start: int, *args, **kwargs):
        """

        :param field_id: Identifier for processing in xml
        :param values: List of values, containing key -> value pairs
        :param start: value subtracted from each entry in line edit
        :param args:
        :param kwargs:
        """
        super().__init__(*args, **kwargs)

        self.__field_id = field_id
        self.__values = values
        self.__start = start

        self.results: list[str] = []

        self.editingFinished.connect(self.process_input)


    @QtCore.Slot()
    def process_input(self):
        # If no "," is found, each digit is taken as value
        if ',' not in self.text():
            values = [int(s) for s in self.text()]
        else:
            values = [int(s) for s in self.text().split(',')]

        if len(values) != len(self.__values):
            # TODO: throw
            pass

        self.results = []
        for v, choices in zip(values, self.__values):
            self.results.append(choices.get(str(v - self.__start), "Unbekannter Wert"))


    def to_xml(self) -> str:
        values = ''.join(f"<value>{v}</value>" for v in self.results)
        return f"""<field name="{self.__field_id}">{values}</field>"""
