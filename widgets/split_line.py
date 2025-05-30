from PySide6 import QtWidgets

import re


class SplitLineEdit(QtWidgets.QLineEdit):
    def __init__(self, field_id: str, max_entries: int, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self.__field_id = field_id
        self.__max_entries = max_entries

    def results(self):
        values = [int(i[0]) for i in re.finditer(r"\d+", self.text())]
        return values[:self.__max_entries]

    def to_xml(self) -> str:
        # TODO: insert result string?
        values = ''.join(f"<value>{v}</value>" for v in self.results())
        return f"""<field name="{self.__field_id}">{values}</field>"""
