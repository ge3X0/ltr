from PySide6 import QtWidgets, QtCore
import re


class NumLineEdit(QtWidgets.QLineEdit):
    def __init__(self, result_list: list[str], start: int = 0, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self.values: list[str] = []
        self.__result_list: list[str] = result_list
        self.__start: int = start

        self.editingFinished.connect(self.process_input)


    @QtCore.Slot()
    def process_input(self):
        result = []
        span = False

        for token in re.finditer(r"\d+|-", self.text()):
            if token[0] == '-':
                span = True
                continue

            dig = int(token[0])
            if span and result:
                result.extend([i for i in range(result[-1] + 1, dig)])
            result.append(dig)
            span = False

        self.values = [self.__result_list[idx] for idx in result if 0 <= idx < len(self.__result_list)]