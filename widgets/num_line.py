from PySide6 import QtWidgets, QtCore
import re


class NumLineEdit(QtWidgets.QLineEdit):
    """Sophisticated line input to find values and ranges over values from a string list
    selected by indices from its input
    """

    def __init__(self, field_id: str, result_list: list[str], start: int = 0, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self.__field_id = field_id
        self.__result_list: list[str] = result_list
        self.__start: int = start


    def to_xml(self) -> str:
        result = []
        span = False

        for token in re.finditer(r"\d+|-", self.text()):
            if token[0] == '-':
                span = True
                continue

            dig = int(token[0]) - self.__start
            if span and result:
                result.extend([i for i in range(result[-1] + 1, dig + 1)])
            result.append(dig)
            span = False

        # TODO: suboptimal, use only one loop
        vals = [self.__result_list[idx] for idx in result if 0 <= idx < len(self.__result_list)]
        values = ''.join(f"<value>{v}</value>" for v in vals)

        return f"""<field name="{self.__field_id}">{values}</field>"""