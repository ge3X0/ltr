from PySide6 import QtWidgets, QtCore


class SumLineEdit(QtWidgets.QLineEdit):
    def __init__(self, field_id: str, max_entries: int, max_sum: int, results: dict[str, str] | None, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self.sum = 0
        self.values = []
        self.result = ""

        self.__field_id = field_id
        self.__result_map = results
        self.__max_sum = max_sum
        self.__max_entries = max_entries

        self.editingFinished.connect(self.sum_input)


    @QtCore.Slot()
    def sum_input(self):
        self.values = [int(i) for i in self.text().split(',')]
        del self.values[self.__max_entries:]
        self.sum = min(sum(self.values), self.__max_sum)

        # TODO: very strange and inefficient, assumes dicts are sorted by key
        if self.__result_map is None:
            return

        for cmp, res in self.__result_map.items():
            if self.sum < int(cmp):
                self.result = res

    def to_xml(self) -> str:
        # TODO: insert result string?
        values = ''.join(f"<value>{v}</value>" for v in self.values)
        return f"""<field name="{self.__field_id}">{values}</field>"""
