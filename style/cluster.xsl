<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">

    <xsl:template match="//clusterbehandlung">
        <xsl:if test="$diag_cluster">
            <xsl:text>Die Dosierung des Verapamil retard (Isoptin®) sollte dem Krankheitsverlauf angepasst werden. Bei unzureichender Wirkung kann ggf. eine weitere Dosissteigerung unter Beachtung vom Verträglichkeits- und Nebenwirkungsspektrum erfolgen, die Tagesdosis von 960 mg pro Tag nicht überschreitend. Unter Verapamil-Medikation bitten wir um regelmäßige kardiologische Kontrollen mittels EKG und Echokardiographie sowie bei jeder Dosissteigerung. Dosisreduktion des Verapamils nach 6-8 attackenfreien Wochen, hierbei schrittweise Ausdosieren.</xsl:text>
            <xsl:text>Die Attackenbehandlung des Clusterkopfschmerzes kann durch Inhalation von Sauerstoff 15 l/min über 15 Minuten unter Verwendung einer Gesichtsmaske sowie bei Wirkungslosigkeit durch die Verwendung eines Triptans mit schnellem Wirkungseintritt, z.B. Migra-Pen® (Sumatriptan 3 mg) als Autoinjektor s.c. oder 4 mg Fertigspritze erfolgen. Hier ist darauf zu achten, dass die Maximaldosis von Sumatriptan in 24 Stunden 12 mg s.c. beträgt. Im Gegensatz zur Migränebehandlung mit Triptanen besteht jedoch keine Höchstgrenze der Anwendung in Tagen pro Monat, da medikamenteninduzierte Kopfschmerzen bei Triptanübergebrauch auf dem Boden von Clusterkopfschmerzen bisher nicht beschrieben sind.</xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:template match="//ph_cluster">
        <xsl:if test="$diag_cluster">
            <w:tbl>
                <w:tblPr>
                    <w:tblW w:w="0" w:type="auto"/>
                    <w:tblInd w:w="2" w:type="dxa"/>
                    <w:tblLook w:val="00A0" w:firstRow="1" w:lastRow="0" w:firstColumn="1" w:lastColumn="0" w:noHBand="0"
                               w:noVBand="0"/>
                </w:tblPr>
                <w:tblGrid>
                    <w:gridCol w:w="2234"/>
                    <w:gridCol w:w="6944"/>
                </w:tblGrid>
                <w:tr>
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="2234" w:type="dxa"/>
                        </w:tcPr>
                        <w:p>
                            <w:pPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="1701"/>
                                    <w:tab w:val="left" w:pos="2268"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:b/>
                                    <w:bCs/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t xml:space="preserve">Schmerztyp </w:t>
                            </w:r>
                            <w:r w:rsidR="00E32810">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:b/>
                                    <w:bCs/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:fldChar w:fldCharType="begin"/>
                            </w:r>
                            <w:r w:rsidR="00E32810">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:b/>
                                    <w:bCs/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:fldChar w:fldCharType="separate"/>
                            </w:r>
                            <w:r w:rsidR="00E32810">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:b/>
                                    <w:bCs/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:fldChar w:fldCharType="end"/>
                            </w:r>
                            <w:r w:rsidRPr="00764B64">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t>:</w:t>
                            </w:r>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:br/>
                            </w:r>
                            <w:r w:rsidRPr="00764B64">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t>zeitlicher Verlauf:</w:t>
                            </w:r>
                        </w:p>
                    </w:tc>

                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="6944" w:type="dxa"/>
                        </w:tcPr>
                        <w:p>
                            <w:pPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="1701"/>
                                    <w:tab w:val="left" w:pos="2268"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:jc w:val="both"/>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t>Episodischer Cluster-Kopfschmerz</w:t>
                            </w:r>
                        </w:p>
                        <w:p>
                            <w:pPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="1701"/>
                                    <w:tab w:val="left" w:pos="2268"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:jc w:val="both"/>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="00764B64">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t xml:space="preserve">Erstauftreten </w:t>
                            </w:r>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:fldChar w:fldCharType="begin"/>
                            </w:r>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:fldChar w:fldCharType="end"/>
                            </w:r>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t xml:space="preserve">, aktuelle Episode besteht seit </w:t>
                            </w:r>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:fldChar w:fldCharType="begin"/>
                            </w:r>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:fldChar w:fldCharType="end"/>
                            </w:r>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t xml:space="preserve"> mit bis zu </w:t>
                            </w:r>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:fldChar w:fldCharType="begin"/>
                            </w:r>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:fldChar w:fldCharType="end"/>
                            </w:r>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t xml:space="preserve"> Attacken täglich mit einer Dauer von ca. </w:t>
                            </w:r>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:fldChar w:fldCharType="begin"/>
                            </w:r>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:fldChar w:fldCharType="end"/>
                            </w:r>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t xml:space="preserve"> Minuten.</w:t>
                            </w:r>
                        </w:p>
                    </w:tc>
                </w:tr>

                <w:tr>
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="2234" w:type="dxa"/>
                        </w:tcPr>
                        <w:p>
                            <w:pPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="1701"/>
                                    <w:tab w:val="left" w:pos="2268"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="00764B64">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t>Schmerzlokalisation:</w:t>
                            </w:r>
                        </w:p>
                    </w:tc>
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="6944" w:type="dxa"/>
                        </w:tcPr>
                        <w:p>
                            <w:pPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="1701"/>
                                    <w:tab w:val="left" w:pos="2268"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:jc w:val="both"/>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t>Strikt rechtsseitig periorbital</w:t>
                            </w:r>
                        </w:p>
                    </w:tc>
                </w:tr>

                <w:tr>
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="2234" w:type="dxa"/>
                        </w:tcPr>
                        <w:p>
                            <w:pPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="1701"/>
                                    <w:tab w:val="left" w:pos="2268"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="00764B64">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t>Intensität:</w:t>
                            </w:r>
                        </w:p>
                    </w:tc>

                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="6944" w:type="dxa"/>
                        </w:tcPr>
                        <w:p>
                            <w:pPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="1701"/>
                                    <w:tab w:val="left" w:pos="2268"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:jc w:val="both"/>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="00764B64">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t>Sehr stark</w:t>
                            </w:r>
                        </w:p>
                    </w:tc>
                </w:tr>

                <w:tr>
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="2234" w:type="dxa"/>
                        </w:tcPr>
                        <w:p>
                            <w:pPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="1701"/>
                                    <w:tab w:val="left" w:pos="2268"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="00764B64">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t>Schmerzcharakter:</w:t>
                            </w:r>
                        </w:p>
                    </w:tc>

                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="6944" w:type="dxa"/>
                        </w:tcPr>
                        <w:p>
                            <w:pPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="1701"/>
                                    <w:tab w:val="left" w:pos="2268"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:jc w:val="both"/>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="00764B64">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t>Stechend, bohrend</w:t>
                            </w:r>
                        </w:p>
                    </w:tc>
                </w:tr>
                <w:tr>
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="2234" w:type="dxa"/>
                        </w:tcPr>
                        <w:p>
                            <w:pPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="1701"/>
                                    <w:tab w:val="left" w:pos="2268"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="00764B64">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t>Modulation:</w:t>
                            </w:r>
                        </w:p>
                    </w:tc>

                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="6944" w:type="dxa"/>
                        </w:tcPr>
                        <w:p>
                            <w:pPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="1701"/>
                                    <w:tab w:val="left" w:pos="2268"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:jc w:val="both"/>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="00764B64">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t xml:space="preserve">Keine Auslösbarkeit der Attacken, während der Attacken ausgeprägte körperliche Unruhe, ipsilaterale trigeminoautonome Symptomatik mit konjunktivaler Injektion, Lakrimation, Rhinorhoe, Ptosis.</w:t>
                            </w:r>
                        </w:p>
                    </w:tc>
                </w:tr>
            </w:tbl>
        </xsl:if>
    </xsl:template>

    <xsl:template match="//w:p[.//clusterneu]">
        <xsl:if test="$diag_cluster">
            <w:p w:rsidR="00877D06" w:rsidRPr="00305FE6" w:rsidRDefault="00877D06" w:rsidP="000B1B4D">
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:b/>
                        <w:bCs/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                </w:pPr>
                <w:r w:rsidRPr="00305FE6">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:b/>
                        <w:bCs/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:t>Vorgehen bei neuer aktiver Clusterperiode</w:t>
                </w:r>
            </w:p>
            <w:p w:rsidR="00877D06" w:rsidRPr="0023639D" w:rsidRDefault="00877D06" w:rsidP="000B1B4D">
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                </w:pPr>
            </w:p>
            <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="000B1B4D">
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:b/>
                        <w:bCs/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                </w:pPr>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:b/>
                        <w:bCs/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:t>I. Verhaltensregeln</w:t>
                </w:r>
                <w:r>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:b/>
                        <w:bCs/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:t>:</w:t>
                </w:r>
            </w:p>
            <w:p w:rsidR="00877D06" w:rsidRPr="0023639D" w:rsidRDefault="00877D06" w:rsidP="000B1B4D">
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:b/>
                        <w:bCs/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                </w:pPr>
            </w:p>
            <w:p w:rsidR="00877D06" w:rsidRPr="0023639D" w:rsidRDefault="00877D06" w:rsidP="000B1B4D">
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                </w:pPr>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:t xml:space="preserve">Kein Alkohol, erst wieder, wenn 4 Wochen attackenfrei </w:t>
                </w:r>
            </w:p>
            <w:p w:rsidR="00877D06" w:rsidRPr="0023639D" w:rsidRDefault="00877D06" w:rsidP="000B1B4D">
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                </w:pPr>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:t>- Kein Nikotin</w:t>
                </w:r>
            </w:p>
            <w:p w:rsidR="00877D06" w:rsidRPr="0023639D" w:rsidRDefault="00877D06" w:rsidP="000B1B4D">
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                </w:pPr>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:t>- Keine Nitrate</w:t>
                </w:r>
            </w:p>
            <w:p w:rsidR="00877D06" w:rsidRPr="0023639D" w:rsidRDefault="00877D06" w:rsidP="000B1B4D">
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                </w:pPr>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:t>- Kein Nitrospray, keine Nitrotabletten</w:t>
                </w:r>
            </w:p>
            <w:p w:rsidR="00877D06" w:rsidRPr="0023639D" w:rsidRDefault="00877D06" w:rsidP="000B1B4D">
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                </w:pPr>
            </w:p>
            <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="000B1B4D">
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:b/>
                        <w:bCs/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                </w:pPr>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:b/>
                        <w:bCs/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:t>II. Medikamentöse Vorbeugung (aktuell, Anpassung in ca. 6 Wochen nach Rücksprache):</w:t>
                </w:r>
            </w:p>
            <w:p w:rsidR="00877D06" w:rsidRPr="0023639D" w:rsidRDefault="00877D06" w:rsidP="000B1B4D">
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:b/>
                        <w:bCs/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                </w:pPr>
            </w:p>
            <w:p w:rsidR="00877D06" w:rsidRPr="0023639D" w:rsidRDefault="00877D06" w:rsidP="000B1B4D">
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                </w:pPr>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:t>Isoptin RR (Wirkung tritt nach ca. 7 Tagen ein)</w:t>
                </w:r>
            </w:p>
            <w:p w:rsidR="00877D06" w:rsidRPr="0023639D" w:rsidRDefault="00877D06" w:rsidP="000B1B4D">
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                </w:pPr>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:t xml:space="preserve">- </w:t>
                </w:r>
                <w:r>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:t xml:space="preserve">  </w:t>
                </w:r>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:t>8 Uhr: 240 mg</w:t>
                </w:r>
            </w:p>
            <w:p w:rsidR="00877D06" w:rsidRPr="0023639D" w:rsidRDefault="00877D06" w:rsidP="000B1B4D">
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                </w:pPr>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:t>- 20 Uhr: 240 mg</w:t>
                </w:r>
            </w:p>
            <w:p w:rsidR="00877D06" w:rsidRPr="0023639D" w:rsidRDefault="00877D06" w:rsidP="000B1B4D">
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                </w:pPr>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:t xml:space="preserve">Wenn attackenfrei, kann nach 6 Wochen jeweils eine halbe Tablette Isoptin pro Woche abdosiert werden.</w:t>
                </w:r>
            </w:p>
            <w:p w:rsidR="00877D06" w:rsidRPr="0023639D" w:rsidRDefault="00877D06" w:rsidP="000B1B4D">
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                </w:pPr>
            </w:p>
            <w:p w:rsidR="00877D06" w:rsidRPr="0023639D" w:rsidRDefault="00877D06" w:rsidP="000B1B4D">
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                </w:pPr>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:t>Zusätzlich Prednisolongabe initial:</w:t>
                </w:r>
            </w:p>
            <w:p w:rsidR="00877D06" w:rsidRPr="0023639D" w:rsidRDefault="00877D06" w:rsidP="000B1B4D">
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                </w:pPr>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:t>- Prednisolon (Decortin H) Tabletten à 20 mg (N2=50 Stück)</w:t>
                </w:r>
            </w:p>
            <w:p w:rsidR="00877D06" w:rsidRPr="0023639D" w:rsidRDefault="00877D06" w:rsidP="000B1B4D">
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                </w:pPr>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:t>- Dazu Pantoprazol 40 mg am Morgen, Magenschutz (N2=50 Stück)</w:t>
                </w:r>
            </w:p>
            <w:p w:rsidR="00877D06" w:rsidRPr="0023639D" w:rsidRDefault="00877D06" w:rsidP="000B1B4D">
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                </w:pPr>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:t>- Zur Nacht für 4 Tage Dalmadorm</w:t>
                </w:r>
            </w:p>
            <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="000B1B4D">
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
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
                    </w:rPr>
                    <w:t xml:space="preserve">- </w:t>
                </w:r>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:t>Decortin jeweils am Morgen nach dem Frühstück in folgender absteigender Dosierung:</w:t>
                </w:r>
            </w:p>
            <w:p w:rsidR="00877D06" w:rsidRPr="0023639D" w:rsidRDefault="00877D06" w:rsidP="000B1B4D">
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                </w:pPr>
            </w:p>
            <w:p w:rsidR="00877D06" w:rsidRPr="0023639D" w:rsidRDefault="00877D06" w:rsidP="000B1B4D">
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                </w:pPr>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:t>1.-2. Tag</w:t>
                </w:r>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:tab/>
                    <w:t>100 mg</w:t>
                </w:r>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:tab/>
                </w:r>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:tab/>
                    <w:t>5 Tabletten zu 20 mg</w:t>
                </w:r>
            </w:p>
            <w:p w:rsidR="00877D06" w:rsidRPr="0023639D" w:rsidRDefault="00877D06" w:rsidP="000B1B4D">
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                </w:pPr>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:t>3.-4. Tag</w:t>
                </w:r>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:tab/>
                    <w:t>80 mg</w:t>
                </w:r>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:tab/>
                </w:r>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:tab/>
                    <w:t>4 Tabletten zu 20 mg</w:t>
                </w:r>
            </w:p>
            <w:p w:rsidR="00877D06" w:rsidRPr="0023639D" w:rsidRDefault="00877D06" w:rsidP="000B1B4D">
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                </w:pPr>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:t>4.-6. Tag</w:t>
                </w:r>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:tab/>
                    <w:t>60 mg</w:t>
                </w:r>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:tab/>
                </w:r>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:tab/>
                    <w:t>3 Tabletten zu 20 mg</w:t>
                </w:r>
            </w:p>
            <w:p w:rsidR="00877D06" w:rsidRPr="0023639D" w:rsidRDefault="00877D06" w:rsidP="000B1B4D">
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                </w:pPr>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:t>7.-8. Tag</w:t>
                </w:r>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:tab/>
                    <w:t>40 mg</w:t>
                </w:r>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:tab/>
                </w:r>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:tab/>
                    <w:t>2 Tabletten zu 20 mg</w:t>
                </w:r>
            </w:p>
            <w:p w:rsidR="00877D06" w:rsidRPr="0023639D" w:rsidRDefault="00877D06" w:rsidP="000B1B4D">
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                </w:pPr>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:t>9.-10. Tag</w:t>
                </w:r>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:tab/>
                    <w:t>20 mg</w:t>
                </w:r>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:tab/>
                </w:r>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:tab/>
                    <w:t>1 Tablette zu 20 mg</w:t>
                </w:r>
            </w:p>
            <w:p w:rsidR="00877D06" w:rsidRPr="0023639D" w:rsidRDefault="00877D06" w:rsidP="000B1B4D">
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                </w:pPr>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:t>11.-12. Tag</w:t>
                </w:r>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:tab/>
                    <w:t>10 mg</w:t>
                </w:r>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:tab/>
                </w:r>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:tab/>
                    <w:t>1/2 Tablette zu 20 mg</w:t>
                </w:r>
            </w:p>
            <w:p w:rsidR="00877D06" w:rsidRPr="0023639D" w:rsidRDefault="00877D06" w:rsidP="000B1B4D">
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                </w:pPr>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:t>dann absetzen</w:t>
                </w:r>
            </w:p>
            <w:p w:rsidR="00877D06" w:rsidRPr="0023639D" w:rsidRDefault="00877D06" w:rsidP="000B1B4D">
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                </w:pPr>
            </w:p>
            <w:p w:rsidR="00877D06" w:rsidRPr="0023639D" w:rsidRDefault="00877D06" w:rsidP="000B1B4D">
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                    <w:tabs>
                        <w:tab w:val="left" w:pos="113"/>
                    </w:tabs>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:b/>
                        <w:bCs/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                </w:pPr>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:b/>
                        <w:bCs/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:t>III. Behandlung der akuten Cluster-Attacke</w:t>
                </w:r>
            </w:p>
            <w:p w:rsidR="00877D06" w:rsidRPr="0023639D" w:rsidRDefault="00877D06" w:rsidP="000B1B4D">
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                    <w:tabs>
                        <w:tab w:val="left" w:pos="113"/>
                    </w:tabs>
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:b/>
                        <w:bCs/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                </w:pPr>
            </w:p>
            <w:p w:rsidR="00877D06" w:rsidRPr="0023639D" w:rsidRDefault="00877D06" w:rsidP="000B1B4D">
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                    <w:tabs>
                        <w:tab w:val="left" w:pos="113"/>
                    </w:tabs>
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
                    </w:rPr>
                    <w:t xml:space="preserve">- </w:t>
                </w:r>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:t>Sumatriptan 3 oder 6 mg s.c. mit Autoinjektor (Alternativ auch 2 oder 4 mg mit Fertigspritze)</w:t>
                </w:r>
            </w:p>
            <w:p w:rsidR="00877D06" w:rsidRPr="0023639D" w:rsidRDefault="00877D06" w:rsidP="000B1B4D">
                <w:pPr>
                    <w:pStyle w:val="Kopfzeile"/>
                    <w:tabs>
                        <w:tab w:val="left" w:pos="113"/>
                    </w:tabs>
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
                    </w:rPr>
                    <w:t xml:space="preserve">- </w:t>
                </w:r>
                <w:r w:rsidRPr="0023639D">
                    <w:rPr>
                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                        <w:sz w:val="18"/>
                        <w:szCs w:val="18"/>
                    </w:rPr>
                    <w:t>Sauerstoff 10 Liter/min über 10 Minuten</w:t>
                </w:r>
            </w:p>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>