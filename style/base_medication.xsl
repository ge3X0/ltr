<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">

    <xsl:template match="basismedikation_zuvor">
        <xsl:for-each select="$data//medication[@when = 'former' and @which = 'base']/entry">
            <xsl:value-of select="normalize-space(name)"/>
            <xsl:if test="position() &lt; last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="//w:p[.//basismedikation]">
        <xsl:variable name="base" select="$data//medication[@when = 'current' and @which = 'base']/entry"/>
        <xsl:variable name="tza"
                      select="$base/name[text() = 'Amitriptylin' or text() = 'Trimipramin' or text() = 'Doxepin']"/>
        <xsl:variable name="cgrp"
                      select="$base/name[text() = 'Erenumab' or text() = 'Fremanezumab' or text() = 'Galcanezumab']"/>
        <xsl:variable name="rr_med"
                      select="$base/name[text() = 'Amlodipin' or text() = 'Bisoprolol' or text() = 'Metoprolol']"/>

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
                <w:gridCol w:w="3686"/>
                <w:gridCol w:w="1276"/>
                <w:gridCol w:w="992"/>
                <w:gridCol w:w="992"/>
                <w:gridCol w:w="992"/>
                <w:gridCol w:w="1134"/>
            </w:tblGrid>

            <w:tr w:rsidR="00877D06" w:rsidRPr="00166F0D">
                <w:tc>
                    <w:tcPr>
                        <w:tcW w:w="9072" w:type="dxa"/>
                        <w:gridSpan w:val="6"/>
                        <w:shd w:val="clear" w:color="auto" w:fill="BFBFBF"/>
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
                                <w:b/>
                                <w:bCs/>
                                <w:sz w:val="18"/>
                                <w:szCs w:val="18"/>
                            </w:rPr>
                        </w:pPr>
                        <w:r w:rsidRPr="00166F0D">
                            <w:rPr>
                                <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                          w:cs="Lucida Sans Unicode"/>
                                <w:b/>
                                <w:bCs/>
                                <w:sz w:val="18"/>
                                <w:szCs w:val="18"/>
                            </w:rPr>
                            <w:t>Schmerztherapeutische Basismedikation</w:t>
                        </w:r>
                    </w:p>
                </w:tc>
            </w:tr>

            <w:tr w:rsidR="00877D06" w:rsidRPr="00166F0D">
                <w:tc>
                    <w:tcPr>
                        <w:tcW w:w="3686" w:type="dxa"/>
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
                <w:tc>
                    <w:tcPr>
                        <w:tcW w:w="1276" w:type="dxa"/>
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
                            <w:t>Dosis</w:t>
                        </w:r>
                    </w:p>
                </w:tc>
                <w:tc>
                    <w:tcPr>
                        <w:tcW w:w="992" w:type="dxa"/>
                    </w:tcPr>
                    <w:p w:rsidR="00877D06" w:rsidRPr="00166F0D" w:rsidRDefault="00877D06" w:rsidP="000B07A2">
                        <w:pPr>
                            <w:tabs>
                                <w:tab w:val="left" w:pos="1701"/>
                                <w:tab w:val="left" w:pos="2268"/>
                                <w:tab w:val="left" w:pos="6804"/>
                            </w:tabs>
                            <w:jc w:val="center"/>
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
                            <w:t>07:00</w:t>
                        </w:r>
                    </w:p>
                </w:tc>
                <w:tc>
                    <w:tcPr>
                        <w:tcW w:w="992" w:type="dxa"/>
                    </w:tcPr>
                    <w:p w:rsidR="00877D06" w:rsidRPr="00166F0D" w:rsidRDefault="00877D06" w:rsidP="000B07A2">
                        <w:pPr>
                            <w:tabs>
                                <w:tab w:val="left" w:pos="1701"/>
                                <w:tab w:val="left" w:pos="2268"/>
                                <w:tab w:val="left" w:pos="6804"/>
                            </w:tabs>
                            <w:jc w:val="center"/>
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
                            <w:t>13:00</w:t>
                        </w:r>
                    </w:p>
                </w:tc>
                <w:tc>
                    <w:tcPr>
                        <w:tcW w:w="992" w:type="dxa"/>
                    </w:tcPr>
                    <w:p w:rsidR="00877D06" w:rsidRPr="00166F0D" w:rsidRDefault="00877D06" w:rsidP="000B07A2">
                        <w:pPr>
                            <w:tabs>
                                <w:tab w:val="left" w:pos="1701"/>
                                <w:tab w:val="left" w:pos="2268"/>
                                <w:tab w:val="left" w:pos="6804"/>
                            </w:tabs>
                            <w:jc w:val="center"/>
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
                            <w:t>19:00</w:t>
                        </w:r>
                    </w:p>
                </w:tc>
                <w:tc>
                    <w:tcPr>
                        <w:tcW w:w="1134" w:type="dxa"/>
                    </w:tcPr>
                    <w:p w:rsidR="00877D06" w:rsidRPr="00166F0D" w:rsidRDefault="00877D06" w:rsidP="000B07A2">
                        <w:pPr>
                            <w:tabs>
                                <w:tab w:val="left" w:pos="1701"/>
                                <w:tab w:val="left" w:pos="2268"/>
                                <w:tab w:val="left" w:pos="6804"/>
                            </w:tabs>
                            <w:jc w:val="center"/>
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
                            <w:t>Zur Nacht</w:t>
                        </w:r>
                    </w:p>
                </w:tc>
            </w:tr>

            <xsl:for-each select="$base">
                <w:tr>
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="3686" w:type="dxa"/>
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
                                <w:t>
                                    <xsl:value-of select="name"/>
                                </w:t>
                            </w:r>
                        </w:p>
                    </w:tc>
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="1276" w:type="dxa"/>
                        </w:tcPr>
                        <w:p w:rsidR="00877D06" w:rsidRPr="00166F0D" w:rsidRDefault="00877D06" w:rsidP="00787D01">
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
                                <w:t>
                                    <xsl:value-of select="dosis"/>
                                    <xsl:value-of select="unit"/>
                                </w:t>
                            </w:r>
                        </w:p>
                    </w:tc>
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="992" w:type="dxa"/>
                        </w:tcPr>
                        <w:p w:rsidR="00877D06" w:rsidRPr="00166F0D" w:rsidRDefault="00877D06" w:rsidP="00787D01">
                            <w:pPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="1701"/>
                                    <w:tab w:val="left" w:pos="2268"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:jc w:val="center"/>
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
                                <w:t>
                                    <xsl:value-of select="morning"/>
                                </w:t>
                            </w:r>
                        </w:p>
                    </w:tc>
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="992" w:type="dxa"/>
                        </w:tcPr>
                        <w:p w:rsidR="00877D06" w:rsidRPr="00166F0D" w:rsidRDefault="00877D06" w:rsidP="00787D01">
                            <w:pPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="1701"/>
                                    <w:tab w:val="left" w:pos="2268"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:jc w:val="center"/>
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
                                <w:t>
                                    <xsl:value-of select="noon"/>
                                </w:t>
                            </w:r>
                        </w:p>
                    </w:tc>
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="992" w:type="dxa"/>
                        </w:tcPr>
                        <w:p w:rsidR="00877D06" w:rsidRPr="00166F0D" w:rsidRDefault="00877D06" w:rsidP="00787D01">
                            <w:pPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="1701"/>
                                    <w:tab w:val="left" w:pos="2268"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:jc w:val="center"/>
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
                                <w:t>
                                    <xsl:value-of select="evening"/>
                                </w:t>
                            </w:r>
                        </w:p>
                    </w:tc>
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="1134" w:type="dxa"/>
                        </w:tcPr>
                        <w:p w:rsidR="00877D06" w:rsidRPr="00166F0D" w:rsidRDefault="00877D06" w:rsidP="00787D01">
                            <w:pPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="1701"/>
                                    <w:tab w:val="left" w:pos="2268"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:jc w:val="center"/>
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
                                <w:t>
                                    <xsl:value-of select="night"/>
                                </w:t>
                            </w:r>
                        </w:p>
                    </w:tc>
                </w:tr>
            </xsl:for-each>

            <w:tr w:rsidR="00877D06" w:rsidRPr="00166F0D">
                <w:tc>
                    <w:tcPr>
                        <w:tcW w:w="3686" w:type="dxa"/>
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
                        <w:tcW w:w="1276" w:type="dxa"/>
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
                        <w:tcW w:w="992" w:type="dxa"/>
                    </w:tcPr>
                    <w:p w:rsidR="00877D06" w:rsidRPr="00166F0D" w:rsidRDefault="00877D06" w:rsidP="000B07A2">
                        <w:pPr>
                            <w:tabs>
                                <w:tab w:val="left" w:pos="1701"/>
                                <w:tab w:val="left" w:pos="2268"/>
                                <w:tab w:val="left" w:pos="6804"/>
                            </w:tabs>
                            <w:jc w:val="center"/>
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
                        <w:tcW w:w="992" w:type="dxa"/>
                    </w:tcPr>
                    <w:p w:rsidR="00877D06" w:rsidRPr="00166F0D" w:rsidRDefault="00877D06" w:rsidP="000B07A2">
                        <w:pPr>
                            <w:tabs>
                                <w:tab w:val="left" w:pos="1701"/>
                                <w:tab w:val="left" w:pos="2268"/>
                                <w:tab w:val="left" w:pos="6804"/>
                            </w:tabs>
                            <w:jc w:val="center"/>
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
                        <w:tcW w:w="992" w:type="dxa"/>
                    </w:tcPr>
                    <w:p w:rsidR="00877D06" w:rsidRPr="00166F0D" w:rsidRDefault="00877D06" w:rsidP="000B07A2">
                        <w:pPr>
                            <w:tabs>
                                <w:tab w:val="left" w:pos="1701"/>
                                <w:tab w:val="left" w:pos="2268"/>
                                <w:tab w:val="left" w:pos="6804"/>
                            </w:tabs>
                            <w:jc w:val="center"/>
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
                        <w:tcW w:w="1134" w:type="dxa"/>
                    </w:tcPr>
                    <w:p w:rsidR="00877D06" w:rsidRPr="00166F0D" w:rsidRDefault="00877D06" w:rsidP="000B07A2">
                        <w:pPr>
                            <w:tabs>
                                <w:tab w:val="left" w:pos="1701"/>
                                <w:tab w:val="left" w:pos="2268"/>
                                <w:tab w:val="left" w:pos="6804"/>
                            </w:tabs>
                            <w:jc w:val="center"/>
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

            <xsl:if test="$diag_chronic_migraine">
                <w:tr w:rsidR="00877D06" w:rsidRPr="00166F0D">
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="9072" w:type="dxa"/>
                            <w:gridSpan w:val="6"/>
                        </w:tcPr>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="005863E9">
                            <w:pPr>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="00954E45">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                    <w:highlight w:val="yellow"/>
                                </w:rPr>
                                <w:t>Als zusätzliche Prophylaxe setzten wir bei der hier vorliegenden chronischen Migräne Botulinumtoxin Typ A nach dem PREEMPT-Schema ein. Bei guter Wirksamkeit empfehlen wir eine Wiederholung alle 3 Monate.</w:t>
                            </w:r>
                        </w:p>
                    </w:tc>
                </w:tr>
            </xsl:if>

            <w:tr w:rsidR="00877D06" w:rsidRPr="00166F0D">
                <w:tc>
                    <w:tcPr>
                        <w:tcW w:w="9072" w:type="dxa"/>
                        <w:gridSpan w:val="6"/>
                    </w:tcPr>
                    <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="005863E9">
                        <w:pPr>
                            <w:tabs>
                                <w:tab w:val="left" w:pos="743"/>
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
                            <w:t>Regeln zur medikamentösen Basistherapie</w:t>
                        </w:r>
                    </w:p>

                    <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="005863E9">
                        <w:pPr>
                            <w:numPr>
                                <w:ilvl w:val="0"/>
                                <w:numId w:val="21"/>
                            </w:numPr>
                            <w:tabs>
                                <w:tab w:val="left" w:pos="743"/>
                                <w:tab w:val="left" w:pos="6804"/>
                            </w:tabs>
                            <w:rPr>
                                <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                          w:cs="Lucida Sans Unicode"/>
                                <w:sz w:val="16"/>
                                <w:szCs w:val="16"/>
                            </w:rPr>
                        </w:pPr>
                        <w:r>
                            <w:rPr>
                                <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                          w:cs="Lucida Sans Unicode"/>
                                <w:sz w:val="16"/>
                                <w:szCs w:val="16"/>
                            </w:rPr>
                            <w:t>Kontinuierliche Migräne-App (iOS und Android kostenlos) führen</w:t>
                        </w:r>
                    </w:p>

                    <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="005863E9">
                        <w:pPr>
                            <w:numPr>
                                <w:ilvl w:val="0"/>
                                <w:numId w:val="21"/>
                            </w:numPr>
                            <w:tabs>
                                <w:tab w:val="left" w:pos="743"/>
                                <w:tab w:val="left" w:pos="6804"/>
                            </w:tabs>
                            <w:rPr>
                                <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                          w:cs="Lucida Sans Unicode"/>
                                <w:sz w:val="16"/>
                                <w:szCs w:val="16"/>
                            </w:rPr>
                        </w:pPr>
                        <w:r w:rsidRPr="00CF4F2F">
                            <w:rPr>
                                <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                          w:cs="Lucida Sans Unicode"/>
                                <w:sz w:val="16"/>
                                <w:szCs w:val="16"/>
                                <w:highlight w:val="yellow"/>
                            </w:rPr>
                            <w:t>Eine Einweisung in das Cefaly-Neuromodulationssystem erfolgte. Eine Weiterbehandlung wird empfohlen.</w:t>
                        </w:r>
                    </w:p>

                    <xsl:if test="$cgrp">
                        <w:p w:rsidR="00877D06" w:rsidRPr="00675C3C" w:rsidRDefault="00877D06" w:rsidP="001F38D3">
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="743"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve">Die Gabe von </w:t>
                            </w:r>
                            <w:r w:rsidRPr="001F38D3">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:b/>
                                    <w:bCs/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t>
                                    <xsl:value-of select="$cgrp"/>
                                </w:t>
                            </w:r>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve"> sollte 1x monatlich erfolgen. Es sollte eine regelmäßige Überprüfung der Indikation erfolgen sowie der Wirksamkeit. Ein Auslassversuch sollte nach 12 Monaten erfolgen. </w:t>
                            </w:r>
                        </w:p>
                    </xsl:if>

                    <xsl:if test="$diag_chronic_migraine">
                        <w:p>
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="743"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve">Bei mangelnder Wirksamkeit kann die prophylaktische Therapie mit </w:t>
                            </w:r>
                            <w:r w:rsidRPr="001F38D3">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:b/>
                                    <w:bCs/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t>Atogepant 60 mg (Aquipta®)</w:t>
                            </w:r>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve"> 1x täglich erwogen werden. Der Wirkeintritt erfolgt meist innerhalb der ersten 4 – 12 Wochen. Atogepant darf nicht mit dem Antibiotikum Clarithromycin und den Pilzmitteln Ketoconazol und Itraconazol kombiniert werden. Für diesen Zeitraum der Einnahme der genannten Medikamente empfehlen wir das Absetzen des Atogepant. Auf den Genuss von Grapefruit oder Grapefruitsaft sollte verzichtet werden. Wir empfehlen eine regelmäßige Überprüfung der Indikation und Wirksamkeit.</w:t>
                            </w:r>
                        </w:p>
                    </xsl:if>

                    <xsl:if test="$base/name[text() = 'Venlafaxin']">
                        <w:p w:rsidR="00877D06" w:rsidRPr="001C344C" w:rsidRDefault="00877D06" w:rsidP="005863E9">
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="743"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="00BF7770">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t>Im Verlauf kann bei weiterhin guter Verträglichkeit des</w:t>
                            </w:r>
                            <w:r w:rsidRPr="00BF7770">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:b/>
                                    <w:bCs/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve"> Venlafaxins</w:t>
                            </w:r>
                            <w:r w:rsidRPr="00BF7770">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve"> und nicht ausreichender Wirksamkeit eine weitere Dosisanpassung unter Labor- (u.a. Leberwerte) sowie EKG-Kontrollen erfolgen. Die Zieldosis beträgt hier 75-150 mg. Eine Überprüfung der Indikation empfehlen wir bei guter Verträglichkeit und Wirksamkeit frühestens nach 6-9 Monaten. Venlafaxin beim Auslassversuch bitte sukzessive in der Dosis reduzieren, um unangenehme Absetzsymptome (in der Regel grippeartig) zu vermeiden.</w:t>
                            </w:r>
                        </w:p>
                    </xsl:if>

                    <xsl:if test="$tza">
                        <w:p>
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="743"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="00872C49">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t>Im Verlauf kann bei weiterhin guter Verträglichkeit des</w:t>
                            </w:r>
                            <w:r w:rsidRPr="00872C49">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:b/>
                                    <w:bCs/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve"> <xsl:value-of select="$tza"/></w:t>
                            </w:r>
                            <w:r w:rsidRPr="00872C49">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve"> unter Labor- (u.a. Leberwerte) sowie EKG-Kontrollen eine weitere Dosisanpassung erfolgen. Die Zieldosis beträgt aus schmerztherapeutischer Sicht 50-100 mg pro Tag. Eine Überprüfung der Indikation empfehlen wir bei guter Verträglichkeit und Wirksamkeit frühestens nach 6-9 Monaten. </w:t>
                            </w:r>
                        </w:p>
                    </xsl:if>

                    <xsl:if test="$base/name[text() = 'Etoricoxib']">
                        <w:p w:rsidR="00877D06" w:rsidRPr="00872C49" w:rsidRDefault="00877D06" w:rsidP="00AD65A9">
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="743"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve">Das nichtsteroidale Antirheumatikum (NSAR) </w:t>
                            </w:r>
                            <w:r w:rsidRPr="00E57C1F">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:b/>
                                    <w:bCs/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t>Etoricoxib</w:t>
                            </w:r>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve"> wirkt schmerzlindernd und entzündungshemmend. Die Behandlungsdauer mit Etoricoxib ist zunächst auf 8 Wochen begrenzt. Anschließend Reevaluation empfohlen. </w:t>
                            </w:r>
                        </w:p>
                    </xsl:if>

                    <xsl:if test="$base/name[text() = 'Duloxetin']">
                        <w:p>
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="743"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="000936AD">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:b/>
                                    <w:bCs/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t>Duloxetin</w:t>
                            </w:r>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve"> kann im Verlauf bei guter Verträglichkeit und unter Leberwert- und EKG-Kontrollen vorsichtig weiter aufdosiert werden. Die Zieldosis aus schmerztherapeutischer Sicht sind hierbei 60 mg pro Tag. </w:t>
                            </w:r>
                        </w:p>
                    </xsl:if>

                    <xsl:if test="$base/name[text() = 'Escitalopram']">
                        <w:p>
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="743"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="002F48AE">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:b/>
                                    <w:bCs/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t>Escitalopram</w:t>
                            </w:r>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve"> dient neben der Förderung der Neuroplastizität auch der Stimmungsaufhellung und Anxiolyse. Eine Dosisanpassung bis 10mg/d kann bei guter Verträglichkeit und Wirksamkeit unter Labor- (u.a. Leberwerte) sowie EKG-Kontrollen erfolgen. Eine Überprüfung der Indikation empfehlen wir bei guter Verträglichkeit und Wirksamkeit frühestens nach 9-12 Monaten. SSRI beim Auslassversuch bitte sukzessive in der Dosis reduzieren, um unangenehme Absetzsymptome zu vermeiden.</w:t>
                            </w:r>
                        </w:p>
                    </xsl:if>

                    <xsl:if test="$base/name[text() = 'Mirtazapin']">
                        <w:p w:rsidR="00877D06" w:rsidRPr="00A24C84" w:rsidRDefault="00877D06" w:rsidP="005863E9">
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="743"/>
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
                            <w:r w:rsidRPr="00784B1F">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve">Evaluation der Wirksamkeit 8 Wochen nach der hier erreichten Zieldosis des </w:t>
                            </w:r>
                            <w:r w:rsidRPr="0063630E">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:b/>
                                    <w:bCs/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t>Mirtazapins</w:t>
                            </w:r>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t>. Diese ist aus schmerztherapeutischer Sicht 30-45 mg. Eine Überprüfung der Indikation empfehlen wir bei guter Verträglichkeit nach 6-9 Monaten. </w:t>
                            </w:r>
                        </w:p>
                    </xsl:if>

                    <xsl:if test="$base/name[text() = 'Opipramol']">
                        <w:p w:rsidR="00877D06" w:rsidRPr="00DB3F3C" w:rsidRDefault="00877D06" w:rsidP="005863E9">
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="743"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:ind w:left="714" w:hanging="357"/>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                            </w:pPr>

                            <w:r w:rsidRPr="00432507">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve">Evaluation der Wirksamkeit 8 Wochen nach der hier erreichten Zieldosis des </w:t>
                            </w:r>
                            <w:r w:rsidRPr="00432507">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:b/>
                                    <w:bCs/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t>Opipramols</w:t>
                            </w:r>
                            <w:r w:rsidRPr="00432507">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t>. Zieldosis aus schmerztherapeutischer Sicht sind hierbei 100-150 mg. Eine Überprüfung der Indikation empfehlen wir bei guter Verträglichkeit nach 6-9 Monaten. </w:t>
                            </w:r>
                        </w:p>
                    </xsl:if>

                    <xsl:if test="$base/name[text() = 'Pregabalin']">
                        <w:p w:rsidR="00877D06" w:rsidRPr="00DB3F3C" w:rsidRDefault="00877D06" w:rsidP="00635C56">
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="743"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve">Die Gabe von </w:t>
                            </w:r>
                            <w:r w:rsidRPr="00A364B9">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:b/>
                                    <w:bCs/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t>Pregabalin</w:t>
                            </w:r>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve"> ist zeitlich nicht befristet. Die Dosis des Pregabalins kann abhängig vom klinischen Verlauf bei guter Verträglichkeit und unter Leberwert- und Elektrolytkontrolle weiter erhöht werden. Zieldosis aus schmerztherapeutischer Sicht ist 150-300 mg pro Tag.</w:t>
                            </w:r>
                        </w:p>
                    </xsl:if>

                    <xsl:if test="$base/name[text() = 'Topiramat']">
                        <w:p w:rsidR="00877D06" w:rsidRPr="00DB3F3C" w:rsidRDefault="00877D06" w:rsidP="005863E9">
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="743"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:ind w:left="714" w:hanging="357"/>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="00432507">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve">Evaluation der Wirksamkeit 8 Wochen nach der hier erreichten Zieldosis des </w:t>
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
                                <w:t>Topiramats</w:t>
                            </w:r>
                            <w:r w:rsidRPr="00432507">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve">. Zieldosis aus schmerztherapeutischer Sicht ist hierbei 25-100 mg/Tag. Eine Überprüfung der Indikation empfehlen wir bei guter Verträglichkeit nach 6-9 Monaten. </w:t>
                            </w:r>
                        </w:p>
                    </xsl:if>

                    <xsl:if test="$base/name[text() = 'Candesartan']">
                        <w:p>
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="743"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="00B104BB">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:b/>
                                    <w:bCs/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t>Candesartan</w:t>
                            </w:r>
                            <w:r w:rsidRPr="00B104BB">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve"> dient neben der Einstellung des erhöhten Blutdrucks auch zur Migräneprophylaxe, bei arterieller Hypertonie ist die Einnahme nicht primär zeitlich begrenzt. Unter der Eindosierung sollen regelmäßige Blutdruckkontrollen erfolgen. Eine Dosisanpassung kann ebenfalls entsprechend der Blutdruckeinstellung erfolgen. Zieldosis aus schmerztherapeutischer Sicht sind 16 mg/Tag.</w:t>
                            </w:r>
                        </w:p>
                    </xsl:if>

                    <xsl:if test="$rr_med">
                        <w:p w:rsidR="00877D06" w:rsidRPr="00E0410B" w:rsidRDefault="00877D06" w:rsidP="005863E9">
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="743"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="00E0410B">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:b/>
                                    <w:bCs/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t>
                                    <xsl:value-of select="$rr_med"/>
                                </w:t>
                            </w:r>
                            <w:r w:rsidRPr="00E0410B">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve"> dient neben der Einstellung des erhöhten Blutdrucks auch der Migräneprophylaxe. Bei arterieller Hypertonie ist die Einnahme nicht primär zeitlich begrenzt. Eine Dosisanpassung kann ebenfalls entsprechend der Blutdruckeinstellung erfolgen. </w:t>
                            </w:r>
                        </w:p>
                    </xsl:if>

                    <xsl:if test="$base/name[text() = 'Magnesium' or text() = 'Vitamin B2' or text() = 'Vit. B2' or text() = 'Riboflavin']">
                        <w:p w:rsidR="00877D06" w:rsidRPr="00DB3F3C" w:rsidRDefault="00877D06" w:rsidP="005863E9">
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="743"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="00DB3F3C">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve">Die Einnahme von </w:t>
                            </w:r>
                            <w:r w:rsidRPr="00DB3F3C">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:b/>
                                    <w:bCs/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t>Magnesium und Vitamin B2</w:t>
                            </w:r>
                            <w:r w:rsidRPr="00DB3F3C">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve"> sollte nach 1-2 Monaten in seiner Wirkung evaluiert werden. Magnesium und Vitamin B2 sind als Kombinationspräparat (z.B. Migravent) erhältlich.</w:t>
                            </w:r>
                        </w:p>
                    </xsl:if>

                    <xsl:if test="$base/name[text() = 'Sertralin']">
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="005863E9">
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="743"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:b/>
                                    <w:bCs/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve">Sertralin </w:t>
                            </w:r>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t>ist ein Antidepressivum aus der Wirkstoffgruppe der selektiven Serotonin-Wiederaufnahme-Inhibitoren (SSRI) und wird zur Behandlung und Prophylaxe von Depressionen, Panik, Angststörung sowie posttraumatischen Belastungsstörungen angewendet. </w:t>
                            </w:r>
                        </w:p>
                    </xsl:if>

                    <xsl:if test="$base/name[text() = 'Anafranil' or text() = 'Clompipramin']">
                        <w:p w:rsidR="00877D06" w:rsidRPr="00675C3C" w:rsidRDefault="00877D06" w:rsidP="005863E9">
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="743"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t>Evaluation der Wirksamkeit 8 Wochen nach Erreichen der Zieldosis des</w:t>
                            </w:r>
                            <w:r w:rsidRPr="00CE18C6">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:b/>
                                    <w:bCs/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t>Anafranils</w:t>
                            </w:r>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve">. Dies sind aus schmerztherapeutischer Sicht 75 mg/Tag. Eine Überprüfung der Indikation empfehlen wir bei guter Verträglichkeit und unter Labor- und Leberwerte- sowie EKG- und Blutdruckkontrollen unter Berücksichtigung des thymoleptischen Effektes nach 6-9 Monaten. </w:t>
                            </w:r>
                        </w:p>
                    </xsl:if>

                    <xsl:if test="$base/name[text() = 'Carbamazepin']">
                        <w:p w:rsidR="00877D06" w:rsidRPr="00675C3C" w:rsidRDefault="00877D06" w:rsidP="005863E9">
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="743"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="00675C3C">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:b/>
                                    <w:bCs/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t>Carbamazepin</w:t>
                            </w:r>
                            <w:r w:rsidRPr="00675C3C">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve"> kann im Verlauf bei guter Verträglichkeit und unter Leberwert- und Elektrolytwertkontrolle vorsichtig weiter aufdosiert werden. </w:t>
                            </w:r>
                        </w:p>
                    </xsl:if>

                    <xsl:if test="$base/name[text() = 'Gabapentin']">
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="005863E9">
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="743"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="00675C3C">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve">Die Dosis des </w:t>
                            </w:r>
                            <w:r w:rsidRPr="00675C3C">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:b/>
                                    <w:bCs/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t>Gabapentin</w:t>
                            </w:r>
                            <w:r w:rsidRPr="00675C3C">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve"> kann abhängig vom klinischen Verlauf bei guter Verträglichkeit und unter Leberwert- und Elektrolytkontrolle weiter erhöht werden. Zieldosis aus schmerztherapeutischer Sicht sind 1.200-2.400 mg/Tag. </w:t>
                            </w:r>
                        </w:p>
                    </xsl:if>

                    <xsl:if test="$base/name[text() = 'Tizanidin']">
                        <w:p w:rsidR="00877D06" w:rsidRPr="00675C3C" w:rsidRDefault="00877D06" w:rsidP="005863E9">
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="743"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve">Die Wirksamkeit von </w:t>
                            </w:r>
                            <w:r w:rsidRPr="005574FA">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:b/>
                                    <w:bCs/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t>Tizanidin</w:t>
                            </w:r>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve"> auf die Kopfschmerzen soll im Verlauf evaluiert werden. Wir empfehlen nach 2-3 Monaten einen Auslassversuch durchzuführen. Bei nicht ausreichender Wirksamkeit kann ggf. eine Dosisanpassung erfolgen. Hierunter Labor- (Leberwerte) und EKG-Kontrollen erbeten.</w:t>
                            </w:r>
                        </w:p>
                    </xsl:if>

                    <xsl:if test="$base/name[text() = 'Flunarizin']">
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="005863E9">
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="743"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="00DB3F3C">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve">Auslassversuch von </w:t>
                            </w:r>
                            <w:r w:rsidRPr="00DB3F3C">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:b/>
                                    <w:bCs/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t>Flunarizin</w:t>
                            </w:r>
                            <w:r w:rsidRPr="00DB3F3C">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve"> nach maximal 6 bis 9 Monaten (Gefahr von extrapyramidal- motorischen Störungen)Flunarizin kann zu depressiven Verstimmungen, Angstzuständen, Schlaflosigkeit und Asthenie sowie zu extrapyramidal- motorischen Störungen führen. Wir empfehlen regelmäßige klinische Kontrollen. Eine Dosissteigerung des Flunarizins auf 5 mg täglich ist aus schmerztherapeutischer Sicht unter Beachtung der unerwünschten Arzneimittelwirkung sowie Labor- und EKG-Kontrollen möglich. Eine Dosissteigerung bis zu maximal 10 mg/Tag ist prinzipiell durchführbar. Bei Auftreten von Dyskinesien oder einer Stimmungsverschlechterung ggf. vorzeitiges Absetzen von Flunarizin. </w:t>
                            </w:r>
                        </w:p>
                    </xsl:if>

                    <xsl:if test="$base/name[text() = 'Atosil' or text() = 'Promethazin']">
                        <w:p w:rsidR="00877D06" w:rsidRPr="003B171E" w:rsidRDefault="00877D06" w:rsidP="005863E9">
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="743"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="18"/>
                                    <w:szCs w:val="18"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="00233748">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:b/>
                                    <w:bCs/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t>Atosil</w:t>
                            </w:r>
                            <w:r w:rsidRPr="00233748">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve"> (</w:t>
                            </w:r>
                            <w:r w:rsidRPr="009746CA">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:b/>
                                    <w:bCs/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t>Promethazin</w:t>
                            </w:r>
                            <w:r w:rsidRPr="00233748">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve">) bitte im Verlauf bei weiterer Stabilität ausschleichend absetzen.</w:t>
                            </w:r>
                        </w:p>
                    </xsl:if>

                    <xsl:if test="$base/name[text() = 'Lamotrigin']">
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="005863E9">
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="743"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="001F0DE9">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:b/>
                                    <w:bCs/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t>Lamotrigin</w:t>
                            </w:r>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve"> im Verlauf bei guter Verträglichkeit und unter Leberwert- und Elektrolytwert-Kontrolle vorsichtig weiter im 14-tägigen Abstand um 25 mg/Tag erhöhen. Bis zu einer Dosis von 100 mg sollte die Gabe nur morgendlich erfolgen, danach auf eine morgendliche und abendliche Gabe verteilen. Zieldosis aus schmerztherapeutischer Sicht sind hierbei 150 mg/die. </w:t>
                            </w:r>
                        </w:p>

                        <w:p w:rsidR="00877D06" w:rsidRPr="004D192F" w:rsidRDefault="00877D06" w:rsidP="00103E2F">
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="743"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="001F0DE9">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:b/>
                                    <w:bCs/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t>Lamotrigin</w:t>
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
                                <w:t xml:space="preserve"> kann bei plötzlichem Absetzen zu Rebound-Anfällen führen. Stufenweises Absetzen über einen Zeitraum von 2 Wochen empfohlen. Bei An- oder Wiederabsetzen potenzielle pharmakokinetische Wechselwirkungen bedenken. Labor- (Leberwerte) und EKG-Kontrolle während der Einnahme der oben genannten Medikation</w:t>
                            </w:r>
                        </w:p>

                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="005863E9">
                            <w:pPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="743"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:ind w:left="815"/>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="00C64365">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve">Östrogenhaltigen Kombinationspräparate wie Valette führen zu einer Senkung des </w:t>
                            </w:r>
                            <w:r w:rsidRPr="00C64365">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:b/>
                                    <w:bCs/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t>Lamotrigenspiegels.</w:t>
                            </w:r>
                            <w:r w:rsidRPr="00C64365">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve"> Während der Pillenpause kommt es zur Spiegelerhöhung und es kann infolgedessen zu einer Intoxikation kommen. Rein Gestagenhaltige Präparate haben keine wesentlichen Wechselwirkungen mit Lamotrigen.</w:t>
                            </w:r>
                        </w:p>
                    </xsl:if>

                    <!-- Immer !-->

                    <w:p w:rsidR="00877D06" w:rsidRPr="004D192F" w:rsidRDefault="00877D06" w:rsidP="005863E9">
                        <w:pPr>
                            <w:numPr>
                                <w:ilvl w:val="0"/>
                                <w:numId w:val="21"/>
                            </w:numPr>
                            <w:tabs>
                                <w:tab w:val="left" w:pos="743"/>
                                <w:tab w:val="left" w:pos="6804"/>
                            </w:tabs>
                            <w:rPr>
                                <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                          w:cs="Lucida Sans Unicode"/>
                                <w:sz w:val="16"/>
                                <w:szCs w:val="16"/>
                            </w:rPr>
                        </w:pPr>
                        <w:r w:rsidRPr="004D192F">
                            <w:rPr>
                                <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                          w:cs="Lucida Sans Unicode"/>
                                <w:sz w:val="16"/>
                                <w:szCs w:val="16"/>
                            </w:rPr>
                            <w:t>Labor- (Leberwerte) und EKG-Kontrolle während der Einnahme der oben genannten Medikation</w:t>
                        </w:r>
                    </w:p>

                    <w:p w:rsidR="00877D06" w:rsidRPr="004D192F" w:rsidRDefault="00877D06" w:rsidP="005863E9">
                        <w:pPr>
                            <w:numPr>
                                <w:ilvl w:val="0"/>
                                <w:numId w:val="21"/>
                            </w:numPr>
                            <w:tabs>
                                <w:tab w:val="left" w:pos="743"/>
                                <w:tab w:val="left" w:pos="6804"/>
                            </w:tabs>
                            <w:rPr>
                                <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                          w:cs="Lucida Sans Unicode"/>
                                <w:sz w:val="16"/>
                                <w:szCs w:val="16"/>
                            </w:rPr>
                        </w:pPr>
                        <w:r w:rsidRPr="004D192F">
                            <w:rPr>
                                <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                          w:cs="Lucida Sans Unicode"/>
                                <w:sz w:val="16"/>
                                <w:szCs w:val="16"/>
                            </w:rPr>
                            <w:t>Im Rahmen der Aufklärung bzgl. der Medikation wurde <xsl:call-template name="patient"/> auf die eingeschränkte Reaktionsfähigkeit insbesondere während der Eindosierungsphase durch o.g. Medikation hingewiesen sowie eine hierdurch bedingte mögliche Beeinträchtigung im Straßenverkehr.</w:t>
                        </w:r>
                    </w:p>

                    <xsl:if test="$base/name[
                    text() = 'Tramal' or text() = 'Tramadol' or text() = 'Tramadol ret.'
                    or text() = 'Tilidin' or text() = 'Tilidin ret.'
                    or text() = 'MST' or text() = 'MST ret.'
                    or text() = 'Oxycodon'
                    or text() = 'Tapentadol']">
                        <w:p>
                            <w:pPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="743"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:b/>
                                    <w:bCs/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                    <w:u w:val="single"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="00C64365">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:b/>
                                    <w:bCs/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                    <w:u w:val="single"/>
                                </w:rPr>
                                <w:t>Opioide</w:t>
                            </w:r>
                        </w:p>

                        <w:p w:rsidR="00877D06" w:rsidRPr="00C64365" w:rsidRDefault="00877D06" w:rsidP="005863E9">
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:jc w:val="both"/>
                                <w:rPr>
                                    <w:rStyle w:val="Hervorhebung"/>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:i w:val="0"/>
                                    <w:iCs w:val="0"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="00675C3C">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve">Anpassung der Dosierung von </w:t>
                            </w:r>
                            <w:r w:rsidRPr="00675C3C">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:b/>
                                    <w:bCs/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t>
                                    <xsl:value-of select="name"/>
                                </w:t>
                            </w:r>
                            <w:r w:rsidRPr="00675C3C">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve"> entsprechend der Wirksamkeit und Verträglichkeit. Einnahme im festen 12-stündigen Rhythmus. Es sollten keine unretardierten Opioide eingesetzt werden. Obstipationsprophylaxe mit Makrogol (Movicol), Nausea-Prophylaxe bei Bedarf mit Metoclopramid oder Dimenhydrinat empfohlen. Ausreichende Trinkmenge beachten! Wir empfehlen nach 6-9 Monaten einen Auslassversuch.</w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRPr="00675C3C" w:rsidRDefault="00877D06" w:rsidP="005863E9">
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:jc w:val="both"/>
                                <w:rPr>
                                    <w:rStyle w:val="Hervorhebung"/>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="00675C3C">
                                <w:rPr>
                                    <w:rStyle w:val="Hervorhebung"/>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:i w:val="0"/>
                                    <w:iCs w:val="0"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t>Durch zentralnervöse Nebenwirkungen wie z.B. Schwindel, Benommenheit, Müdigkeit zu Beginn der Behandlungen oder in höheren Dosen kann es auch bei bestimmungsgemäßem Gebrauch zu einer Einschränkung des Reaktionsvermögens kommen, insbesondere besteht eine mögliche Auswirkung auf die Fähigkeit zur aktiven Teilnahme im Straßenverkehr, zum Betrieb von Maschinen oder zum Arbeiten ohne sicheren Halt. Dies gilt ebenfalls in verstärktem Maße im Zusammenwirken mit Alkohol.</w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRPr="00675C3C" w:rsidRDefault="00877D06" w:rsidP="005863E9">
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="743"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="00675C3C">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t>Obstipationsprophylaxe mit Macrogol (Movicol®)</w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRPr="00675C3C" w:rsidRDefault="00877D06" w:rsidP="005863E9">
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="743"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="00675C3C">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve">Nauseaprophylaxe mit Metoclopramid oder Dimenhydrinat empfohlen </w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRPr="0099148E" w:rsidRDefault="00877D06" w:rsidP="0099148E">
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="743"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="00675C3C">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t>Ausreichende Trinkmenge beachten</w:t>
                            </w:r>
                        </w:p>
                    </xsl:if>

                    <xsl:if test="$diag_cluster">
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="008A1328">
                            <w:pPr>
                                <w:outlineLvl w:val="0"/>
                            </w:pPr>
                            <w:r>
                                <w:t>Cluster</w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00810AB5">
                            <w:pPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="743"/>
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
                                <w:t>Regeln zur medikamentösen Basistherapie</w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00810AB5">
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="743"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="004F573F">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t>Kontinuierlich Kopfschmerzkalender führen</w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00810AB5">
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="743"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t>Die Dosierung des Verapamils sollte dem Krankheitsverlauf angepasst werden. Bei unzureichender Wirkung kann ggf. eine weitere Dosissteigerung unter Beachtung von Verträglichkeit und Nebenwirkungsspektrum erfolgen, die Tagesdosis von 960 mg pro Tag nicht überschreitend. </w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00810AB5">
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="743"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve">Unter der aktuellen Verapamil-Medikation bitten wir um regelmäßige kardiologische Kontrollen mittels EKG und Echokardiographie sowie bei jeder Dosissteigerung </w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00810AB5">
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="743"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t>Wegen des chronischen Verlaufs der Clusterkopfschmerzen ist die Einnahme von Verapamil zeitlich nicht befristet. Dosisreduktion des Verapamils nach 4-6 attackenfreien Wochen, hierbei schrittweise ausdosieren. Bei erneutem Ausbrechen von Clusterattacken erneute schrittweise Aufdosierung </w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRPr="004C2EB7" w:rsidRDefault="00877D06" w:rsidP="00810AB5">
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="743"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="004C2EB7">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t>Wir bitten um kardiologische Kontrolluntersuchung der o.g. Medikation mit Echokardiographie, Langzeitbelastungs-EKG zeitnah durchzuführen </w:t>
                            </w:r>
                        </w:p>

                        <xsl:if test="$base/name[text() = 'Lithium' or text() = 'Hypnorex' or text() = 'Quilonum']">
                            <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00810AB5">
                                <w:pPr>
                                    <w:numPr>
                                        <w:ilvl w:val="0"/>
                                        <w:numId w:val="21"/>
                                    </w:numPr>
                                    <w:tabs>
                                        <w:tab w:val="left" w:pos="743"/>
                                        <w:tab w:val="left" w:pos="6804"/>
                                    </w:tabs>
                                    <w:rPr>
                                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                                  w:cs="Lucida Sans Unicode"/>
                                        <w:sz w:val="16"/>
                                        <w:szCs w:val="16"/>
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                                  w:cs="Lucida Sans Unicode"/>
                                        <w:sz w:val="16"/>
                                        <w:szCs w:val="16"/>
                                    </w:rPr>
                                    <w:t>Dosiserhöhung des Lithiums an die Attackenhäufigkeit angepasst. Maximaler Blutspiegel 0,6 mmol/l. Eine Dosisreduktion des Lithiums frühestens nach 4-6 attackenfreien Wochen. Hierbei schrittweise ausdosieren. Dosisreduktion von Verapamil nach Absetzen des Lithiums von weiteren 4-6 attackenfreien Wochen, hierbei nur schrittweise ausdosieren. Bei erneutem Ausbruch von Clusterattacken erneute schrittweise Aufdosierung. </w:t>
                                </w:r>
                            </w:p>
                            <w:p w:rsidR="00877D06" w:rsidRPr="004C2EB7" w:rsidRDefault="00877D06" w:rsidP="00810AB5">
                                <w:pPr>
                                    <w:numPr>
                                        <w:ilvl w:val="0"/>
                                        <w:numId w:val="21"/>
                                    </w:numPr>
                                    <w:tabs>
                                        <w:tab w:val="left" w:pos="743"/>
                                        <w:tab w:val="left" w:pos="6804"/>
                                    </w:tabs>
                                    <w:rPr>
                                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                                  w:cs="Lucida Sans Unicode"/>
                                        <w:sz w:val="16"/>
                                        <w:szCs w:val="16"/>
                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="004C2EB7">
                                    <w:rPr>
                                        <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                                  w:cs="Lucida Sans Unicode"/>
                                        <w:sz w:val="16"/>
                                        <w:szCs w:val="16"/>
                                    </w:rPr>
                                    <w:t>Die Bestimmung des Serumlithiumspiegels sollte in den ersten 4 Wochen wöchentlich vorgenommen werden, danach ggf. bei weiterer Einnahme im ersten halben Jahr 1x monatlich und später im vierteljährlichen Abstand. Die Bestimmung des Serumlithiumspiegels sollte möglichst genau 12 Stunden nach der letzten Einnahme erfolgen. Zwecksmäßigerweise wird die Bestimmung am Morgen vor der weiteren Tablettengabe durchgeführt. Wir bitten um eine sorgfältige Überwachung des Patienten während der Lithiummedikation. Folgende Untersuchungen werden gemäß Fachinformation jährlich empfohlen: T3, T4, TSH basal, ggf. TAH-Test, Natrium, Kalium und Calciumbestimmung, 24 Stundenurinvolumen, Kreatinin-Clearens, EKG, EEG, Urinanalyse, Blutdruckmessung, Blutbild und ggf. Überprüfung der rhenalen Konzentrationsleistung, Desmopressin-Test und eine vierteljährliche Messung von Körpergewicht und Halsumfang. Bitte kardiologische Kontrolluntersuchung mit Echokardiographie, Langzeit- und Belastungs-EKG zeitnah durchführen lassen. </w:t>
                                </w:r>
                            </w:p>
                        </xsl:if>

                        <w:p w:rsidR="00877D06" w:rsidRDefault="00877D06" w:rsidP="00810AB5">
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="743"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t>Da Clusterkopfschmerz eine Schmerzform ist die überdurchschnittlich häufig bei Rauchern auftritt und durch Alkohol triggerbar ist, empfahlen wir dringend eine Nikotin- und Alkoholabstinenz</w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRPr="004C2EB7" w:rsidRDefault="00877D06" w:rsidP="00810AB5">
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="743"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="004C2EB7">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t xml:space="preserve">Kein Nitrospray bei Clusterkopfschmerzen </w:t>
                            </w:r>
                        </w:p>
                        <w:p w:rsidR="00877D06" w:rsidRPr="004C2EB7" w:rsidRDefault="00877D06" w:rsidP="00810AB5">
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:tabs>
                                    <w:tab w:val="left" w:pos="743"/>
                                    <w:tab w:val="left" w:pos="6804"/>
                                </w:tabs>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                            </w:pPr>
                            <w:r w:rsidRPr="004C2EB7">
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                </w:rPr>
                                <w:t>Wir bitten um Kontrolluntersuchung der o.g. Medikation</w:t>
                            </w:r>
                        </w:p>

                    </xsl:if>
                </w:tc>
            </w:tr>
        </w:tbl>
    </xsl:template>
</xsl:stylesheet>
