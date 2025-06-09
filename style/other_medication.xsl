<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
    <xsl:template match="//w:p[.//sonstigemedikation]">
        <w:tbl>
            <w:tblPr>
                <w:tblW w:w="0" w:type="auto"/>
                <w:tblInd w:w="2" w:type="dxa"/>
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

            <w:tr>
                <w:tc>
                    <w:tcPr>
                        <w:tcW w:w="9072" w:type="dxa"/>
                        <w:gridSpan w:val="6"/>
                        <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                    </w:tcPr>

                    <w:p>
                        <w:pPr>
                            <w:jc w:val="both"/>
                        </w:pPr>
                        <xsl:call-template name="text-run">
                            <xsl:with-param name="bold" select="true()"/>
                            <xsl:with-param name="text">
                                <xsl:text>Sonstige Medikation</xsl:text>
                            </xsl:with-param>
                        </xsl:call-template>
                    </w:p>
                </w:tc>
            </w:tr>

            <w:tr>
                <w:tc>
                    <w:tcPr>
                        <w:tcW w:w="3686" w:type="dxa"/>
                    </w:tcPr>
                    <w:p w:rsidR="00877D06" w:rsidRPr="00166F0D" w:rsidRDefault="00877D06" w:rsidP="00787D01">
                        <w:pPr>
                            <w:jc w:val="both"/>
                            <w:rPr>
                                <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                          w:cs="Lucida Sans Unicode"/>
                            </w:rPr>
                        </w:pPr>
                        <xsl:call-template name="text-run">
                            <xsl:with-param name="size" select="14"/>
                            <xsl:with-param name="bold" select="true()"/>
                            <xsl:with-param name="text">
                                <xsl:text>Substanz/Medikation</xsl:text>
                            </xsl:with-param>
                        </xsl:call-template>
                    </w:p>
                </w:tc>

                <w:tc>
                    <w:tcPr>
                        <w:tcW w:w="1276" w:type="dxa"/>
                    </w:tcPr>
                    <w:p>
                        <w:pPr>
                            <w:jc w:val="both"/>
                        </w:pPr>
                        <xsl:call-template name="text-run">
                            <xsl:with-param name="size" select="14"/>
                            <xsl:with-param name="bold" select="true()"/>
                            <xsl:with-param name="text">
                                <xsl:text>Dosis</xsl:text>
                            </xsl:with-param>
                        </xsl:call-template>
                    </w:p>
                </w:tc>

                <w:tc>
                    <w:tcPr>
                        <w:tcW w:w="992" w:type="dxa"/>
                    </w:tcPr>
                    <w:p w:rsidR="00877D06" w:rsidRPr="00166F0D" w:rsidRDefault="00877D06" w:rsidP="00787D01">
                        <w:pPr>
                            <w:jc w:val="center"/>
                        </w:pPr>
                        <xsl:call-template name="text-run">
                            <xsl:with-param name="size" select="14"/>
                            <xsl:with-param name="bold" select="true()"/>
                            <xsl:with-param name="text">
                                <xsl:text>07:00</xsl:text>
                            </xsl:with-param>
                        </xsl:call-template>
                    </w:p>
                </w:tc>

                <w:tc>
                    <w:tcPr>
                        <w:tcW w:w="992" w:type="dxa"/>
                    </w:tcPr>
                    <w:p w:rsidR="00877D06" w:rsidRPr="00166F0D" w:rsidRDefault="00877D06" w:rsidP="00787D01">
                        <w:pPr>
                            <w:jc w:val="center"/>
                        </w:pPr>
                        <xsl:call-template name="text-run">
                            <xsl:with-param name="size" select="14"/>
                            <xsl:with-param name="bold" select="true()"/>
                            <xsl:with-param name="text">
                                <xsl:text>13:00</xsl:text>
                            </xsl:with-param>
                        </xsl:call-template>
                    </w:p>
                </w:tc>

                <w:tc>
                    <w:tcPr>
                        <w:tcW w:w="992" w:type="dxa"/>
                    </w:tcPr>
                    <w:p w:rsidR="00877D06" w:rsidRPr="00166F0D" w:rsidRDefault="00877D06" w:rsidP="00787D01">
                        <w:pPr>
                            <w:jc w:val="center"/>
                        </w:pPr>
                        <xsl:call-template name="text-run">
                            <xsl:with-param name="size" select="14"/>
                            <xsl:with-param name="bold" select="true()"/>
                            <xsl:with-param name="text">
                                <xsl:text>19:00</xsl:text>
                            </xsl:with-param>
                        </xsl:call-template>
                    </w:p>
                </w:tc>

                <w:tc>
                    <w:tcPr>
                        <w:tcW w:w="1134" w:type="dxa"/>
                    </w:tcPr>
                    <w:p w:rsidR="00877D06" w:rsidRPr="00166F0D" w:rsidRDefault="00877D06" w:rsidP="00787D01">
                        <w:pPr>
                            <w:jc w:val="center"/>
                        </w:pPr>
                        <xsl:call-template name="text-run">
                            <xsl:with-param name="size" select="14"/>
                            <xsl:with-param name="bold" select="true()"/>
                            <xsl:with-param name="text">
                                <xsl:text>Zur Nacht</xsl:text>
                            </xsl:with-param>
                        </xsl:call-template>
                    </w:p>
                </w:tc>
            </w:tr>

            <xsl:for-each select="$data//patient/medication[@when='current' and @which='other']/entry">
                <w:tr>
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="3686" w:type="dxa"/>
                        </w:tcPr>
                        <w:p>
                            <w:pPr>
                                <w:jc w:val="both"/>
                            </w:pPr>
                            <xsl:call-template name="text-run">
                                <xsl:with-param name="text">
                                    <xsl:value-of select="name" />
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>
                    </w:tc>

                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="1276" w:type="dxa"/>
                        </w:tcPr>
                        <w:p>
                            <w:pPr>
                                <w:jc w:val="both"/>
                            </w:pPr>
                            <xsl:call-template name="text-run">
                                <xsl:with-param name="text">
                                    <xsl:value-of select="dosis" /> <xsl:value-of select="unit"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>
                    </w:tc>

                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="992" w:type="dxa"/>
                        </w:tcPr>
                        <w:p>
                            <w:pPr>
                                <w:jc w:val="center"/>
                            </w:pPr>
                            <xsl:call-template name="text-run">
                                <xsl:with-param name="text">
                                    <xsl:value-of select="morning" />
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>
                    </w:tc>

                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="992" w:type="dxa"/>
                        </w:tcPr>
                        <w:p>
                            <w:pPr>
                                <w:jc w:val="center"/>
                            </w:pPr>
                            <xsl:call-template name="text-run">
                                <xsl:with-param name="text">
                                    <xsl:value-of select="noon" />
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>
                    </w:tc>

                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="992" w:type="dxa"/>
                        </w:tcPr>
                        <w:p>
                            <w:pPr>
                                <w:jc w:val="center"/>
                            </w:pPr>
                            <xsl:call-template name="text-run">
                                <xsl:with-param name="text">
                                    <xsl:value-of select="evening" />
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>
                    </w:tc>

                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="1134" w:type="dxa"/>
                        </w:tcPr>
                        <w:p>
                            <w:pPr>
                                <w:jc w:val="center"/>
                            </w:pPr>
                            <xsl:call-template name="text-run">
                                <xsl:with-param name="text">
                                    <xsl:value-of select="night" />
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>
                    </w:tc>
                </w:tr>
            </xsl:for-each>

            <w:tr>
                <w:tc>
                    <w:tcPr>
                        <w:tcW w:w="3686" w:type="dxa"/>
                    </w:tcPr>
                    <w:p>
                        <w:pPr>
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
                    <w:p>
                        <w:pPr>
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
                    <w:p>
                        <w:pPr>
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
                    <w:p>
                        <w:pPr>
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
                    <w:p>
                        <w:pPr>
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
                    <w:p>
                        <w:pPr>
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
        </w:tbl>
    </xsl:template>
</xsl:stylesheet>
