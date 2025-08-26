from enum import Enum
from dataclasses import dataclass
from datetime import datetime
import re

from saxonche import PyXdmNode, PyXPathProcessor

from .patient_data import PatientData, Field, Diagnosis, Medication
from .configuration import Configuration


class PatientDataErrorType(Enum):
    NoError = 0
    MissingTables = 1
    WrongNameFormat = 2
    BirthdayFormat = 3
    AdmissionDate = 4
    DischargeDate = 5


@dataclass
class PatientDataError:
    error_type: PatientDataErrorType = PatientDataErrorType.NoError
    message: str = ""


class PatientDataLoader:
    icd_num: str = r"(?P<icd10>[A-Z]\d{2}(?:\.\d+)?)"
    icd_name: str = r"(?P<icd_name>\b[,./:\-\w\s?äöüÄÖÜß]+)"

    icd_first_pattern: re.Pattern[str] = re.compile(f"^\\s*{icd_num}\\s+?{icd_name}.*$")
    icd_pattern: re.Pattern[str] = re.compile(f"^\\s*{icd_name}{icd_num}.*$")

    md_name: str = r"([/.\-()\w\säöüÄÖÜß?]+?)"
    md_dosage: str = r"([\-\d?.,/]+)\s*"
    md_unit: str = r"((?:g|mg|µg|ug|ng|IE|ml|l|Hub|Kapsel|Kps\.?|Tablette|Tbl\.?|°|Tropfen|Trpf\.?)(?:\s*/\s*(?:g|mg|µg|ug|ng|ml|l|d|Tag|h|Stunde))?)"
    n: str = r"\s*([\d.,/]+°?)\s*"

    med_pattern: re.Pattern[str] = re.compile(f"^{md_name}\\s{md_dosage}{md_unit}{n}-{n}-{n}(?:-{n})?.*?$")
    simple_med_pattern: re.Pattern[str] = re.compile(
        f"(?:^|,\\s*)"      # Start of line or after comma
        f"{md_name}"
        f"(?:\\s{md_dosage}{md_unit})?"
        f"(?=$|,\\s)")


    def __init__(self, configs: Configuration):
        self.patient_data: PatientData = PatientData()
        self.configs: Configuration = configs


    # Internal method to extract medication from cell
    def read_meds(self, text_line: str, when_key: str, how_key: str):
        """Tries to read medication from string
        :param text_line: str, Multiline text to extract medication from
        :param when_key: str, Used to sort into medication
        :param how_key: str, Used to sort into medication
        """

        meds: list[Medication] = []

        # Match medication per line
        for entry in map(lambda l: re.sub(r"\(.+?\)", "", l).strip(), text_line.splitlines()):
            if med := self.med_pattern.match(entry):
                med_name = med[1].strip()

                if med_name in self.configs["ignore_meds"]:
                    continue

                meds.append(Medication(
                    name=med_name, dosis=med[2], unit=med[3],
                    morning=med[4], noon=med[5], evening=med[6], night=med[7] if med[7] is not None else "0"
                ))

            else:
                for med in self.simple_med_pattern.finditer(entry):
                    med_name = med[1].strip()

                    if med_name in self.configs["ignore_meds"]:
                        continue

                    meds.append(Medication(
                        name=med_name,
                        dosis=med[2] if med[2] is not None else "?",
                        unit=med[3] if med[3] is not None else "",
                    ))

        # Substitute medication names with alternatives from config.toml
        for md in meds:
            for word, subst in self.configs["substitute_meds"].items():
                md.name = md.name.replace(word, subst)

        self.patient_data.medication[when_key][how_key] = meds


    def load_patient_data(self,
        xpath: PyXPathProcessor,
        patient_data_xml: PyXdmNode) -> PatientDataError:
        """Get data from *.docx file
        :param patient_data_xml: etree object containing docx-tabledata
        """

        self.patient_data = PatientData()

        # xpath = self.proc.new_xpath_processor()
        xpath.declare_namespace("w", "http://schemas.openxmlformats.org/wordprocessingml/2006/main")
        xpath.set_context(xdm_item=patient_data_xml)

        # Walk over each cell in table
        for cell_idx, cell in enumerate(xpath.evaluate(".//w:tc")):  # pyright: ignore
            if cell is None:
                return PatientDataError(
                    PatientDataErrorType.MissingTables,
                    "Unerwarteter Fehler: Keine Tabellen in Datenblatt")

            xpath.set_context(xdm_item=cell) # pyright: ignore[reportArgumentType]

            # Group by paragraph, ignore lists

            if (p_nodes := xpath.evaluate(".//w:p[not(.//w:numPr)]")) is None:
                continue

            text: str = '\n'.join(p.string_value for p in p_nodes) # pyright: ignore[reportOptionalMemberAccess]

            # Process per field
            match cell_idx:
                case Field.Name:
                    names = list(map(lambda x: x.strip(), text.splitlines()[0].split(',')))
                    if len(names) != 2:
                        return PatientDataError(
                            PatientDataErrorType.WrongNameFormat,
                            "Patientenname in Datendatei scheint falsch formatiert")

                    self.patient_data.last_name, self.patient_data.first_name = names


                case Field.Birthday:
                    try:
                        self.patient_data.birthday = datetime.strptime(text.splitlines()[0], "%d.%m.%Y")
                    except ValueError:
                        return PatientDataError(
                            PatientDataErrorType.BirthdayFormat,
                            "Geburtsdatum ist falsch formatiert")


                case Field.Address:
                    line = text.replace('\n', '')
                    if (m := re.match(r"([\w\s.,-]+?)-?([\d\s]+)$", line)) is not None:
                        self.patient_data.address = m[1].strip()
                        self.patient_data.phone = m[2].strip()
                    else:
                        self.patient_data.address = line.strip()


                case Field.Occupation:
                    self.patient_data.occupation = text


                case Field.Doctor:
                    # Remove "Arzt: "-prefix
                    if (m := re.match(r"Arzt:\s*(.+)", text)):
                        self.patient_data.doc_name = m[1].strip()
                    else:
                        self.patient_data.doc_name = text


                case Field.Psychotherapist:
                    # Remove "Psych.: "-prefix
                    if (m := re.match(r"Psych\.:\s*(.+)", text)):
                        self.patient_data.pt_name = m[1].strip()
                    else:
                        self.patient_data.pt_name = text


                case Field.Admission:
                    try:
                        self.patient_data.admission = datetime.strptime(text, "%d.%m.%Y")
                    except ValueError:
                        return PatientDataError(
                            PatientDataErrorType.AdmissionDate,
                            "Aufnahmedatum ist falsch formatiert")


                case Field.Discharge:
                    try:
                        self.patient_data.discharge = datetime.strptime(text, "%d.%m.%Y")
                    except ValueError:
                        return PatientDataError(
                            PatientDataErrorType.DischargeDate,
                            "Entlassungsdatum ist falsch formatiert")


                case Field.Allergies if text:
                    self.patient_data.allergies = text


                case Field.DiagPain | Field.DiagMisuse | Field.DiagPsych | Field.DiagSom:
                    for line in text.splitlines():
                        # Find Diagnoses with ICD first
                        if not (m := self.icd_first_pattern.search(line)):
                            # If not found: Find with ICD in text
                            if not (m := self.icd_pattern.search(line)):
                                continue

                        diag = Diagnosis(m["icd_name"], m["icd10"])
                        subst: list[str] | None = self.configs["substitute_diagnoses"].get(diag.icd10, None)

                        if subst is not None:   # No Substitution
                            if not subst:       # Empty list -> ignore diagnosis
                                continue
                            diag.icd10, diag.name = subst

                        # TODO: Add sorting option to config.toml
                        if diag.icd10 == "G44.4":
                            self.patient_data.diagnoses.insert(0, diag)
                        else:
                            self.patient_data.diagnoses.append(diag)


                case Field.MedCurrAcute:
                    self.read_meds(text, "current", "acute")


                case Field.MedCurrBase:
                    self.read_meds(text, "current", "base")


                case Field.MedCurrOther:
                    self.read_meds(text, "current", "other")


                case Field.MedFormAcute:
                    self.read_meds(text, "former", "acute")


                case Field.MedFormBase:
                    self.read_meds(text, "former", "base")

                case _:
                    pass

        return PatientDataError()

