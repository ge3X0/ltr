<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">

    <xsl:template match="//w:p[.//clusterbehandlung]">
        <xsl:if test="$diag_cluster">
            <w:p>
                <xsl:call-template name="text-run">
                    <xsl:with-param name="text">
                        <xsl:text>Die Dosierung des </xsl:text>
                    </xsl:with-param>
                </xsl:call-template>

                <xsl:call-template name="text-run">
                    <xsl:with-param name="bold" select="true()"/>
                    <xsl:with-param name="text">
                        <xsl:text>Verapamil retard (Isoptin®)</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>

                <xsl:call-template name="text-run">
                    <xsl:with-param name="text">
                        <xsl:text> sollte dem Krankheitsverlauf angepasst werden. Bei unzureichender Wirkung kann ggf. eine weitere Dosissteigerung unter Beachtung vom Verträglichkeits- und Nebenwirkungsspektrum erfolgen, die Tagesdosis von 960 mg pro Tag nicht überschreitend. Unter Verapamil-Medikation bitten wir um regelmäßige kardiologische Kontrollen mittels EKG und Echokardiographie sowie bei jeder Dosissteigerung. Dosisreduktion des Verapamils nach 6-8 attackenfreien Wochen, hierbei schrittweise Ausdosieren.</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
            </w:p>

            <w:p/>

            <w:p>
                <xsl:call-template name="text-run">
                    <xsl:with-param name="text">
                        <xsl:text>Die </xsl:text>
                    </xsl:with-param>
                </xsl:call-template>

                <xsl:call-template name="text-run">
                    <xsl:with-param name="bold" select="true()"/>
                    <xsl:with-param name="text">
                        <xsl:text>Attackenbehandlung des Clusterkopfschmerzes</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>

                <xsl:call-template name="text-run">
                    <xsl:with-param name="text">
                        <xsl:text> kann durch Inhalation von Sauerstoff 15 l/min über 15 Minuten unter Verwendung einer Gesichtsmaske sowie bei Wirkungslosigkeit durch die Verwendung eines Triptans mit schnellem Wirkungseintritt, z.B. Migra-Pen® (Sumatriptan 3 mg) als Autoinjektor s.c. oder 4 mg Fertigspritze erfolgen. Hier ist darauf zu achten, dass die Maximaldosis von Sumatriptan in 24 Stunden 12 mg s.c. beträgt. Im Gegensatz zur Migränebehandlung mit Triptanen besteht jedoch keine Höchstgrenze der Anwendung in Tagen pro Monat, da medikamenteninduzierte Kopfschmerzen bei Triptanübergebrauch auf dem Boden von Clusterkopfschmerzen bisher nicht beschrieben sind.</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
            </w:p>
        </xsl:if>
    </xsl:template>

    <xsl:template match="//w:p[.//clusterneu]">
        <xsl:if test="$diag_cluster">
            <w:p>
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                </w:pPr>
                <xsl:call-template name="text-run">
                    <xsl:with-param name="bold" select="true()"/>
                    <xsl:with-param name="text">
                        <xsl:text>Vorgehen bei neuer aktiver Clusterperiode</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
            </w:p>

            <w:p/>

            <w:p>
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                </w:pPr>
                <xsl:call-template name="text-run">
                    <xsl:with-param name="bold" select="true()"/>
                    <xsl:with-param name="text">
                        <xsl:text>I. Verhaltensregeln:</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
            </w:p>

            <w:p/>

            <w:p>
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                </w:pPr>
                <xsl:call-template name="text-run">
                    <xsl:with-param name="text">
                        <xsl:text>- Kein Alkohol, erst wieder, wenn 4 Wochen attackenfrei</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
            </w:p>

            <w:p>
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                </w:pPr>
                <xsl:call-template name="text-run">
                    <xsl:with-param name="text">
                        <xsl:text>- Kein Nikotin</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
            </w:p>

            <w:p>
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                </w:pPr>
                <xsl:call-template name="text-run">
                    <xsl:with-param name="text">
                        <xsl:text>- Keine Nitrate</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
            </w:p>

            <w:p>
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                </w:pPr>
                <xsl:call-template name="text-run">
                    <xsl:with-param name="text">
                        <xsl:text>- Kein Nitrospray, keine Nitrotabletten</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
            </w:p>

            <w:p/>

            <w:p>
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                </w:pPr>
                <xsl:call-template name="text-run">
                    <xsl:with-param name="bold" select="true()"/>
                    <xsl:with-param name="text">
                        <xsl:text>II. Medikamentöse Vorbeugung (aktuell, Anpassung in ca. 6 Wochen nach Rücksprache):</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
            </w:p>

            <w:p/>

            <w:p>
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                </w:pPr>
                <xsl:call-template name="text-run">
                    <xsl:with-param name="text">
                        <xsl:text>Isoptin RR (Wirkung tritt nach ca. 7 Tagen ein)</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
            </w:p>

            <w:p>
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                </w:pPr>
                <xsl:call-template name="text-run">
                    <xsl:with-param name="text">
                        <xsl:text>- 8 Uhr: 240 mg</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
                <w:br/>
                <xsl:call-template name="text-run">
                    <xsl:with-param name="text">
                        <xsl:text>- 20 Uhr: 240 mg</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
                <w:br/>
                <xsl:call-template name="text-run">
                    <xsl:with-param name="text">
                        <xsl:text>Wenn attackenfrei, kann nach 6 Wochen jeweils eine halbe Tablette Isoptin pro Woche abdosiert werden.</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
            </w:p>

            <w:p/>

            <w:p>
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                </w:pPr>

                <xsl:call-template name="text-run">
                    <xsl:with-param name="text">
                        <xsl:text>Zusätzlich Prednisolongabe initial:</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
                <w:br/>
                <xsl:call-template name="text-run">
                    <xsl:with-param name="text">
                        <xsl:text>- Prednisolon (Decortin H) Tabletten à 20 mg (N2=50 Stück)</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
                <w:br/>
                <xsl:call-template name="text-run">
                    <xsl:with-param name="text">
                        <xsl:text>- Dazu Pantoprazol 40 mg am Morgen, Magenschutz (N2=50 Stück)</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
                <w:br/>
                <xsl:call-template name="text-run">
                    <xsl:with-param name="text">
                        <xsl:text>- Zur Nacht für 4 Tage Dalmadorm bei Bedarf</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
            </w:p>

            <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="000B1B4D">
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                </w:pPr>
                <xsl:call-template name="text-run">
                    <xsl:with-param name="text">
                        <xsl:text>- Decortin jeweils am Morgen nach dem Frühstück in folgender absteigender Dosierung:</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
                <w:br/>
                <xsl:call-template name="text-run">
                    <xsl:with-param name="text">
                        <xsl:text>1.-2. Tag: 100 mg (5 Tabletten zu 20 mg)</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
                <w:br/>
                <xsl:call-template name="text-run">
                    <xsl:with-param name="text">
                        <xsl:text>3.-4. Tag: 80 mg (4 Tabletten zu 20 mg)</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
                <w:br/>
                <xsl:call-template name="text-run">
                    <xsl:with-param name="text">
                        <xsl:text>5.-6. Tag: 60 mg (3 Tabletten zu 20 mg)</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
                <w:br/>
                <xsl:call-template name="text-run">
                    <xsl:with-param name="text">
                        <xsl:text>7.-8. Tag: 40 mg (2 Tabletten zu 20 mg)</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
                <w:br/>
                <xsl:call-template name="text-run">
                    <xsl:with-param name="text">
                        <xsl:text>9.-10. Tag: 20 mg (1 Tabletten zu 20 mg)</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
                <w:br/>
                <xsl:call-template name="text-run">
                    <xsl:with-param name="text">
                        <xsl:text>11.-12. Tag: 10 mg (1/2 Tabletten zu 20 mg)</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
                <w:br/>
                <xsl:call-template name="text-run">
                    <xsl:with-param name="text">
                        <xsl:text>dann absetzen</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
            </w:p>

            <w:p/>

            <w:p>
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                </w:pPr>
                <xsl:call-template name="text-run">
                    <xsl:with-param name="bold" select="true()"/>
                    <xsl:with-param name="text">
                        <xsl:text>III. Behandlung der akuten Cluster-Attacke</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
            </w:p>

            <w:p/>

            <w:p w:rsidR="00877D06" w:rsidRPr="0023639D" w:rsidRDefault="00877D06" w:rsidP="000B1B4D">
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                </w:pPr>

                <xsl:call-template name="text-run">
                    <xsl:with-param name="text">
                        <xsl:text>- Sumatriptan 3 oder 6 mg s.c. mit Autoinjektor (Alternativ auch 2 oder 4 mg mit Fertigspritze)</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
                <w:br/>
                <xsl:call-template name="text-run">
                    <xsl:with-param name="text">
                        <xsl:text>- Sauerstoff 10 Liter/min über 10 Minuten</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
            </w:p>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>