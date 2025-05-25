from PySide6 import QtWidgets, QtCore


class SumLineEdit(QtWidgets.QLineEdit):
    def __init__(self, max_entries: int, max_sum: int, results: dict[str, str] | None, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self.sum = 0
        self.numbers = []
        self.result = ""

        self.__result_map = results
        self.__max_sum = max_sum
        self.__max_entries = max_entries

        self.editingFinished.connect(self.sum_input)


    @QtCore.Slot()
    def sum_input(self):
        self.numbers = [int(i) for i in self.text().split(',')]
        del self.numbers[self.__max_entries:]
        self.sum = min(sum(self.numbers), self.__max_sum)

        # TODO: very strange and inefficient, assumes dicts are sorted by key
        if self.__result_map is None:
            return

        for cmp, res in self.__result_map.items():
            if self.sum < int(cmp):
                self.result = res

