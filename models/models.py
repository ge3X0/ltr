from PySide6 import QtCore, QtGui
from PySide6.QtCore import Qt

from .patient_data import Diagnosis, Medication


class DiagnosesTableModel(QtCore.QAbstractTableModel):
    """Table model to display PatientData Diagnosis
    :ivar diagnoses: List of dataclass Diagnosis
    """

    def __init__(self, diagnoses: list[Diagnosis]):
        super().__init__()
        self.diagnoses = diagnoses


    def rowCount(self, /, parent = ...):
        """Standard Qt rowCount for table models"""
        return len(self.diagnoses) if not parent.isValid() else 0


    def columnCount(self, /, parent = ...):
        """Standard Qt colCount for table models"""
        return 2 if not parent.isValid() else 0


    def data(self, index, /, role = ...):
        """Only use display role"""
        if role == Qt.ItemDataRole.DisplayRole:
            return getattr(self.diagnoses[index.row()], "icd10" if index.column() == 0 else "name")
        return None


    def headerData(self, section, orientation, /, role = ...):
        """Display horizontal header"""
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
        """Length of both medication lists plus 2 additional headers"""
        return len(self.base_medication) + len(self.other_medication) + 2 if not parent.isValid() else 0


    def columnCount(self, /, parent = ...):
        """Standard Qt table model"""
        return 7 if not parent.isValid() else 0


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


    def headerData(self, section, orientation, /, role = ...):
        if role != Qt.ItemDataRole.DisplayRole or orientation == Qt.Orientation.Vertical:
            return None
        return ["Name", "Dosis", "Einheit", "Morgens", "Mittags", "Abends", "Nachts"][section]
