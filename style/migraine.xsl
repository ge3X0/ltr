<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
    <xsl:template match="//ohneaura_akut"><xsl:if test="$diag_migraine_with_aura">Bei Migräne mit Aura ist der Einsatz von Triptanen während einer Aura kontraindiziert. Hier empfiehlt sich die Einnahme von Akutanalgetika wie Novaminsulfon® (Metamizol) 40° bis zu 4x täglich. Alternativ ist Diclofenac 20°, maximal 3x täglich möglich. Nach sicher abgeklungener Aurasymptomatik kann der Einsatz von Triptanen erfolgen.</xsl:if></xsl:template>
    <xsl:template name="with_and"><xsl:if test="$diag_migraine_with_aura"><xsl:text> mit und</xsl:text></xsl:if></xsl:template>

    <xsl:template match="//ph_migr">
        <xsl:if test="($diag_migraine_with_aura) or ($diag_migraine_without_aura)">
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
                                <w:t>Migräne<xsl:call-template name="with_and"/> ohne Aura.</w:t>
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
                                <w:t xml:space="preserve">Kopfschmerzanfälle seit </w:t>
                            </w:r>
                            <w:r w:rsidR="00E32810">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:fldChar w:fldCharType="begin"/>
                            </w:r>
                            <w:r w:rsidR="00E32810">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:fldChar w:fldCharType="end"/>
                            </w:r>
                            <w:r w:rsidR="00E32810">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t xml:space="preserve"> bestehend, seit einigen Jahren deutliche Zunahme der Frequenz. </w:t>
                            </w:r>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t xml:space="preserve">Attackendauer </w:t>
                            </w:r>
                            <w:r w:rsidR="00764662">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:fldChar w:fldCharType="begin"/>
                            </w:r>
                            <w:r w:rsidR="00764662">
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
                                <w:t xml:space="preserve"> Tage, Kopfschmerzen an bis zu </w:t>
                            </w:r>
                            <w:r w:rsidR="00764662">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:fldChar w:fldCharType="begin"/>
                            </w:r>
                            <w:r w:rsidR="00764662">
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
                                <w:t xml:space="preserve"> Tagen/Monat.</w:t>
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
                                <w:t>Unilateral, seitenwechselnd</w:t>
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
                                <w:t>Pulsierend, pochend</w:t>
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
                                <w:t xml:space="preserve">Körperliche Routineaktivitäten verstärken die Beschwerden und führen zu deren Vermeidung, Bettruhe ist oft erforderlich.</w:t>
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
                                <w:t>Begleitsymptome:</w:t>
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
                                <w:t>Übelkeit, Erbrechen, Phonophobie, Photophobie, Geruchsüberempfindlichkeit, Schwindel, Konzentrationsstörungen, Müdigkeit, Berührungsempfindlichkeit</w:t>
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
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t>Auren:</w:t>
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
                                <xsl:choose>
                                    <xsl:when test="$diag_migraine_with_aura">
                                        <w:t xml:space="preserve">Vorübergehende einseitige Sehstörungen in Form von Flimmerskotomen und Fortifikationsphenomänen</w:t>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <w:t>Keine</w:t>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </w:r>
                        </w:p>
                    </w:tc>
                </w:tr>
            </w:tbl>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>