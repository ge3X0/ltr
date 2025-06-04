from PySide6 import QtCore, QtGui
from PySide6.QtCore import Qt

from .patient_data import Diagnosis, Medication



class DiagnosesTableModel(QtCore.QAbstractTableModel):
    """Table model to display PatientData Diagnosis"""

    def __init__(self, diagnoses: list[Diagnosis]):
        super().__init__()
        self.diagnoses = diagnoses

    def rowCount(self, /, parent = ...):
        return len(self.diagnoses) if not parent.isValid() else 0

    def columnCount(self, /, parent = ...):
        return 2 if not parent.isValid() else 0

    def data(self, index, /, role = ...):
        if role == Qt.ItemDataRole.DisplayRole:
            return getattr(self.diagnoses[index.row()], "icd10" if index.column() == 0 else "name")
        return None

    def headerData(self, section, orientation, /, role = ...):
        if role != Qt.ItemDataRole.DisplayRole or orientation == Qt.Orientation.Vertical:
            return None

        return "ICD 10" if section == 0 else "Bezeichnung"


class MedicationTableModel(QtCore.QAbstractTableModel):
    """Table model to display PatientData Medication"""

    def __init__(self, base_medication: list[Medication], other_medication: list[Medication]):
        super().__init__()
        self.base_medication = base_medication
        self.other_medication = other_medication

    def rowCount(self, /, parent = ...):
        return len(self.base_medication) + len(self.other_medication) + 2 if not parent.isValid() else 0

    def columnCount(self, /, parent = ...):
        return 7 if not parent.isValid() else 0

    def data(self, index, /, role = ...):
        # Display "Section Headers"
        if index.row() == 0 or index.row() - 1 == len(self.base_medication):
            match role:
                case Qt.ItemDataRole.DisplayRole:
                    return "Basismedikation" if index.row() == 0 else "Sonstige Medikation"
                case Qt.ItemDataRole.TextAlignmentRole:
                    return Qt.AlignmentFlag.AlignCenter
                case Qt.ItemDataRole.BackgroundRole:
                    return QtGui.QBrush("grey")

        elif role == Qt.ItemDataRole.DisplayRole:
            idx = index.row() - 1
            attr_name = ["name", "dosis", "unit", "morning", "noon", "evening", "night"][index.column()]

            if idx < len(self.base_medication):
                return getattr(self.base_medication[idx], attr_name)

            return getattr(self.other_medication[idx - len(self.base_medication) - 1], attr_name)

        elif role == Qt.ItemDataRole.TextAlignmentRole:
            if index.column() == 0:
                return Qt.AlignmentFlag.AlignLeft | Qt.AlignmentFlag.AlignVCenter
            else:
                return Qt.AlignmentFlag.AlignCenter

        return None

    def headerData(self, section, orientation, /, role = ...):
        if role != Qt.ItemDataRole.DisplayRole or orientation == Qt.Orientation.Vertical:
            return None
        return ["Name", "Dosis", "Einheit", "Morgens", "Mittags", "Abends", "Nachts"][section]
