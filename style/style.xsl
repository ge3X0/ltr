<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs">

    <!-- Read Values from internal data file (fed by ltr.exe) !-->
    <xsl:param name="data_file" required="yes"/>
    <xsl:variable name="data" select="document($data_file)"/>


    <!-- Variable Definition !-->

    <xsl:variable name="print_full" select="true()"/>


    <!-- General Variables !-->

    <xsl:variable name="gender" select="$data//exam/gender"/>
    <xsl:variable name="age" select="$data//patient/age"/>

    <!-- Diagnosis Variables !-->

    <xsl:variable name="diag_overuse" select="$print_full || $data//patient/diagnoses/diagnosis/icd10[text() = 'G44.4']"/>
    <xsl:variable name="diag_cluster" select="$print_full || $data//patient/diagnoses/diagnosis/icd10[text() = 'G44.0']"/>
    <xsl:variable name="diag_chronic_migraine" select="$print_full || $data//patient/diagnoses/diagnosis/icd10[text() = 'G43.8/3']"/>
    <xsl:variable name="diag_migraine_without_aura" select="$print_full || $data//patient/diagnoses/diagnosis/icd10[text() = 'G43.0']"/>
    <xsl:variable name="diag_migraine_with_aura" select="$print_full || $data//patient/diagnoses/diagnosis/icd10[text() = 'G43.1']"/>
    <xsl:variable name="diag_status_migrainosus" select="$print_full || $data//patient/diagnoses/diagnosis/icd10[text() = 'G43.2']"/>
    <xsl:variable name="diag_spaks" select="$print_full || $data//patient/diagnoses/diagnosis/icd10[text() = 'G44.2']"/>
    <xsl:variable name="diag_trigeminus" select="$print_full || $data//patient/diagnoses/diagnosis/icd10[contains(., 'G50')]"/>


    <!-- Special Functions !-->

    <!-- Generate comma-separated string list !-->
    <xsl:template name="string-list">
        <xsl:param name="selection"/>

        <xsl:for-each select="$selection[not(. = '')]">
            <xsl:value-of select="." />
            <xsl:if test="last() != 1">
                <xsl:if test="position() &lt; last() - 1">
                    <xsl:text>, </xsl:text>
                </xsl:if>
                <xsl:if test="position() = last() - 1">
                    <xsl:text> und </xsl:text>
                </xsl:if>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>


    <!-- Include Files !-->


    <xsl:include href="format.xsl"/>		<!-- Basic formatting templates !-->

    <xsl:include href="overuse.xsl"/>
    <xsl:include href="acute_medication.xsl"/>
    <xsl:include href="other_medication.xsl"/>
    <xsl:include href="base_medication.xsl"/>
    <xsl:include href="cluster.xsl"/>
    <xsl:include href="migraine.xsl"/>
    <xsl:include href="phenomenology.xsl"/>


    <!-- Copy all Nodes without other template match !-->


    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>


    <!-- General data template !-->


    <xsl:template match="//vorname"><xsl:value-of select="$data//patient/first_name"/></xsl:template>
    <xsl:template match="//nachname"><xsl:value-of select="$data//patient/last_name"/></xsl:template>
    <xsl:template match="//geburtstag"><xsl:value-of select="$data//patient/birthday"/></xsl:template>
    <xsl:template match="//alter"><xsl:value-of select="$age"/></xsl:template>
    <xsl:template match="//addresse"><xsl:value-of select="$data//patient/address"/></xsl:template>
    <xsl:template match="//arbeit"><xsl:value-of select="$data//patient/occupation"/></xsl:template>
    <xsl:template match="//groesse"><xsl:value-of select="$data//exam/height"/></xsl:template>
    <xsl:template match="//gewicht"><xsl:value-of select="$data//exam/weight"/></xsl:template>
    <xsl:template match="//bmi"><xsl:value-of select="format-number($data//exam/bmi, '#.##')"/></xsl:template>
    <xsl:template match="//puls"><xsl:value-of select="$data//exam/pulse"/></xsl:template>
    <xsl:template match="//blutdruck"><xsl:value-of select="$data//exam/sys"/> / <xsl:value-of select="$data//exam/dia"/></xsl:template>
    <xsl:template match="//aufnahme"><xsl:value-of select="$data//patient/admission"/></xsl:template>
    <xsl:template match="//entlassung"><xsl:value-of select="$data//patient/discharge"/></xsl:template>
    <xsl:template match="//ekg_zeit"><xsl:value-of select="$data//patient/ekg2" /></xsl:template>
    <xsl:template match="//arzt"><xsl:value-of select="$data//patient/doctor_name"/></xsl:template>
    <xsl:template match="//psych"><xsl:value-of select="$data//patient/therapist_name"/></xsl:template>
    <xsl:template match="//allergien"><xsl:value-of select="$data//patient/allergies"/></xsl:template>

    <xsl:template match="//heute"> 
	<xsl:value-of select="format-date(current-date(), '[D01].[M01].[Y]')" />
    </xsl:template>

    <xsl:template match="//morgen">
	<xsl:value-of select="format-date(current-date() + xs:dayTimeDuration('P1D'), '[D01].[M01].[Y]')" />
    </xsl:template>


    <!-- Gender templates !-->


    <xsl:template match="//anrede">
        <xsl:choose>
            <xsl:when test="$gender = 'm'">Herr</xsl:when>
            <xsl:when test="$gender = 'f'">Frau</xsl:when>
            <xsl:otherwise>Herr/Frau</xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="//anrede_dat">
        <xsl:choose>
            <xsl:when test="$gender = 'm'">Herrn</xsl:when>
            <xsl:when test="$gender = 'f'">Frau</xsl:when>
            <xsl:otherwise>Herrn/Frau</xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="//ersie">
        <xsl:choose>
            <xsl:when test="$gender = 'm'">er</xsl:when>
            <xsl:when test="$gender = 'f'">sie</xsl:when>
            <xsl:otherwise>er/sie</xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="//ersie_cap">
        <xsl:choose>
            <xsl:when test="$gender = 'm'">Er</xsl:when>
            <xsl:when test="$gender = 'f'">Sie</xsl:when>
            <xsl:otherwise>Er/Sie</xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="seineihre">
        <xsl:choose>
            <xsl:when test="$gender = 'm'">seine</xsl:when>
            <xsl:when test="$gender = 'f'">ihre</xsl:when>
            <xsl:otherwise>seine/ihre</xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="patient">
        <xsl:choose>
            <xsl:when test="$gender = 'm'">der Patient</xsl:when>
            <xsl:when test="$gender = 'f'">die Patientin</xsl:when>
            <xsl:otherwise>der Patient/die Patientin</xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="//patient"><xsl:call-template name="patient"/></xsl:template>

    <xsl:template match="//patient_dat">
        <xsl:choose>
            <xsl:when test="$gender = 'm'">dem Patienten</xsl:when>
            <xsl:when test="$gender = 'f'">der Patientin</xsl:when>
            <xsl:otherwise>dem Patienten/der Patientin</xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <!-- List of diagnoses !-->


    <xsl:template match="//w:p[.//diagnosen]">
        <xsl:for-each select="$data//patient/diagnoses/diagnosis">
            <w:p>
                <w:pPr>
                    <w:ind w:left="1134" w:hanging="1134"/>
                    <w:jc w:val="both"/>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:color w:val="000000"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                </w:pPr>
                <w:r>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:t><xsl:value-of select="icd10"/></w:t>
                </w:r>
                <w:r>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:tab/>
                </w:r>
                <w:r>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:color w:val="000000"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:t><xsl:value-of select="name"/></w:t>
                </w:r>
            </w:p>
        </xsl:for-each>
    </xsl:template>

    <!-- Score text blocks !-->

    <xsl:template match="//midas">
        <xsl:variable name="val_sum" select="sum($data//field[@name='midas']/value)"/>
        <xsl:variable name="severity">
            <xsl:choose>
                <xsl:when test="$val_sum &lt; 6">keiner</xsl:when>
                <xsl:when test="$val_sum &lt; 11">einer leichten</xsl:when>
                <xsl:when test="$val_sum &lt; 21">einer mäßigen</xsl:when>
                <xsl:when test="$val_sum &lt; 31">einer schweren</xsl:when>
                <xsl:otherwise>einer sehr schweren</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:variable name="val" select="$data//field[@name='midas']/value"/>

        <xsl:text>Im MIDAS-Score erreicht </xsl:text><xsl:call-template name="patient"/><xsl:text> einen Wert von </xsl:text>
        <xsl:value-of select="$val_sum"/><xsl:text>, </xsl:text><xsl:value-of select="$severity"/><xsl:text> Beeinträchtigung entsprechend.</xsl:text>

        <xsl:if test="$val[1] != 0">
            <xsl:text> An </xsl:text>
            <xsl:value-of select="$val[1]"/>
            <xsl:text> Tagen in den letzten 3 Monaten ist </xsl:text>
            <xsl:call-template name="patient"/>
            <xsl:text> wegen der Schmerzen nicht zur Arbeit gegangen.</xsl:text>
        </xsl:if>
        <xsl:if test="$val[2] != 0">
            <xsl:text> An </xsl:text>
            <xsl:value-of select="$val[2]"/>
            <xsl:text> Tagen in den letzten 3 Monaten war die Leistungsfähigkeit am Arbeitsplatz um die Hälfte oder mehr eingeschränkt.</xsl:text>
        </xsl:if>
        <xsl:if test="$val[3] != 0">
            <xsl:text> An </xsl:text>
            <xsl:value-of select="$val[3]"/>
            <xsl:text> Tagen in den letzten 3 Monaten konnte </xsl:text>
            <xsl:call-template name="patient"/>
            <xsl:text> wegen der Schmerzen keine Hausarbeit verrichten.</xsl:text>
        </xsl:if>
        <xsl:if test="$val[4] != 0">
            <xsl:text> An </xsl:text>
            <xsl:value-of select="$val[4]"/>
            <xsl:text> Tagen in den letzten 3 Monaten war die Leistungsfähigkeit im Haushalt um die Hälfte oder mehr eingeschränkt.</xsl:text>
        </xsl:if>
        <xsl:if test="$val[5] != 0">
            <xsl:text> An </xsl:text>
            <xsl:value-of select="$val[5]"/>
            <xsl:text> Tagen in den letzten 3 Monaten konnte </xsl:text>
            <xsl:call-template name="patient"/>
            <xsl:text> an familiären, sozialen oder Freizeitaktivitäten wegen der Schmerzen nicht teilnehmen.</xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:template match="//whodas">
        <xsl:variable name="val" select="$data//field[@name='whodas']/value"/>

        <xsl:text>Diese Angaben spiegeln sich auch im WHODAS-2.0, insbesondere im Bereich </xsl:text>
        <xsl:call-template name="string-list">
            <xsl:with-param name="selection" select="$data//field[@name='sections']/value"/>
        </xsl:call-template>
        <xsl:text> wider.</xsl:text>

        <xsl:if test="$val[1] != 0">
            <xsl:text> An </xsl:text>
            <xsl:value-of select="$val[1]"/>
            <xsl:text> in den letzten 30 Tagen traten diese Schwierigkeiten auf.</xsl:text>
        </xsl:if>

        <xsl:if test="$val[2] != 0">
            <xsl:text> An </xsl:text>
            <xsl:value-of select="$val[2]"/>
            <xsl:text> in den letzten 30 Tagen war </xsl:text>
            <xsl:call-template name="patient"/>
            <xsl:text> aufgrund der Gesundheitsprobleme absolut unfähig alltägliche Aktivitäten oder </xsl:text>
            <xsl:call-template name="seineihre"/>
            <xsl:text> Arbeit zu verrichten.</xsl:text>
        </xsl:if>

        <xsl:if test="$val[3] != 0">
            <xsl:text> An </xsl:text>
            <xsl:value-of select="$val[3]"/>
            <xsl:text> Tagen von 30 Tagen musste </xsl:text>
            <xsl:call-template name="patient"/>
            <xsl:text> aufgrund der Gesundheitsprobleme alltägliche Aktivitäten oder </xsl:text>
            <xsl:call-template name="seineihre"/>
            <xsl:text> Arbeit reduzieren.</xsl:text>
        </xsl:if>

        <xsl:text> Somit besteht eine ausgeprägte Beeinträchtigung sowohl der Lebensqualität als auch der Arbeitsfähigkeit.</xsl:text>
    </xsl:template>

    <xsl:variable name="medical_values" as="xs:string*" select="(
    'Allgemeinmedizin', 'Endokrinologie', 'Dermatologie', 'Pädiatrie', 'Neurologie', 'Onkologie',
    'Proktologie', 'Psychiatrie', 'Psychotherapie', 'Rheumatologie', 'Urologie', 'Allergologie',
    'Anästhesiologie', 'Ophthalmologie', 'Kardiologie', 'Chirurgie', 'Gynäkologie', 'HNO',
    'Innere Medizin', 'Pneumologie', 'MKG-Chirurgie', 'Nervenheilkunde', 'Neurochirurgie', 'Orthopädie',
    'Dipl.-Psychologe', 'Radiologie', 'Schmerztherapie', 'Zahnheilkunde')"/>

    <xsl:variable name="non_medical_values" as="xs:string*" select="(
    'Akupunktur', 'Apotheker', 'Bademeister', 'Chiropraktiker', 'Geistheiler', 'Hypnotiseure',
    'Pflegepersonal', 'Masseure', 'Naturheilkundler', 'Heilpraktiker', 'Physiotherapeuten', 'Priester')"/>

    <xsl:variable name="all_treats" select="$medical_values,$non_medical_values"/>

    <xsl:variable name="medical_treats" select="$data//field[@name='treatments']/value[. = $medical_values]" />
	
    <xsl:variable name="other_treats" select="$data//field[@name='treatments']/value[. = $non_medical_values]"/>

    <xsl:template match="//vorbehandlungen">
        <xsl:call-template name="string-list">
            <xsl:with-param name="selection" select="$data//field[@name='treatments']/value"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="//medizinische_vorbehandlungen">
	<xsl:call-template name="string-list">
	    <xsl:with-param name="selection" select="$medical_treats"/>
	</xsl:call-template>
    </xsl:template>

    <xsl:template match="//andere_vorbehandlungen">
	<xsl:call-template name="string-list">
	    <xsl:with-param name="selection" select="$other_treats"/>
	</xsl:call-template>
    </xsl:template>

    <xsl:template match="//eigene_vorbehandlungen">
	<xsl:call-template name="string-list">
		<xsl:with-param name="selection" select="$data//field[@name='treatments']/value[not(. = $all_treats)]"/>
	</xsl:call-template>
    </xsl:template>

    <xsl:template match="//symptome">
        <xsl:call-template name="string-list">
            <xsl:with-param name="selection" select="$data//field[@name='symptoms']/value"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="//bdi_ii">
        <xsl:call-template name="string-list">
            <xsl:with-param name="selection" select="$data//field[@name='bdi_ii']/value"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="//chronisch">
        <xsl:call-template name="string-list">
            <xsl:with-param name="selection" select="$data//field[@name='chronisch']/value"/>
        </xsl:call-template>
    </xsl:template>
</xsl:stylesheet>
