<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">

    <xsl:template match="//pause_a">
        <xsl:if test="$diag_overuse">Aufgrund der Intensität der Schmerzen, insbesondere der Migräne, werden die Grenzschwellen für die Entstehung von Kopfschmerzen bei Medikamentenübergebrauch eindeutig überschritten.</xsl:if>
    </xsl:template>
    <xsl:template match="//pause_b"><xsl:if test="$diag_overuse">Es besteht eine Aufrechterhaltung und weitere Verstärkung des sowieso bestehenden Kopfschmerzes bei Medikamentenübergebrauch.</xsl:if></xsl:template>
    <xsl:template match="//pause_entzug"><xsl:if test="$diag_overuse">sowie der Entzugsbehandlung</xsl:if></xsl:template>
    <xsl:template match="//pause_dauer"><xsl:if test="$diag_overuse">und der notwendigen Minimierung des Rückfallrisikos in den Analgetika-Übergebrauch und Analgetika-Fehlgebrauch </xsl:if></xsl:template>
    <xsl:template match="//pause_rebound"><xsl:if test="$diag_overuse">, schwere Rebound-Kopfschmerzen mussten mit Escape-Medikation behandelt werden, welche die multimodalen Behandlungsmaßnahmen behinderten</xsl:if></xsl:template>
    <xsl:template match="//w:p[.//pause_cortison]">
        <xsl:if test="$diag_overuse">
            <w:p>
                <w:pPr>
                    <w:tabs>
                        <w:tab w:val="left" w:pos="1701"/>
                        <w:tab w:val="left" w:pos="6804"/>
                    </w:tabs>
                    <w:jc w:val="both"/>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:b/>
                        <w:bCs/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                        <w:highlight w:val="yellow"/>
                    </w:rPr>
                </w:pPr>
                <w:r>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:b/>
                        <w:bCs/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                        <w:highlight w:val="yellow"/>
                    </w:rPr>
                    <w:t>Mit Cortison:</w:t>
                </w:r>
            </w:p>
            <w:p w:rsidR="00877D06" w:rsidRPr="00F07558" w:rsidRDefault="00877D06" w:rsidP="00F07558">
                <w:pPr>
                    <w:jc w:val="both"/>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                        <w:highlight w:val="yellow"/>
                    </w:rPr>
                </w:pPr>
                <w:r w:rsidRPr="00F07558">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                        <w:highlight w:val="yellow"/>
                    </w:rPr>
                    <w:t xml:space="preserve">Wir führten eine konsequente </w:t>
                </w:r>
                <w:r w:rsidRPr="00F07558">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:b/>
                        <w:bCs/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                        <w:highlight w:val="yellow"/>
                    </w:rPr>
                    <w:t>Medikamenten-Einnahmepause</w:t>
                </w:r>
                <w:r w:rsidRPr="00F07558">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                        <w:highlight w:val="yellow"/>
                    </w:rPr>
                    <w:t xml:space="preserve"> für jegliche Kopfschmerzakutmedikation durch. Zur Erleichterung der zu erwartenden Umstellungsreaktion erfolgte eine befristete intravenöse und orale Gabe von Prednisolon. Zum Einsatz kamen ebenfalls Dimenhydrinat und Melperon, sowie Infusionen mit Dimenhydrinat und Magnesium.</w:t>
                </w:r>
            </w:p>

            <w:p w:rsidR="00877D06" w:rsidRPr="00F07558" w:rsidRDefault="00877D06" w:rsidP="00F07558">
                <w:pPr>
                    <w:tabs>
                        <w:tab w:val="left" w:pos="1701"/>
                        <w:tab w:val="left" w:pos="6804"/>
                    </w:tabs>
                    <w:jc w:val="both"/>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:b/>
                        <w:bCs/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                        <w:highlight w:val="yellow"/>
                    </w:rPr>
                </w:pPr>
                <w:r w:rsidRPr="00F07558">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:b/>
                        <w:bCs/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                        <w:highlight w:val="yellow"/>
                    </w:rPr>
                    <w:t>Ohne Cortison</w:t>
                </w:r>
            </w:p>

            <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00F07558">
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
                <w:r w:rsidRPr="00F07558">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                        <w:highlight w:val="yellow"/>
                    </w:rPr>
                    <w:t xml:space="preserve">Wir führten eine konsequente </w:t>
                </w:r>
                <w:r w:rsidRPr="00F07558">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:b/>
                        <w:bCs/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                        <w:highlight w:val="yellow"/>
                    </w:rPr>
                    <w:t>Medikamenten-Einnahmepause</w:t>
                </w:r>
                <w:r w:rsidRPr="00F07558">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                        <w:highlight w:val="yellow"/>
                    </w:rPr>
                    <w:t xml:space="preserve"> für jegliche Kopfschmerzakutmedikation durch. Dabei wurde auf eine intravenöse und orale Gabe von Prednisolon nach einem festen Zeitschema verzichtet. Bedarfsweise erhielt die Patientin Medikamente zur Schmerzdistanzierung.</w:t>
                </w:r>
            </w:p>
        </xsl:if>
    </xsl:template>
    <xsl:template match="//pause_empfehlung">Des Weiteren empfehlen wir die ambulante Fortführung der Analgetikapause für insgesamt vier Wochen. In dieser Phase kann es sinnvoll sein <xsl:call-template name="patient"/> arbeitsunfähig zu schreiben.</xsl:template>
</xsl:stylesheet>