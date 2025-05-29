<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">

    <xsl:template match="akutmedikation_zuvor">
        <xsl:for-each select="$data//medication[@when = 'former' and @which = 'acute']/entry">
            <xsl:value-of select="normalize-space(name)"/>
            <xsl:if test="position() &lt; last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="//w:p[.//akutmedikation]">
        <w:tbl>
            <w:tblPr>
                <w:tblW w:w="0" w:type="auto"/>
                <w:tblInd w:w="-106" w:type="dxa"/>
                <w:tblBorders>
                    <w:top w:val="single" w:sz="4" w:space="0" w:color="000000"/>
                    <w:left w:val="single" w:sz="4" w:space="0" w:color="000000"/>
                    <w:bottom w:val="single" w:sz="4" w:space="0" w:color="000000"/>
                    <w:right w:val="single" w:sz="4" w:space="0" w:color="000000"/>
                    <w:insideH w:val="single" w:sz="4" w:space="0" w:color="000000"/>
                    <w:insideV w:val="single" w:sz="4" w:space="0" w:color="000000"/>
                </w:tblBorders>
                <w:tblLook w:val="00A0"/>
            </w:tblPr>
            <w:tblGrid>
                <w:gridCol w:w="3691"/>
                <w:gridCol w:w="15"/>
                <w:gridCol w:w="5371"/>
                <w:gridCol w:w="20"/>
            </w:tblGrid>
            <w:tr>
                <w:tc>
                    <w:tcPr>
                        <w:tcW w:w="9097" w:type="dxa"/>
                        <w:gridSpan w:val="4"/>
                        <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
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
                                <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                                <w:b/>
                                <w:bCs/>
                                <w:sz w:val="18"/>
                                <w:szCs w:val="18"/>
                            </w:rPr>
                        </w:pPr>
                        <w:r>
                            <w:rPr>
                                <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                                <w:b/>
                                <w:bCs/>
                                <w:sz w:val="18"/>
                                <w:szCs w:val="18"/>
                            </w:rPr>
                            <w:t>Schmerztherapeutische Akutmedikation</w:t>
                        </w:r>
                    </w:p>
                </w:tc>
            </w:tr>
            <w:tr>
                <w:tc>
                    <w:tcPr>
                        <w:tcW w:w="3706" w:type="dxa"/>
                        <w:gridSpan w:val="2"/>
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
                                <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                                <w:b/>
                                <w:bCs/>
                                <w:sz w:val="14"/>
                                <w:szCs w:val="14"/>
                            </w:rPr>
                        </w:pPr>
                        <w:r>
                            <w:rPr>
                                <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                                <w:b/>
                                <w:bCs/>
                                <w:sz w:val="14"/>
                                <w:szCs w:val="14"/>
                            </w:rPr>
                            <w:t>Indikation</w:t>
                        </w:r>
                    </w:p>
                </w:tc>
                <w:tc>
                    <w:tcPr>
                        <w:tcW w:w="5391" w:type="dxa"/>
                        <w:gridSpan w:val="2"/>
                    </w:tcPr>
                    <w:p w:rsidR="00877D06" w:rsidRPr="00166F0D" w:rsidRDefault="00877D06" w:rsidP="000B07A2">
                        <w:pPr>
                            <w:tabs>
                                <w:tab w:val="left" w:pos="1701"/>
                                <w:tab w:val="left" w:pos="2268"/>
                                <w:tab w:val="left" w:pos="6804"/>
                            </w:tabs>
                            <w:rPr>
                                <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                          w:cs="Lucida Sans Unicode"/>
                                <w:b/>
                                <w:bCs/>
                                <w:sz w:val="14"/>
                                <w:szCs w:val="14"/>
                            </w:rPr>
                        </w:pPr>
                        <w:r w:rsidRPr="00166F0D">
                            <w:rPr>
                                <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                          w:cs="Lucida Sans Unicode"/>
                                <w:b/>
                                <w:bCs/>
                                <w:sz w:val="14"/>
                                <w:szCs w:val="14"/>
                            </w:rPr>
                            <w:t>Substanz/Medikament</w:t>
                        </w:r>
                    </w:p>
                </w:tc>
            </w:tr>

            <xsl:if test="$diag_overuse">
                <w:tr w:rsidR="00877D06" w:rsidRPr="00166F0D">
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="3706" w:type="dxa"/>
                            <w:gridSpan w:val="2"/>
                        </w:tcPr>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00932F5E">
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
                            <w:r w:rsidRPr="00166F0D">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t>Migräne</w:t>
                            </w:r>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t xml:space="preserve">attacke </w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00932F5E">
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
                                <w:t xml:space="preserve">während der Schmerzmittelpause </w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRPr="00166F0D" w:rsidRDefault="00877D06" w:rsidP="00932F5E">
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
                                <w:t>(für weitere 2 Wochen empfohlen)</w:t>
                            </w:r>
                        </w:p>
                    </w:tc>
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="5391" w:type="dxa"/>
                            <w:gridSpan w:val="2"/>
                        </w:tcPr>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00683856">
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
                                <w:t xml:space="preserve">Dimenhydrinat (Vomex A®) Dragee 50 mg (maximal 3x täglich) oder Dimenhydrinat (Vomex A®) als Suppositorium 150 mg (Tageshöchstdosis 300 mg) </w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00683856">
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
                                <w:t>Melperon 10 mg (bis zu 5x täglich) unter Beachtung des Nebenwirkungsspektrums, insbesondere Reaktionsvermögen. Melperon kann bei regelmäßiger Einnahme Dyskinesien verursachen, zudem schränken beide Medikamente die Fahrtauglichkeit ein. </w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00683856">
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
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00683856">
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
                                <w:t xml:space="preserve">Im Notfall, bei Eskalation der Rebound-Kopfschmerzen: </w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00683856">
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
                                <w:t xml:space="preserve">16 mg Dexamethason in 250 ml NaCl als Kurzinfusion i.v. </w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00683856">
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
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00683856">
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
                                <w:t xml:space="preserve">Oder orale Anwendung: </w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00683856">
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
                                <w:t>Prednisolon 100 mg oral (z.B. 2x50 mg Decortin H) oder als Suppositorium (Rectodelt 100 mg)</w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRPr="00166F0D" w:rsidRDefault="00877D06" w:rsidP="00932F5E">
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
                        </w:p>
                    </w:tc>
                </w:tr>
            </xsl:if>

            <xsl:if test="$diag_migraine_without_aura">
                <w:tr w:rsidR="00877D06" w:rsidRPr="00166F0D">
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="3706" w:type="dxa"/>
                            <w:gridSpan w:val="2"/>
                        </w:tcPr>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00932F5E">
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
                            <w:r w:rsidRPr="00166F0D">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t>Migräne ohne Aura </w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRPr="00166F0D" w:rsidRDefault="00877D06" w:rsidP="00932F5E">
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
                                <w:t>(nach der Schmerzmittelpause)</w:t>
                            </w:r>
                        </w:p>
                    </w:tc>
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="5391" w:type="dxa"/>
                            <w:gridSpan w:val="2"/>
                        </w:tcPr>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00DD7025">
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
                                <w:t xml:space="preserve">Dimenhydrinat (Vomex A®) 50 mg bei Übelkeit </w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00DD7025">
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
                                <w:t xml:space="preserve">+ Eletriptan 40 mg</w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00CB2B28">
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
                            <w:r w:rsidRPr="006F3FD9">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t>+ Naproxen 500 mg gleichzeitig mit Sumatriptan zur Verhinderung des Wiederkehrkopfschmerzes einnehmen</w:t>
                            </w:r>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t>.</w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00CB2B28">
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
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00CB2B28">
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
                                <w:t>Alternativ kann an Stelle von Eletriptan 40 mg auch Rizatriptan 10 mg zur Anwendung kommen.</w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00CB2B28">
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
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRPr="00CB2B28" w:rsidRDefault="00877D06" w:rsidP="00CB2B28">
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
                            <w:r w:rsidRPr="00CB2B28">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t xml:space="preserve">Bitte Triptane innerhalb einer Attacke nicht mischen. </w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRPr="00CB2B28" w:rsidRDefault="00877D06" w:rsidP="00CB2B28">
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
                            <w:r w:rsidRPr="00CB2B28">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t xml:space="preserve">Erneute Einnahme frühestens nach 4 Stunden bei primär guter Wirksamkeit und auftretenden Wiederkehrkopfschmerz, maximal 3 Tage in Folge anwenden. </w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRPr="00CB2B28" w:rsidRDefault="00877D06" w:rsidP="00CB2B28">
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
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRPr="00CB2B28" w:rsidRDefault="00877D06" w:rsidP="00CB2B28">
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
                            <w:r w:rsidRPr="00CB2B28">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t xml:space="preserve">Ersatzmedikation bei Wirkungslosigkeit: </w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRPr="00CB2B28" w:rsidRDefault="00877D06" w:rsidP="00CB2B28">
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
                            <w:r w:rsidRPr="00CB2B28">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t>Metamizol (z.B. Novalgin/Novaminsulfon) 1 g (entspr. 40 Tropfen) in Abständen von 6-8 Stunden bis zu 4x am Tag möglich. Oder: </w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRPr="00166F0D" w:rsidRDefault="00877D06" w:rsidP="00CB2B28">
                            <w:pPr>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="00CB2B28">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t>Diclofenac: Initialdosis 50 mg (entspr. 20 Tropfen). Falls nach 2 Std. keine ausreichende Besserung eintritt, zweite Dosis von 50 mg (20 Tropfen) möglich. Weitere Dosen in Abständen von 4-6 Stunden möglich. Gesamtdosis von 200 mg/Tag darf nicht überschritten werden. </w:t>
                            </w:r>
                        </w:p>
                    </w:tc>
                </w:tr>
            </xsl:if>

            <xsl:if test="$diag_migraine_with_aura">
                <w:tr>
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="3706" w:type="dxa"/>
                            <w:gridSpan w:val="2"/>
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
                            <w:bookmarkStart w:id="13" w:name="_Hlk535423756"/>
                            <w:r w:rsidRPr="00166F0D">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t>Migräne mit Aura </w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRPr="00166F0D" w:rsidRDefault="00877D06" w:rsidP="004814EE">
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
                                <w:t>(nach der Schmerzmittelpause)</w:t>
                            </w:r>
                        </w:p>
                    </w:tc>
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="5391" w:type="dxa"/>
                            <w:gridSpan w:val="2"/>
                        </w:tcPr>
                        <w:p w:rsidR="00877D06" w:rsidRPr="00CB2B28" w:rsidRDefault="00877D06" w:rsidP="003D3F42">
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
                            <w:r w:rsidRPr="00CB2B28">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t>Metamizol (z.B. Novalgin/Novaminsulfon) 1 g (entspr. 40 Tropfen) in Abständen von 6-8 Stunden bis zu 4x am Tag möglich. Oder: </w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="003D3F42">
                            <w:pPr>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:color w:val="000000"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="00CB2B28">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t>Diclofenac: Initialdosis 50 mg (entspr. 20 Tropfen). Falls nach 2 Std. keine ausreichende Besserung eintritt, zweite Dosis von 50 mg (20 Tropfen) möglich. Weitere Dosen in Abständen von 4-6 Stunden möglich. Gesamtdosis von 200 mg/Tag darf nicht überschritten werden. </w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRPr="00F0589D" w:rsidRDefault="00877D06" w:rsidP="004814EE">
                            <w:pPr>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                            </w:pPr>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRPr="00F0589D" w:rsidRDefault="00877D06" w:rsidP="004814EE">
                            <w:pPr>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="00F0589D">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t xml:space="preserve">Bei sicherer vollständiger Rückbildung der Aurasymptomatik Anschlussbehandlung mittels Triptan (s.o.) möglich. </w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRPr="00F0589D" w:rsidRDefault="00877D06" w:rsidP="004814EE">
                            <w:pPr>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                            </w:pPr>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRPr="00E66A25" w:rsidRDefault="00877D06" w:rsidP="00E66A25">
                            <w:pPr>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:b/>
                                    <w:bCs/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="00F0589D">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:b/>
                                    <w:bCs/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t>Triptane sind während einer Aura kontraindiziert.</w:t>
                            </w:r>
                        </w:p>
                    </w:tc>
                </w:tr>
            </xsl:if>

            <xsl:if test="$diag_status_migrainosus">
                <w:tr w:rsidR="00877D06" w:rsidRPr="00166F0D">
                    <w:trPr>
                        <w:gridAfter w:val="1"/>
                        <w:wAfter w:w="20" w:type="dxa"/>
                    </w:trPr>
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="3691" w:type="dxa"/>
                        </w:tcPr>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00746F90">
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
                            <w:r w:rsidRPr="00DE7B04">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:lastRenderedPageBreak/>
                                <w:t>Status migraenosus</w:t>
                            </w:r>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t xml:space="preserve"> </w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRPr="00855614" w:rsidRDefault="00877D06" w:rsidP="00746F90">
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
                                <w:t xml:space="preserve">(Attackendauer mehr als 72 Stunden) </w:t>
                            </w:r>
                        </w:p>
                    </w:tc>
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="5386" w:type="dxa"/>
                            <w:gridSpan w:val="2"/>
                        </w:tcPr>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00746F90">
                            <w:pPr>
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
                                <w:t>Prednisolon 100 mg + ggf. Diazepam 10 mg zur Schmerzdistanzierung</w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00746F90">
                            <w:pPr>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                            </w:pPr>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00746F90">
                            <w:pPr>
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
                                <w:t>Oder alternativ durch den Arzt durchzuführen:</w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRPr="006468BE" w:rsidRDefault="00877D06" w:rsidP="00746F90">
                            <w:pPr>
                                <w:rPr>
                                    <w:b/>
                                    <w:bCs/>
                                </w:rPr>
                            </w:pPr>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t>Aspirin 1.000 mg als Kurzinfusion</w:t>
                            </w:r>
                        </w:p>
                    </w:tc>
                </w:tr>
            </xsl:if>

            <xsl:if test="$diag_cluster">
                <w:tr w:rsidR="00877D06" w:rsidRPr="00166F0D">
                    <w:trPr>
                        <w:gridAfter w:val="1"/>
                        <w:wAfter w:w="20" w:type="dxa"/>
                    </w:trPr>
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="3691" w:type="dxa"/>
                        </w:tcPr>
                        <w:p w:rsidR="00877D06" w:rsidRPr="00166F0D" w:rsidRDefault="00877D06" w:rsidP="00933427">
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
                                <w:t xml:space="preserve">Clusterkopfschmerz </w:t>
                            </w:r>
                        </w:p>
                    </w:tc>
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="5386" w:type="dxa"/>
                            <w:gridSpan w:val="2"/>
                        </w:tcPr>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00933427">
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
                                <w:t>100% Sauerstoffinhalation 15 l/min über 15 Minuten mit Gesichtsmaske</w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00933427">
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
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00933427">
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
                                <w:t xml:space="preserve">oder </w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00933427">
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
                            <w:r w:rsidRPr="00A96041">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t>Sumatriptan</w:t>
                            </w:r>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t xml:space="preserve"> Inject 6 mg, maximal 2x täglich, Mindestabstand 4 Stunden, keine Obergrenze in Form von Tagen/Monat </w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00933427">
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
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00933427">
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
                                <w:t xml:space="preserve">alternativ </w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00933427">
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
                                <w:t>Zolmitriptan 5 mg nasal maximal 2x täglich, Mindestabstand 4 Stunden, keine Obergrenze in Form von Tagen/Monat</w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00933427">
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
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00933427">
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
                                <w:t xml:space="preserve">und/oder </w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00933427">
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
                                <w:t xml:space="preserve">Xylocain-Nasenspray </w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00933427">
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
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00933427">
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
                                <w:t>und/oder</w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00933427">
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
                                <w:t>10 ml Eiswasser</w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRPr="00166F0D" w:rsidRDefault="00877D06" w:rsidP="00933427">
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
                        </w:p>
                    </w:tc>
                </w:tr>
            </xsl:if>

            <w:bookmarkEnd w:id="13"/>

            <xsl:if test="$diag_spaks">
                <w:tr w:rsidR="00877D06" w:rsidRPr="00166F0D">
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="3706" w:type="dxa"/>
                            <w:gridSpan w:val="2"/>
                        </w:tcPr>
                        <w:p w:rsidR="00877D06" w:rsidRPr="00166F0D" w:rsidRDefault="00877D06" w:rsidP="006622C9">
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
                            <w:r w:rsidRPr="00166F0D">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t>Kopfschmerz vom Spannungstyp</w:t>
                            </w:r>
                        </w:p>
                    </w:tc>
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="5391" w:type="dxa"/>
                            <w:gridSpan w:val="2"/>
                        </w:tcPr>
                        <w:p w:rsidR="00877D06" w:rsidRPr="00166F0D" w:rsidRDefault="00877D06" w:rsidP="006622C9">
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
                            <w:r w:rsidRPr="00166F0D">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                                <w:t xml:space="preserve">Euminz N kutan im Bereich der schmerzhaften Kopfpartien 3x im Abstand von jeweils 10 Minuten auftragen</w:t>
                            </w:r>
                        </w:p>
                    </w:tc>
                </w:tr>
            </xsl:if>

            <w:tr w:rsidR="00877D06" w:rsidRPr="00166F0D">
                <w:tc>
                    <w:tcPr>
                        <w:tcW w:w="3706" w:type="dxa"/>
                        <w:gridSpan w:val="2"/>
                    </w:tcPr>
                    <w:p w:rsidR="00877D06" w:rsidRPr="00166F0D" w:rsidRDefault="00877D06" w:rsidP="000B07A2">
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
                    </w:p>
                </w:tc>
                <w:tc>
                    <w:tcPr>
                        <w:tcW w:w="5391" w:type="dxa"/>
                        <w:gridSpan w:val="2"/>
                    </w:tcPr>
                    <w:p w:rsidR="00877D06" w:rsidRPr="00166F0D" w:rsidRDefault="00877D06" w:rsidP="000B07A2">
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
                    </w:p>
                </w:tc>
            </w:tr>

            <w:tr w:rsidR="00877D06" w:rsidRPr="00166F0D">
                <w:tc>
                    <w:tcPr>
                        <w:tcW w:w="9097" w:type="dxa"/>
                        <w:gridSpan w:val="4"/>
                    </w:tcPr>
                    <w:p w:rsidR="00877D06" w:rsidRPr="004F573F" w:rsidRDefault="00877D06" w:rsidP="00747319">
                        <w:pPr>
                            <w:rPr>
                                <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                          w:cs="Lucida Sans Unicode"/>
                                <w:sz w:val="18"/>
                                <w:szCs w:val="18"/>
                            </w:rPr>
                        </w:pPr>
                        <w:r w:rsidRPr="00222B14">
                            <w:rPr>
                                <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                          w:cs="Lucida Sans Unicode"/>
                                <w:b/>
                                <w:bCs/>
                                <w:sz w:val="18"/>
                                <w:szCs w:val="18"/>
                            </w:rPr>
                            <w:t>10-20-Regel</w:t>
                        </w:r>
                        <w:r w:rsidRPr="004F573F">
                            <w:rPr>
                                <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                          w:cs="Lucida Sans Unicode"/>
                                <w:sz w:val="18"/>
                                <w:szCs w:val="18"/>
                            </w:rPr>
                            <w:t xml:space="preserve"> zur Vorbeugung von Kopfschmerzen bei Medikamentenübergebrauch:</w:t>
                        </w:r>
                    </w:p>
                    <w:p w:rsidR="00877D06" w:rsidRPr="001174AC" w:rsidRDefault="00877D06" w:rsidP="00747319">
                        <w:pPr>
                            <w:numPr>
                                <w:ilvl w:val="0"/>
                                <w:numId w:val="21"/>
                            </w:numPr>
                            <w:ind w:left="601" w:hanging="241"/>
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
                                <w:sz w:val="16"/>
                                <w:szCs w:val="16"/>
                            </w:rPr>
                            <w:t xml:space="preserve">Schmerzmittel und/oder Triptane </w:t>
                        </w:r>
                        <w:r>
                            <w:rPr>
                                <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                          w:cs="Lucida Sans Unicode"/>
                                <w:b/>
                                <w:bCs/>
                                <w:sz w:val="16"/>
                                <w:szCs w:val="16"/>
                            </w:rPr>
                            <w:t>maximal an 10 Tagen/Monat</w:t>
                        </w:r>
                        <w:r>
                            <w:rPr>
                                <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                          w:cs="Lucida Sans Unicode"/>
                                <w:sz w:val="16"/>
                                <w:szCs w:val="16"/>
                            </w:rPr>
                            <w:t xml:space="preserve"> einnehmen, an mindestens 20 Tagen/Monat keine Akutmedikamente einsetzen.</w:t>
                        </w:r>
                    </w:p>

                    <xsl:if test="$diag_migraine_with_aura">
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00747319">
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:ind w:left="601" w:hanging="241"/>
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
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve">Triptane sind während einer </w:t>
                            </w:r>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:b/>
                                    <w:bCs/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t>Aura</w:t>
                            </w:r>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve"> kontraindiziert.</w:t>
                            </w:r>
                        </w:p>
                    </xsl:if>

                    <xsl:if test="$age > 64">
                        <w:p w:rsidR="00877D06" w:rsidRPr="00A27897" w:rsidRDefault="00877D06" w:rsidP="00427FCB">
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:ind w:left="601" w:hanging="241"/>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                    <w:highlight w:val="yellow"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="00A27897">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                    <w:highlight w:val="yellow"/>
                                </w:rPr>
                                <w:t>Kardiovaskuläre Risikofaktoren bestehen nach individueller Abklärung nicht. Aufgrund dieser Situation sehen wir aktuell nach ausführlicher Aufklärung keine individuelle Kontraindikation für die Behandlung mit Sumatriptan über dem 65. Lebensjahr.</w:t>
                            </w:r>
                        </w:p>
                    </xsl:if>

                    <w:p w:rsidR="00877D06" w:rsidRPr="000302C9" w:rsidRDefault="00877D06" w:rsidP="00A50791">
                        <w:pPr>
                            <w:numPr>
                                <w:ilvl w:val="0"/>
                                <w:numId w:val="21"/>
                            </w:numPr>
                            <w:ind w:left="601" w:hanging="241"/>
                            <w:rPr>
                                <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                          w:cs="Lucida Sans Unicode"/>
                                <w:sz w:val="18"/>
                                <w:szCs w:val="18"/>
                                <w:highlight w:val="yellow"/>
                            </w:rPr>
                        </w:pPr>
                        <w:r w:rsidRPr="000302C9">
                            <w:rPr>
                                <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                          w:cs="Lucida Sans Unicode"/>
                                <w:sz w:val="16"/>
                                <w:szCs w:val="16"/>
                                <w:highlight w:val="yellow"/>
                            </w:rPr>
                            <w:t>Beachtung des Agranulozytoserisikos unter Metamizol. Bei Fieber/Schüttelfrost, Halsschmerzen, Abgeschlagenheit oder Affektionen von Haut und Schleimhäuten ist unverzüglich ein Arzt aufzusuchen und auf die Medikamenteneinnahme hinzuweisen. </w:t>
                        </w:r>
                    </w:p>

                    <xsl:if test="$diag_overuse">
                        <w:p w:rsidR="00877D06" w:rsidRPr="0012639C" w:rsidRDefault="00877D06" w:rsidP="001B3A32">
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:ind w:left="601" w:hanging="241"/>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="0012639C">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve">Wir empfehlen die ambulante Fortführung der </w:t>
                            </w:r>
                            <w:r w:rsidRPr="0012639C">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:b/>
                                    <w:bCs/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t>Analgetikapause für insgesamt vier Wochen.</w:t>
                            </w:r>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve"> Medikamentenpause heißt: Alle Medikamente für die Akutbehandlung von Kopfschmerzen dürfen für einen bestimmten Zeitraum nicht eingenommen werden. Die Pause hat nach spätestens vier bis sechs Wochen ihr Ziel erreicht und kann beendet werden. Attacken können dann wieder mit Akutmedikation behandelt werden. Eine medikamentöse Attackentherapie kann auch dann wieder beginnen. Nach Abschluss der Analgetikapause sollte eine Reevaluation der Kopfschmerzen und entsprechende Diagnosesicherung erfolgen.</w:t>
                            </w:r>
                        </w:p>
                    </xsl:if>

                    <w:p w:rsidR="00877D06" w:rsidRPr="00863314" w:rsidRDefault="00764662" w:rsidP="00455D2B">
                        <w:pPr>
                            <w:numPr>
                                <w:ilvl w:val="0"/>
                                <w:numId w:val="21"/>
                            </w:numPr>
                            <w:ind w:left="601" w:hanging="241"/>
                            <w:rPr>
                                <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                          w:cs="Lucida Sans Unicode"/>
                                <w:sz w:val="18"/>
                                <w:szCs w:val="18"/>
                            </w:rPr>
                        </w:pPr>
                        <w:hyperlink>
                            <w:r w:rsidR="00877D06">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:b/>
                                    <w:bCs/>
                                    <w:color w:val="0000FF"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                    <w:u w:val="single"/>
                                </w:rPr>
                                <w:t>www.headbook.me</w:t>
                            </w:r>
                        </w:hyperlink>
                        <w:r w:rsidR="00877D06">
                            <w:rPr>
                                <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                          w:cs="Lucida Sans Unicode"/>
                                <w:sz w:val="16"/>
                                <w:szCs w:val="16"/>
                            </w:rPr>
                            <w:t xml:space="preserve">  Informations- und Selbsthilfeforum der Schmerzklinik Kiel im Internet zu allen Fragen der Schmerztherapie. Austausch mit Betroffenen. Monatlicher Live-Chat mit Prof. Dr. Göbel zu Fragen der Schmerztherapie.</w:t>
                        </w:r>
                    </w:p>
                </w:tc>
            </w:tr>
        </w:tbl>
    </xsl:template>
</xsl:stylesheet>