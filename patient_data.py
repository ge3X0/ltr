from enum import IntEnum
from dataclasses import dataclass, field
from typing import Self
from datetime import datetime


class Field(IntEnum):
    Name = 0
    Birthday = 1
    Address = 4
    Occupation = 8
    Doctor = 19
    Psychotherapist = 20
    Admission = 23
    Discharge = 25
    Allergies = 31
    DiagPain = 36
    DiagMisuse = 29
    DiagPsych = 42
    DiagSom = 45
    MedCurrAcute = 51
    MedCurrBase = 52
    MedCurrOther = 55
    MedFormAcute = 58
    MedFormBase = 59


@dataclass
class Diagnosis:
    name: str = "Unbekannt"
    icd10: str = "Unbekannt"

    def __eq__(self, other: Self | str):
        if isinstance(other, str):
            return self.icd10 == str
        return self.icd10 == other.icd10


@dataclass
class Medication:
    name: str = "Unbekannt"
    dosis: str = "Unbekannt"
    unit: str = ""
    morning: str = "0"
    noon: str = "0"
    evening: str = "0"
    night: str = "0"


@dataclass
class PatientData:
    first_name: str = "Unbekannt"
    last_name: str = "Unbekannt"
    birthday: datetime = datetime.now()
    address: str = "Unbekannt"
    doc_name: str = "Unbekannt"
    pt_name: str = "Unbekannt"
    admission: datetime = datetime.now()
    discharge: datetime = datetime.now()
    allergies: str = "Keine bekannt"

    diagnoses: list[Diagnosis] = field(default_factory=list)
    medication: dict[str, dict[str, list[Medication]]] = field(default_factory=lambda: {
        "current": {
            "acute": [],
            "base": [],
            "other": []
        },
        "former": {
            "acute": [],
            "base": []
        }
    })