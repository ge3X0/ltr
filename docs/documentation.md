# LTR klinisches Schreibprogramm

## Nutzung

### Suchen von Patientendaten

> [!NOTE]
> Für die Patientensuche muss der Parameter *file_db* in config.toml auf einen gültigen Pfad gesetzt sein

Patienten werden über die Suchmaske im Reiter "Patient" [Alt] + [P] gesucht. Hierfür kann die
Autovervollständigung genutzt werden. Sobald der korrekte Eintrag ausgewählt ist, werden die Daten mittels [Enter], [F5]
oder Klick auf "Neu laden" geladen.

### Überprüfen der geladenen Daten

Die allgemeinen Patientendaten werden angezeigt und können überprüft werden. Durch Klick auf "Schnuppi anzeigen"
lässt sich jederzeit die zugehörige Datendatei öffnen und bearbeiten. Nach Bearbeitung müssen die Daten durch Klick
auf "Neu laden" [F5] neu geladen werden. Diagnosen und regelmäßig eingenommene Medikamente werden gesucht,
gefundene werden tabellarisch angezeigt


#### Best-practice Diagnosen in Datendatei

Diagnosen sollten eine Diagnose pro Zeile aufgeführt werden. Dia Diagnosen sollten folgendem Muster entsprechen:

```
Diagnosen-Name ZZ00.99 Kommentare
```

Hinter dem ICD10-Schlüssel aufgeführter Text wird nicht übernommen.

> [!WARNING]
> **CAVE**: Zeilen ohne ICD10-Schlüssel werden nicht als Diagnosen übernommen und müssen ggf. manuell hinzugefügt werden.


#### Best-practice Medikamente in Datendatei

> [!NOTE]
> Medikamente können als "Alias" definiert werden, indem diese in config.toml unter *substitute_meds* gesetzt werden.
> Medikamente, die nicht eingelesen werden sollen, können mittels *ignore_meds* in config.toml definiert werden.

Feste Medikamente sollten als ein Medikament pro Zeile dem Muster folgen:

```
Medikament Name 10 mg 1-0-0
Anderes Medikament 40/1 mg/ml 0-0-15°-0
```

Andere Muster werden ggf. nicht sicher oder vollständig erkannt. Text nach dem Einnahmemuster wird als Kommentar ignoriert.
Sind Medikamente als komma-separierte Liste aufgeführt, werden sie als reine Textnamen übernommen. Kommentare können in Klammern den Medikamenten nachgestellt werden.

```
Medikament eins, Medikament zwei (Kommentar zu zwei), Drittes Medikament
```


### Brief exportieren

> [!NOTE]
> Eine Briefschablone als DOCX-Datei muss mittels *template_file* in config.toml definiert sein
> Eine XSL-Transformationsdatei muss mittels *xsl_file* in config.toml definiert sein

Nach Laden der Patientendaten kann jederzeit ein Brief exportiert werden. Durch Auswählen von "Brief exportieren" [Strg] + [E] wird ein Brief mit aktuellen Daten geschrieben. Es ist empfehlenswert, zunächst alle Formulare (s.u.) zu bearbeiten, um einen vollständigen Brief zu generieren.

> [!NOTE]
> Mittels *output_path* kann in config.toml ein Pfad, an dem die generierten Briefe abgelegt werden, definiert werden
> Mittels *save_path* kann in config.toml ein Pfad, an dem die Datendateien für den Patienten gespeichert werden, definiert werden

> [!WARNING]
> Standardmäßig werden die /word/document.xml und /word/header1.xml Dateien der definierten DOCX-Schablone auf Variablen
> überprüft. Sollten andere Dateien gewünscht sein (z.B. Footer), können diese mittels *process_files* in config.toml definiert werden


## Formulare

### Formulare definieren

Formulare können in dem Ordner *./forms/* als toml-Dateien definiert werden. Für mögliche Optionen siehe [forms.md](forms.md).
Formulare werden als Tabs geladen. Diese können per Klick, per [Alt] + [Pfeiltasten] oder per [Alt] + [Buchstaben] direkt umgeschaltet werden. Je nach Formularfeld kann die Eingabe variieren:

#### Zeileneingabe

Erwartet meistens Zahlen, entweder durch beliebige nicht-numerische Zeichen getrennt (z.B. Leerzeichen oder Komma) oder
als einzelnen Zahlenstring (hier nur im BDI2 implementiert).

#### Boxeingabe

Liste von multiple-choice Optionen, die per Maus angesteuert werden können.
Empfohlen wird, die Shortcuts zu verwenden: Taste x wählt die aktuelle Box aus und springt zur nächsten, Taste y wählt
die aktuelle Box ab (oder: "nicht aus") und springt zur nächsten. Alternativ kann mittels Tab und Shift + Tab zwischen
den Boxen gesprungen werden.

