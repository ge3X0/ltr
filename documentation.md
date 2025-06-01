# LTR klinisches Schreibprogramm

## Nutzung

### Suchen von Patientendaten

> [!NOTE]
> Für die Patientensuche muss der Parameter *file_db* in config.toml auf einen gültigen Pfad gesetzt sein

- Patienten werden über die Suchmaske im Reiter "Patient" (Shortcut: Alt + P) gesucht
- Hierfür kann die automatische Autovervollständigung genutzt werden
- Sobald der korrekte Eintrag ausgewählt ist, werden die Daten mittels Enter oder Klick auf "Neu laden" geladen

### Überprüfen der geladenen Daten

- Die allgemeinen Patientendaten werden angezeigt und können überprüft werden
- Durch Klick auf "Schnuppi anzeigen" lässt sich jederzeit die zugehörige Datendatei öffnen und bearbeiten
- Nach Bearbeitung müssen die Daten durch Klick auf "Neu laden" (oder Shortcut: F5) neu geladen werden
- Diagnosen und regelmäßig eingenommene Medikamente werden gesucht, gefundene werden tabellarisch angezeigt


#### Best-practice Diagnosen in Datendatei

- Diagnosen sollten eine Diagnose pro Zeile aufgeführt werden
- Das Muster sollte *Diagnose-Name* *ZZ00.00* enstprechen
- Hinter dem ICD10-Schlüssel aufgeführter Text wird nicht übernommen

> [!WARNING]
> cave: Zeilen ohne ICD10-Schlüssel werden nicht als Diagnosen übernommen und müssen ggf. manuell hinzugefügt werden.


#### Best-practice Medikamente in Datendatei

> [!INFO]
> Medikamente können als "Aliase" definiert werden, indem diese in config.toml unter *substitute_meds* gesetzt werden
> Medikamente, die nicht eingelesen werden sollen, können mittels *ignore_meds* in config.toml definiert werden

- Feste Medikamente sollten als ein Medikament pro Zeile dem Muster folgen:

```
Medikament Name 10 mg 1-0-0
Anderes Medikament 40/1 mg/ml 0-0-15°
```

- Andere Muster sind nicht garantiert, erkannt zu werden
- Text nach dem Einnahmemuster wird als Kommentar ignoriert
- Sind Medikamente als komma-separierte Liste aufgeführt, werden sie als reine Textnamen übernommen
- Kommentare können in Klammern den Medikamenten nachgestellt werden

```
Medikament eins, Medikament zwei (Kommentar zu zwei), Drittes Medikament
```

### Brief exportieren

> [!INFO]
> Eine Briefschablone als DOCX-Datei muss mittels *template_file* in config.toml definiert sein
> Eine XSL-Transformationsdatei muss mittels *xsl_file* in config.toml definiert sein

- Nach Laden der Patientendaten kann jederzeit ein Brief exportiert werden
- Durch Auswählen von "Brief exportieren" (Shortcut: Strg + E) wird ein Brief mit aktuellen Daten geschrieben
- Es ist empfehlenswert, zunächst alle Formulare (s.u.) zu bearbeiten, um einen vollständigen Brief zu generieren

> [!INFO]
> Mittels *output_path* kann in config.toml ein Pfad, an dem die generierten Briefe abgelegt werden, definiert werden
> Mittels *save_path* kann in config.toml ein Pfad, an dem die Datendateien für den Patienten gespeichert werden, definiert werden

> [!WARNING]
> Standardmäßig werden die /word/document.xml und /word/header1.xml Dateien der definierten DOCX-Schablone auf Variablen
> überprüft. Sollten andere Dateien gewünscht sein (z.B. Footer), können diese mittels *process_files* in config.toml definiert werden


## Formulare

