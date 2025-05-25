from PySide6 import QtWidgets, QtCore


class NumLineEdit(QtWidgets.QLineEdit):
    def __init__(self, result_list: list[str], start: int = 0, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self.values: list[str] = []
        self.__result_list: list[str] = result_list
        self.__start: int = start

        self.editingFinished.connect(self.process_input)


    @QtCore.Slot()
    def process_input(self):
        # TODO: throw on no int
        self.values = [
            self.__result_list[idx]
            for i in self.text().split(',')
            if 0 <= (idx := int(i) - self.__start) < len(self.__result_list)
        ]