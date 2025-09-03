from PySide6 import QtCore, QtGui
from PySide6.QtCore import Qt

from typing import override

from .patient_data import Diagnosis, Medication, PatientData


class DiagnosesTableModel(QtCore.QAbstractTableModel):
    def __init__(self, diagnoses: list[Diagnosis]):
        super().__init__()
        self.diagnoses: list[Diagnosis] = diagnoses


    @override
    def rowCount(self, /, parent = ...):
        return len(self.diagnoses) if not parent.isValid() else 0


    @override
    def columnCount(self, /, parent = ...):
        return 2 if not parent.isValid() else 0


    @override
    def data(self, index, /, role = ...):
        if role == Qt.ItemDataRole.DisplayRole:
            return getattr(self.diagnoses[index.row()], "icd10" if index.column() == 0 else "name")
        return None


    @override
    def headerData(self, section, orientation, /, role = ...):
        if role != Qt.ItemDataRole.DisplayRole or orientation == Qt.Orientation.Vertical:
            return None

        return "ICD 10" if section == 0 else "Bezeichnung"


class MedicationTableModel(QtCore.QAbstractTableModel):
    def __init__(self, base_medication: list[Medication], other_medication: list[Medication]):
        super().__init__()
        self.base_medication: list[Medication] = base_medication
        self.other_medication: list[Medication] = other_medication


    @override
    def rowCount(self, /, parent = ...):
        # Length of both medication lists plus 2 additional headers
        return len(self.base_medication) + len(self.other_medication) + 2 if not parent.isValid() else 0


    @override
    def columnCount(self, /, parent = ...):
        return 7 if not parent.isValid() else 0


    @override
    def data(self, index, /, role = ...):
        # First and "middle" row are "Section Headers"
        if index.row() == 0 or index.row() - 1 == len(self.base_medication):
            match role:
                case Qt.ItemDataRole.DisplayRole:
                    return "Basismedikation" if index.row() == 0 else "Sonstige Medikation"
                case Qt.ItemDataRole.TextAlignmentRole:
                    return Qt.AlignmentFlag.AlignCenter
                case Qt.ItemDataRole.BackgroundRole:
                    return QtGui.QBrush("grey")
                case _:
                    pass

        # Display cell data
        elif role == Qt.ItemDataRole.DisplayRole:
            # Row index minus first "Section Header" in row 0
            idx = index.row() - 1
            attr_name = ["name", "dosis", "unit", "morning", "noon", "evening", "night"][index.column()]

            # Use row index to find correct Medication list to display
            if idx < len(self.base_medication):
                return getattr(self.base_medication[idx], attr_name)

            # Row index minus another "Section header" in row len(self.base_medication)
            return getattr(self.other_medication[idx - len(self.base_medication) - 1], attr_name)

        # Display cell alignment
        elif role == Qt.ItemDataRole.TextAlignmentRole:
            if index.column() == 0:
                return Qt.AlignmentFlag.AlignLeft | Qt.AlignmentFlag.AlignVCenter
            return Qt.AlignmentFlag.AlignCenter

        return None


    @override
    def headerData(self, section, orientation, /, role = ...):
        if role != Qt.ItemDataRole.DisplayRole or orientation == Qt.Orientation.Vertical:
            return None
        return ["Name", "Dosis", "Einheit", "Morgens", "Mittags", "Abends", "Nachts"][section]


class PatientTableModel(QtCore.QAbstractTableModel):
    def __init__(self, data: PatientData):
        super().__init__()
        self.patient_data: list[tuple[str, str]] = [
            ("Name", f"{data.first_name} {data.last_name}"),
            ("Geburtsdatum", f"{data.birthday.strftime('%d.%m.%Y')}"),
            ("Aufenthalt", f"{data.admission.strftime('%d.%m.%Y')} - {data.discharge.strftime('%d.%m.%Y')}"),
            ("Wohnhaft", data.address),
            ("Beruf", data.occupation),
            ("GdB", str(data.gdb)),
            ("Telefon", data.phone),
            ("Arzt", data.doc_name),
            ("PT", data.pt_name)
        ]

    @override
    def rowCount(self, /, parent = ...): 
        return 9 if not parent.isValid() else 0


    @override
    def columnCount(self, /, parent = ...):
        return 2 if not parent.isValid() else 0

    @override
    def data(self, index, /, role = ...):
        if role == Qt.ItemDataRole.DisplayRole:
            return self.patient_data[index.row()][index.column()]
        return None


    @override
    def headerData(self, section, orientation, /, role = ...):
        return None
