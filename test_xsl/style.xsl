<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:variable name="data" select="document('data.xml')"/>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="//vorname">
        <p><xsl:value-of select="$data//patient/vorname/text()"/></p>
    </xsl:template>

    <xsl:template match="//nachname">
        <p><xsl:value-of select="$data//patient/nachname/text()"/></p>
    </xsl:template>

    <xsl:template match="//geburtstag">
        <p><xsl:value-of select="$data//patient/geburtstag/text()"/></p>
    </xsl:template>

    <xsl:template match="//aufnahme">
        <p><xsl:value-of select="$data//patient/aufnahme/text()"/></p>
    </xsl:template>

    <xsl:template match="//entlassung">
        <p><xsl:value-of select="$data//patient/entlassung/text()"/></p>
    </xsl:template>

    <xsl:template match="//anrede">
        <p><xsl:value-of select="$data//patient/anrede/text()"/></p>
    </xsl:template>

    <xsl:template match="//patient">
        <p><xsl:value-of select="$data//patient/patient/text()"/></p>
    </xsl:template>

    <xsl:template match="//patient_gen">
        <p><xsl:value-of select="$data//patient/patient_gen/text()"/></p>
    </xsl:template>

    <xsl:template match="//midas">
        <xsl:variable name="val1" select="$data//field[@name='midas']/value[1]/text()"/>
        <xsl:variable name="val2" select="$data//field[@name='midas']/value[2]/text()"/>
        <xsl:variable name="val3" select="$data//field[@name='midas']/value[3]/text()"/>
        <xsl:variable name="val4" select="$data//field[@name='midas']/value[4]/text()"/>
        <xsl:variable name="val5" select="$data//field[@name='midas']/value[5]/text()"/>

        <p>
            Im MIDAS-Score erreicht die Patientin einen Wert von <xsl:value-of select="sum($data//field[@name='midas']/value)"/>, einer sehr schweren Beeinträchtigung entsprechend.
            <xsl:if test="$val1 != 0"> An <xsl:value-of select="$val1"/> Tagen in den letzten 3 Monaten ist die Patientin wegen der Schmerzen nicht zur Arbeit gegangen. </xsl:if>
            <xsl:if test="$val2 != 0"> An <xsl:value-of select="$val2"/> Tagen in den letzten 3 Monaten war die Leistungsfähigkeit am Arbeitsplatz um die Hälfte oder mehr eingeschränkt. </xsl:if>
            <xsl:if test="$val3 != 0"> An <xsl:value-of select="$val3"/> Tagen in den letzten 3 Monaten konnte die Patientin wegen der Schmerzen keine Hausarbeit verrichten. </xsl:if>
            <xsl:if test="$val4 != 0"> An <xsl:value-of select="$val4"/> Tagen in den letzten 3 Monaten war die Leistungsfähigkeit im Haushalt um die Hälfte oder mehr eingeschränkt. </xsl:if>
            <xsl:if test="$val5 != 0"> An <xsl:value-of select="$val5"/> Tagen in den letzten 3 Monaten konnte die Patientin an familiären, sozialen oder Freizeitaktivitäten wegen der Schmerzen nicht teilnehmen. </xsl:if>
        </p>
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

        <p>Diese Angaben spiegeln sich auch im WHODAS-2.0, insbesondere im Bereich <xsl:value-of select="$area"/>
        wider. An <xsl:value-of select="$val1"/> in den letzten 30 Tagen traten diese Schwierigkeiten auf.
        An <xsl:value-of select="$val2"/> in den letzten 30 Tagen war der Patient aufgrund der Gesundheitsprobleme absolut unfähig alltägliche Aktivitäten oder seine Arbeit zu verrichten,
        an <xsl:value-of select="$val3"/> Tagen von 30 Tagen musste der Patient aufgrund seiner Gesundheitsprobleme alltägliche Aktivitäten oder seine Arbeit reduzieren.
        Somit besteht eine ausgeprägte Beeinträchtigung sowohl der Lebensqualität als auch der Arbeitsfähigkeit.</p>
    </xsl:template>

    <xsl:template match="//treatments">
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
        <p>
            Die bisherige Behandlung erfolgte bei Ärzten mit der Fach- bzw. Zusatzbezeichnung <xsl:value-of select="$docs"/>.
        </p>
    </xsl:template>

    <xsl:template match="bdi_ii">
        <xsl:variable name="symptoms">
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

        <p>Aktuell beschreibt <xsl:value-of select="$patient"/> in der Selbstauskunft <xsl:value-of select="symptoms"/></p>
    </xsl:template>
</xsl:stylesheet>