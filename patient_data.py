from enum import IntEnum
from dataclasses import dataclass, field
from typing import Self
from datetime import datetime, timedelta


class Field(IntEnum):
    """Fields in data *.docx table files"""
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
    DiagMisuse = 39
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

    def to_xml(self):
        return f"""
<diagnosis>
    <icd10>{self.icd10}</icd10>
    <name>{self.name}</name>
</diagnosis>"""


@dataclass
class Medication:
    name: str = "Unbekannt"
    dosis: str = "Unbekannt"
    unit: str = ""
    morning: str = "0"
    noon: str = "0"
    evening: str = "0"
    night: str = "0"

    def to_xml(self) -> str:
        return f"""
<entry>
    <name>{self.name}</name>
    <dosis>{self.dosis}</dosis>
    <unit>{self.unit}</unit>
    <morning>{self.morning}</morning>
    <noon>{self.noon}</noon>
    <evening>{self.evening}</evening>
    <night>{self.night}</night>
</entry>"""


@dataclass
class PatientData:
    first_name: str = "Unbekannt"
    last_name: str = "Unbekannt"
    birthday: datetime = datetime.now()
    address: str = "Unbekannt"
    occupation: str = "Unbekannt"
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


    def to_xml(self, date_format: str = "%d.%m.%Y") -> str:
        today = datetime.now()
        return f"""<patient>
    <first_name>{self.first_name}</first_name>
    <last_name>{self.last_name}</last_name>
    <birthday>{self.birthday.strftime(date_format)}</birthday>
    <age>{int((today.year - self.birthday.year) - ((today.month, today.day) < (self.birthday.month, self.birthday.day)))}</age>
    <address>{self.address}</address>
    <occupation>{self.occupation}</occupation>
    <doctor_name>{self.doc_name}</doctor_name>
    <therapist_name>{self.pt_name}</therapist_name>
    <admission>{self.admission.strftime(date_format)}</admission>
    <discharge>{self.discharge.strftime(date_format)}</discharge>
    <ekg2>{(self.admission + timedelta(days=7)).strftime(date_format)}</ekg2>
    <allergies>{self.allergies}</allergies>
    
    <diagnoses>{''.join(d.to_xml() for d in self.diagnoses)}</diagnoses>
    <medication when="current" which="acute">{''.join(m.to_xml() for m in self.medication['current']['acute'])}</medication>
    <medication when="current" which="base">{''.join(m.to_xml() for m in self.medication['current']['base'])}</medication>
    <medication when="current" which="other">{''.join(m.to_xml() for m in self.medication['current']['other'])}</medication>
    <medication when="former" which="acute">{''.join(m.to_xml() for m in self.medication['former']['acute'])}</medication>
    <medication when="former" which="base">{''.join(m.to_xml() for m in self.medication['former']['base'])}</medication>
</patient>"""