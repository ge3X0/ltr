<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">

    <xsl:variable name="gender" select="$data//exam/gender"/>
    <xsl:variable name="diag_overuse" select="$data//patient/diagnoses/diagnosis/icd10[text() = 'G44.4']"/>
    <xsl:variable name="diag_cluster" select="$data//patient/diagnoses/diagnosis/icd10[text() = 'G44.0']"/>
    <xsl:variable name="diag_chronic_migraine" select="$data//patient/diagnoses/diagnosis/icd10[text() = 'G43.8']"/>
    <xsl:variable name="diag_migraine_without_aura" select="$data//patient/diagnoses/diagnosis/icd10[text() = 'G43.0']"/>
    <xsl:variable name="diag_migraine_with_aura" select="$data//patient/diagnoses/diagnosis/icd10[text() = 'G43.1']"/>
    <xsl:variable name="diag_status_migrainosus" select="$data//patient/diagnoses/diagnosis/icd10[text() = 'G43.2']"/>
    <xsl:variable name="diag_spaks" select="$data//patient/diagnoses/diagnosis/icd10[text() = 'G44.2']"/>
    <xsl:variable name="age" select="$data//patient/age"/>

    <xsl:include href="acute_medication.xsl"/>
    <xsl:include href="other_medication.xsl"/>
    <xsl:include href="base_medication.xsl"/>
    <xsl:include href="overuse.xsl"/>
    <xsl:include href="cluster.xsl"/>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="//vorname">
        <xsl:value-of select="$data//patient/first_name"/>
    </xsl:template>

    <xsl:template match="//nachname">
        <xsl:value-of select="$data//patient/last_name"/>
    </xsl:template>

    <xsl:template match="//geburtstag">
        <xsl:value-of select="$data//patient/birthday"/>
    </xsl:template>

    <xsl:template match="//alter">
        <xsl:value-of select="$age"/>
    </xsl:template>

    <xsl:template match="//addresse">
        <xsl:value-of select="$data//patient/address"/>
    </xsl:template>

    <xsl:template match="//arbeit">
        <xsl:value-of select="$data//patient/occupation"/>
    </xsl:template>

    <xsl:template match="//groesse">
        <xsl:value-of select="$data//exam/height"/>
    </xsl:template>

    <xsl:template match="//gewicht">
        <xsl:value-of select="$data//exam/weight"/>
    </xsl:template>

    <xsl:template match="//puls">
        <xsl:value-of select="$data//exam/pulse"/>
    </xsl:template>

    <xsl:template match="//blutdruck">
        <xsl:value-of select="$data//exam/sys"/> / <xsl:value-of select="$data//exam/dia"/>
    </xsl:template>

    <xsl:template match="//aufnahme">
        <xsl:value-of select="$data//patient/admission"/>
    </xsl:template>

    <xsl:template match="//entlassung">
        <xsl:value-of select="$data//patient/discharge"/>
    </xsl:template>

    <xsl:template match="//arzt">
        <xsl:value-of select="$data//patient/doctor_name"/>
    </xsl:template>

    <xsl:template match="//psych">
        <xsl:value-of select="$data//patient/therapist_name"/>
    </xsl:template>

    <xsl:template match="//anrede">
        <xsl:choose>
            <xsl:when test="$gender = 'm'">Herr</xsl:when>
            <xsl:otherwise>Frau</xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="//ersie">
        <xsl:choose>
            <xsl:when test="$gender = 'm'">er</xsl:when>
            <xsl:otherwise>sie</xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="//ersie_cap">
        <xsl:choose>
            <xsl:when test="$gender = 'm'">Er</xsl:when>
            <xsl:otherwise>Sie</xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="seineihre">
        <xsl:choose>
            <xsl:when test="$gender = 'm'">seine</xsl:when>
            <xsl:otherwise>ihre</xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="patient">
        <xsl:choose>
            <xsl:when test="$gender = 'm'">der Patient</xsl:when>
            <xsl:otherwise>die Patientin</xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="//patient">
        <xsl:call-template name="patient"/>
    </xsl:template>

    <xsl:template match="//patient_dat">
        <xsl:choose>
            <xsl:when test="$gender = 'm'">dem Patienten</xsl:when>
            <xsl:otherwise>der Patientin</xsl:otherwise>
        </xsl:choose>
    </xsl:template>

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

    <xsl:template match="//midas">
        <xsl:variable name="val_sum" select="sum($data//field[@name='midas']/value)"/>
        <xsl:variable name="comment">
            <xsl:choose>
                <xsl:when test="$val_sum &lt; 6">keiner</xsl:when>
                <xsl:when test="$val_sum &lt; 11">leichten</xsl:when>
                <xsl:when test="$val_sum &lt; 21">mäßigen</xsl:when>
                <xsl:when test="$val_sum &lt; 31">schweren</xsl:when>
                <xsl:otherwise>sehr schweren</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="val1" select="$data//field[@name='midas']/value[1]/text()"/>
        <xsl:variable name="val2" select="$data//field[@name='midas']/value[2]/text()"/>
        <xsl:variable name="val3" select="$data//field[@name='midas']/value[3]/text()"/>
        <xsl:variable name="val4" select="$data//field[@name='midas']/value[4]/text()"/>
        <xsl:variable name="val5" select="$data//field[@name='midas']/value[5]/text()"/>
        Im MIDAS-Score erreicht <xsl:call-template name="patient"/> einen Wert von <xsl:value-of select="$val_sum"/>, einer <xsl:value-of select="$comment"/> Beeinträchtigung entsprechend.
        <xsl:if test="$val1 != 0"> An <xsl:value-of select="$val1"/> Tagen in den letzten 3 Monaten ist <xsl:call-template name="patient"/> wegen der Schmerzen nicht zur Arbeit gegangen. </xsl:if>
        <xsl:if test="$val2 != 0"> An <xsl:value-of select="$val2"/> Tagen in den letzten 3 Monaten war die Leistungsfähigkeit am Arbeitsplatz um die Hälfte oder mehr eingeschränkt. </xsl:if>
        <xsl:if test="$val3 != 0"> An <xsl:value-of select="$val3"/> Tagen in den letzten 3 Monaten konnte <xsl:call-template name="patient"/> wegen der Schmerzen keine Hausarbeit verrichten. </xsl:if>
        <xsl:if test="$val4 != 0"> An <xsl:value-of select="$val4"/> Tagen in den letzten 3 Monaten war die Leistungsfähigkeit im Haushalt um die Hälfte oder mehr eingeschränkt. </xsl:if>
        <xsl:if test="$val5 != 0"> An <xsl:value-of select="$val5"/> Tagen in den letzten 3 Monaten konnte <xsl:call-template name="patient"/> an familiären, sozialen oder Freizeitaktivitäten wegen der Schmerzen nicht teilnehmen. </xsl:if>
    </xsl:template>

    <xsl:template match="//whodas">
        <xsl:variable name="area">
            <xsl:for-each select="$data//field[@name='whodas']/value">
                <xsl:value-of select="." />
                <xsl:if test="position() &lt; last() - 1">
                    <xsl:text>, </xsl:text>
                </xsl:if>
                <xsl:if test="position() = last() - 1">
                    <xsl:text> und </xsl:text>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="val1" select="$data//field[@name='whodas']/value[1]/text()"/>
        <xsl:variable name="val2" select="$data//field[@name='whodas']/value[2]/text()"/>
        <xsl:variable name="val3" select="$data//field[@name='whodas']/value[3]/text()"/>
        Diese Angaben spiegeln sich auch im WHODAS-2.0, insbesondere im Bereich <xsl:value-of select="$area"/> wider.
        <xsl:if test="$val1 != 0">An <xsl:value-of select="$val1"/> in den letzten 30 Tagen traten diese Schwierigkeiten auf.</xsl:if>
        <xsl:if test="$val2 != 0">An <xsl:value-of select="$val2"/> in den letzten 30 Tagen war <xsl:call-template name="patient"/> aufgrund der Gesundheitsprobleme absolut unfähig alltägliche Aktivitäten oder <xsl:call-template name="seineihre"/> Arbeit zu verrichten.</xsl:if>
        <xsl:if test="$val3 != 0">An <xsl:value-of select="$val3"/> Tagen von 30 Tagen musste <xsl:call-template name="patient"/> aufgrund der Gesundheitsprobleme alltägliche Aktivitäten oder <xsl:call-template name="seineihre"/> Arbeit reduzieren.</xsl:if>
        Somit besteht eine ausgeprägte Beeinträchtigung sowohl der Lebensqualität als auch der Arbeitsfähigkeit.
    </xsl:template>

    <xsl:template match="//vorbehandlungen">
        <xsl:variable name="docs">
            <xsl:for-each select="$data//field[@name='treatments']/value">
                <xsl:value-of select="." />
                <xsl:if test="position() &lt; last() - 1">
                    <xsl:text>, </xsl:text>
                </xsl:if>
                <xsl:if test="position() = last() - 1">
                    <xsl:text> und </xsl:text>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
        Die bisherige Behandlung erfolgte bei Ärzten mit der Fach- bzw. Zusatzbezeichnung <xsl:value-of select="$docs"/>.
    </xsl:template>

    <xsl:template match="symptome">
        <xsl:variable name="s">
            <xsl:for-each select="$data//field[@name='symptoms']/value">
                <xsl:if test="text() != ''">
                    <xsl:value-of select="." />
                    <xsl:if test="position() &lt; last()">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>

        <xsl:value-of select="$s"/>
    </xsl:template>

    <xsl:template match="bdi_ii">
        <xsl:variable name="s">
            <xsl:for-each select="$data//field[@name='bdi_ii']/value">
                <xsl:if test="text() != ''">
                    <xsl:value-of select="." />
                    <xsl:if test="position() &lt; last() - 1">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                    <xsl:if test="position() = last() - 1">
                        <xsl:text> und </xsl:text>
                    </xsl:if>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>

        <xsl:value-of select="$s"/>
    </xsl:template>

    <xsl:template match="chronisch">
        <xsl:variable name="s">
            <xsl:for-each select="$data//field[@name='chronisch']/value">
                <xsl:if test="text() != ''">
                    <xsl:value-of select="." />
                    <xsl:if test="position() &lt; last()">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>

        <xsl:value-of select="$s"/>
    </xsl:template>
</xsl:stylesheet>