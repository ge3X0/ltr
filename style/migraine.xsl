<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">

    <xsl:template match="//ohneaura_akut"><xsl:if test="$diag_migraine_with_aura">Bei Migräne mit Aura ist der Einsatz von Triptanen während einer Aura kontraindiziert. Hier empfiehlt sich die Einnahme von Akutanalgetika wie Novaminsulfon® (Metamizol) 40° bis zu 4x täglich. Alternativ ist Diclofenac 20°, maximal 3x täglich möglich. Nach sicher abgeklungener Aurasymptomatik kann der Einsatz von Triptanen erfolgen.</xsl:if></xsl:template>
    <xsl:template name="with_and"><xsl:if test="$diag_migraine_with_aura"><xsl:text> mit und</xsl:text></xsl:if></xsl:template>
    <xsl:template match="//mitund"><xsl:if test="$diag_migraine_with_aura"><xsl:text> mit und</xsl:text></xsl:if></xsl:template>

    <xsl:template match="//aura">
        <xsl:choose>
            <xsl:when test="$diag_migraine_with_aura">
                <xsl:text>Vorübergehende einseitige Sehstörungen in Form von Fortifikationsphänomenen</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>Keine</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="//anamnese_aura">
        <xsl:if test="$diag_migraine_with_aura">
            <xsl:text>Dabei treten visuelle Auren in Form von Fortifikationsphänomenen in etwa der Hälfte der Attacken auf. </xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:template match="//anamnese_status">
        <xsl:if test="$diag_status_migrainosus">
            <xsl:text>Einzelne Attacken verlaufen häufig prolongiert als Status migraenosus. </xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:template match="//empf_vitb2">
        <xsl:if test="$diag_migraine_without_aura or $diag_migraine_with_aura">
            <w:p>
                <w:pPr>
                    <w:tabs>
                        <w:tab w:val="left" w:pos="1701"/>
                        <w:tab w:val="left" w:pos="6804"/>
                    </w:tabs>
                    <w:jc w:val="both"/>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                </w:pPr>
                <w:r>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                        <w:highlight w:val="yellow"/>
                    </w:rPr>
                    <w:t xml:space="preserve">Zur Prophylaxe der Migräne erhielt <xsl:call-template name="patient"/> die hochdosierten Nahrungsergänzungsmittel </w:t>
                </w:r>
                <w:r>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:b/>
                        <w:bCs/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                        <w:highlight w:val="yellow"/>
                    </w:rPr>
                    <w:t>Vitamin B2 und Magnesium</w:t>
                </w:r>
                <w:r>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                        <w:highlight w:val="yellow"/>
                    </w:rPr>
                    <w:t>.</w:t>
                </w:r>
            </w:p>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>