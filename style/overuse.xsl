<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">

    <xsl:template name="nach_pause">
        <xsl:if test="$diag_overuse">
            <w:p>
                <w:pPr>
                    <w:jc w:val="both"/>
                </w:pPr>
                <xsl:call-template name="text-run">
                    <xsl:with-param name="text">
                        <xsl:text>(nach der Schmerzmittelpause)</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
            </w:p>
        </xsl:if>
    </xsl:template>

    <xsl:template match="//pause_a">
        <xsl:if test="$diag_overuse"><xsl:text> Aufgrund der Intensität der Schmerzen, insbesondere der Migräne, werden die Grenzschwellen für die Entstehung von Kopfschmerzen bei Medikamentenübergebrauch eindeutig überschritten.</xsl:text></xsl:if>
    </xsl:template>
    <xsl:template match="//pause_b"><xsl:if test="$diag_overuse"><xsl:text> Es besteht eine Aufrechterhaltung und weitere Verstärkung des sowieso bestehenden Kopfschmerzes bei Medikamentenübergebrauch.</xsl:text></xsl:if></xsl:template>
    <xsl:template match="//pause_entzug"><xsl:if test="$diag_overuse"> sowie der Entzugsbehandlung</xsl:if></xsl:template>
    <xsl:template match="//pause_dauer"><xsl:if test="$diag_overuse"><xsl:text> und der notwendigen Minimierung des Rückfallrisikos in den Analgetika-Übergebrauch und Analgetika-Fehlgebrauch</xsl:text></xsl:if></xsl:template>
    <xsl:template match="//pause_rebound"><xsl:if test="$diag_overuse">, schwere Rebound-Kopfschmerzen mussten mit Escape-Medikation behandelt werden, welche die multimodalen Behandlungsmaßnahmen behinderten</xsl:if></xsl:template>
    <xsl:template match="//pause_empfehlung"><xsl:if test="$diag_overuse">Des Weiteren empfehlen wir die ambulante Fortführung der Analgetikapause für insgesamt vier Wochen. In dieser Phase kann es sinnvoll sein <xsl:call-template name="patient"/> arbeitsunfähig zu schreiben.</xsl:if></xsl:template>
    <xsl:template match="//pause_def"><xsl:if test="$diag_overuse">Der Einsatz von Schmerzmitteln und/oder Triptanen an mehr als 10 Tagen im Monat überschreitet die Grenzschwellen für die Entstehung von Kopfschmerzen bei Medikamentenübergebrauch. Es besteht ein Fehlgebrauch durch nicht-selektive Anwendung der Triptane bei Kopfschmerz vom Spannungstyp und Medikamentenübergebrauchskopfschmerzen. Es besteht ein Fehlgebrauch aufgrund nicht spezifischer Differenzierung der Akutmedikation in der Akutbehandlung der Migräne, Spannungskopfschmerzen und der Intervallkopfschmerzen. Es besteht ein Fehlgebrauch, indem Triptane erst dann eingenommen werden, wenn die Migräneattacke ihre höchste Kopfschmerzintensität erreicht hat. Es besteht ein Fehlgebrauch aufgrund Wiederholung des primär eingesetzten Triptans bei primärer Unwirksamkeit im Anfall. Es besteht ein Fehlgebrauch bei der Anwendung von Escape-Medikation bei primärer Unwirksamkeit des Triptans. Bei status migraenosus werden über 5 Tage täglich Schmerzmitteln und Triptane eingesetzt.</xsl:if></xsl:template>
    <xsl:template match="//pause_abschluss"><xsl:if test="$diag_overuse"><xsl:text> nach Abschluss der Medikamentenpause</xsl:text></xsl:if></xsl:template>

    <xsl:template match="//w:p[.//pause_cortison]">
        <xsl:if test="$diag_overuse">
            <w:p>
                <w:pPr>
                    <w:jc w:val="both"/>
                </w:pPr>

                <xsl:call-template name="text-run">
                    <xsl:with-param name="bold" select="true()"/>
                    <xsl:with-param name="highlight" select="true()"/>
                    <xsl:with-param name="text">
                        <xsl:text>Mit Cortison</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
            </w:p>

            <w:p>
                <w:pPr>
                    <w:jc w:val="both"/>
                </w:pPr>

                <xsl:call-template name="text-run">
                    <xsl:with-param name="highlight" select="true()"/>
                    <xsl:with-param name="text">
                        <xsl:text>Wit führten eine konsequente </xsl:text>
                    </xsl:with-param>
                </xsl:call-template>

                <xsl:call-template name="text-run">
                    <xsl:with-param name="bold" select="true()"/>
                    <xsl:with-param name="highlight" select="true()"/>
                    <xsl:with-param name="text">
                        <xsl:text>Medikamenten-Einnahmepause</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>

                <xsl:call-template name="text-run">
                    <xsl:with-param name="highlight" select="true()"/>
                    <xsl:with-param name="text">
                        <xsl:text> für jegliche Kopfschmerzakutmedikation durch. Zur Erleichterung der zu erwartenden Umstellungsreaktion erfolgte eine befristete intravenöse und orale Gabe von Prednisolon. Zum Einsatz kamen ebenfalls Dimenhydrinat und Melperon, sowie Infusionen mit Dimenhydrinat und Magnesium.</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
            </w:p>

            <w:p>
                <w:pPr>
                    <w:jc w:val="both"/>
                </w:pPr>

                <xsl:call-template name="text-run">
                    <xsl:with-param name="bold" select="true()"/>
                    <xsl:with-param name="highlight" select="true()"/>
                    <xsl:with-param name="text">
                        <xsl:text>Ohne Cortison</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
            </w:p>

            <w:p>
                <w:pPr>
                    <w:jc w:val="both"/>
                </w:pPr>

                <xsl:call-template name="text-run">
                    <xsl:with-param name="highlight" select="true()"/>
                    <xsl:with-param name="text">
                        <xsl:text>Wit führten eine konsequente </xsl:text>
                    </xsl:with-param>
                </xsl:call-template>

                <xsl:call-template name="text-run">
                    <xsl:with-param name="bold" select="true()"/>
                    <xsl:with-param name="highlight" select="true()"/>
                    <xsl:with-param name="text">
                        <xsl:text>Medikamenten-Einnahmepause</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>

                <xsl:call-template name="text-run">
                    <xsl:with-param name="highlight" select="true()"/>
                    <xsl:with-param name="text">
                        <xsl:text> für jegliche Kopfschmerzakutmedikation durch. Dabei wurde auf eine intravenöse und orale Gabe von Prednisolon nach einem festen Zeitschema verzichtet. Bedarfsweise erhielt die Patientin Medikamente zur Schmerzdistanzierung.</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
            </w:p>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>