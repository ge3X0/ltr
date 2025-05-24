import re

n = r"\s*([\d.,/]+°?)\s*"
med_pattern = re.compile(r"([/.\-()\w\s\däöüÄÖÜß]+)\s+"  # Name
                         r"([\d.,/]+)\s*"   # Dosis
                         r"((?:g|mg|µg|ug|IE|ml|l|Hub|Kps\.?|Tbl\.?|°|Trpf\.?)(?:\s*/\s*(?:g|mg|µg|ug|ml|l))?)"
                         f"{n}-{n}-{n}(?:-{n})?")


for m in med_pattern.finditer("Tramban (PCM/Tramal) 500/40 mg/mg 1-0-1/2"):
    print(m)
    for g in m.groups():
        print(g)