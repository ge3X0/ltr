<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">

    <xsl:template match="//w:p[.//pheno_cluster]">
	<xsl:if test="$diag_cluster">
	    <w:tbl>
		<w:tblPr>
		    <w:tblW w:w="0" w:type="auto"/>
		    <w:tblInd w:w="2" w:type="dxa"/>
		    <w:tblLook w:val="00A0" w:firstRow="1" w:lastRow="0" w:firstColumn="1" w:lastColumn="0" w:noHBand="0" w:noVBand="0"/>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
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
				<w:t xml:space="preserve">Schmerztyp </w:t>
			    </w:r>

			    <xsl:call-template name="insert-field">
				<xsl:with-param name="bold" select="true()"/>
			    </xsl:call-template>

			    <w:r>
				<w:rPr>
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
				<w:t>:</w:t>
			    </w:r>

			    <w:r>
				<w:rPr>
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
				<w:br/>
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
				<w:t>Clusterkopfschmerz</w:t>
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
				<w:t xml:space="preserve">Erste Episode </w:t>
			    </w:r>

			    <xsl:call-template name="insert-field"/>

			    <w:r>
				<w:rPr>
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
				<w:t xml:space="preserve">, aktuelle Episode seit </w:t>
			    </w:r>

			    <xsl:call-template name="insert-field"/>

			    <w:r>
				<w:rPr>
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
				<w:t xml:space="preserve"> mit aktuell bis zu </w:t>
			    </w:r>

			    <xsl:call-template name="insert-field"/>

			    <w:r>
				<w:rPr>
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
				<w:t xml:space="preserve"> Attacken täglich mit einer Dauer von bis zu 30 Minuten </w:t>
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
				<w:t xml:space="preserve">Strikt </w:t>
			    </w:r>

			    <xsl:call-template name="insert-field"/>

			    <w:r>
				<w:rPr>
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
				<w:t xml:space="preserve">periorbital</w:t>
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
				<w:t>Keine auslösenden Faktoren der Attacken</w:t>
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
				<w:t xml:space="preserve">Während der Attacke starke körperliche Unruhe, ipsilaterale trigeminoautonome Symptomatik mit konjunktivaler Injektion,Lakrimation, Rhinorhoe, Ptosis</w:t>
			    </w:r>

			    <xsl:call-template name="insert-field"/>
			</w:p>
		    </w:tc>
		</w:tr>
	    </w:tbl>
	</xsl:if>
    </xsl:template>

    <xsl:template match="//w:p[.//pheno_migraine]">
	<xsl:if test="$diag_migraine_without_aura or $diag_miagraine_with_aura">
	    <w:tbl>
		<w:tblPr>
		    <w:tblW w:w="0" w:type="auto"/>
		    <w:tblInd w:w="2" w:type="dxa"/>
		    <w:tblLook w:val="00A0" w:firstRow="1" w:lastRow="0" w:firstColumn="1" w:lastColumn="0" w:noHBand="0" w:noVBand="0"/>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="bold" select="true()"/>
				<xsl:with-param name="text">
				    <xsl:text>Schmerztyp </xsl:text>
				</xsl:with-param>
			    </xsl:call-template>

			    <xsl:call-template name="insert-field">
				<xsl:with-param name="bold" select="true()"/>
			    </xsl:call-template>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="bold" select="true()"/>
				<xsl:with-param name="text">
				    <xsl:text>:</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>

			    <w:r>
				<w:rPr>
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
				<w:br/>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>Chronische Migräne</xsl:text>
				    <xsl:call-template name="with_and"/>
				    <xsl:text> ohne Aura</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>Beginn </xsl:text>
				</xsl:with-param>
			    </xsl:call-template>

			    <xsl:call-template name="insert-field"/>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>, seitdem kontinuierliche Zunahme der Frequenz und Intensität auf aktuell bis zu </xsl:text>
				</xsl:with-param>
			    </xsl:call-template>

			    <xsl:call-template name="insert-field"/>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text> Tagen monatlich. Dauer der Attacken bis zu </xsl:text>
				</xsl:with-param>
			    </xsl:call-template>

			    <xsl:call-template name="insert-field"/>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text> Tagen am Stück.</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>Schmerzlokalisation:</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>Unilateral links betont, parietal, frontal, occipital</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>

			    <xsl:call-template name="insert-field"/>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>Intensität:</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>Stark bis sehr stark</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>Schmerzcharakter:</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>Drückend, pulsierend, pochend</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>Modulation:</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>Körperliche Routineaktivität führt zu einer Schmerzverstärkung und wird gemieden</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>Begleitsymptome:</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>Photophobie, Phonophobie, Übelkeit, Erbrechen, Schwindel, Müdigkeit, Konzentrationsstörungen</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>

			    <xsl:call-template name="insert-field"/>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>Aura:</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:choose>
					<xsl:when test="$diag_migraine_with_aura">
					    <xsl:text>Vorübergehende einseitige Sehstörungen in Form von Fortifikationsphänomenen</xsl:text>
					</xsl:when>
					<xsl:otherwise>
					    <xsl:text>Keine</xsl:text>
					</xsl:otherwise>
				    </xsl:choose>
				</xsl:with-param>
			    </xsl:call-template>
			</w:p>
		    </w:tc>
		</w:tr>
	    </w:tbl>
	</xsl:if>
    </xsl:template>

    <xsl:template match="//w:p[.//pheno_spaks]">
	<xsl:if test="$diag_spaks">

	    <w:tbl>
		<w:tblPr>
		    <w:tblW w:w="0" w:type="auto"/>
		    <w:tblInd w:w="2" w:type="dxa"/>
		    <w:tblLook w:val="00A0" w:firstRow="1" w:lastRow="0" w:firstColumn="1" w:lastColumn="0" w:noHBand="0" w:noVBand="0"/>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="bold" select="true()"/>
				<xsl:with-param name="text">
				    <xsl:text>Schmerztyp </xsl:text>
				</xsl:with-param>
			    </xsl:call-template>

			    <xsl:call-template name="insert-field">
				<xsl:with-param name="bold" select="true()"/>
			    </xsl:call-template>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="bold" select="true()"/>
				<xsl:with-param name="text">
				    <xsl:text>:</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>

			    <w:r>
				<w:rPr>
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
				<w:br/>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>Kopfschmerz vom Spannungstyp</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>Beginn mit episodischem Kopfschmerzattacken </xsl:text>
				</xsl:with-param>
			    </xsl:call-template>

			    <xsl:call-template name="insert-field"/>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>. Kontinuierliche Zunahme der Häufigkeit. Inzwischen als täglicher Dauerschmerz auftretend.</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>Schmerzlokalisation:</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>Holokranial, Gefühl eines engen Helmes</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>Intensität:</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>Leicht bis mittelstark</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>Schmerzcharakter:</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>Dumpf, drückend</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>Modulation:</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>Keine Verstärkung durch körperliche Routineaktivität wie Gehen oder Treppensteigen</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>Begleitsymptome:</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>Reizbarkeit</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>

			    <xsl:call-template name="insert-field"/>
			</w:p>
		    </w:tc>
		</w:tr>
	    </w:tbl>
	</xsl:if>
    </xsl:template>

    <xsl:template match="//w:p[.//pheno_backpain]">
	<w:tbl>
	    <w:tblPr>
		<w:tblW w:w="0" w:type="auto"/>
		<w:tblInd w:w="2" w:type="dxa"/>
		<w:tblLook w:val="00A0" w:firstRow="1" w:lastRow="0" w:firstColumn="1" w:lastColumn="0" w:noHBand="0" w:noVBand="0"/>
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
				<w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				<w:sz w:val="18"/>
				<w:szCs w:val="18"/>
			    </w:rPr>
			</w:pPr>

			<xsl:call-template name="text-run">
			    <xsl:with-param name="bold" select="true()"/>
			    <xsl:with-param name="text">
				<xsl:text>Schmerztyp </xsl:text>
			    </xsl:with-param>
			</xsl:call-template>

			<xsl:call-template name="insert-field">
			    <xsl:with-param name="bold" select="true()"/>
			</xsl:call-template>

			<xsl:call-template name="text-run">
			    <xsl:with-param name="bold" select="true()"/>
			    <xsl:with-param name="text">
				<xsl:text>:</xsl:text>
			    </xsl:with-param>
			</xsl:call-template>

			<w:r>
			    <w:rPr>
				<w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				<w:sz w:val="18"/>
				<w:szCs w:val="18"/>
			    </w:rPr>
			    <w:br/>
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
				<w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				<w:sz w:val="18"/>
				<w:szCs w:val="18"/>
			    </w:rPr>
			</w:pPr>

			<xsl:call-template name="text-run">
			    <xsl:with-param name="text">
				<xsl:text>Chronische Rückenschmerzen</xsl:text>
			    </xsl:with-param>
			</xsl:call-template>

			<xsl:call-template name="insert-field"/>
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
				<w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				<w:sz w:val="18"/>
				<w:szCs w:val="18"/>
			    </w:rPr>
			</w:pPr>

			<xsl:call-template name="text-run">
			    <xsl:with-param name="text">
				<xsl:text>Derzeitige Ausprägung seit </xsl:text>
			    </xsl:with-param>
			</xsl:call-template>

			<xsl:call-template name="insert-field"/>

			<xsl:call-template name="text-run">
			    <xsl:with-param name="text">
				<xsl:text> Monaten. Täglicher Dauerschmerz mit belastungsabhängiger Zunahme bei längerem Gehen, Sitzen oder Stehen</xsl:text>
			    </xsl:with-param>
			</xsl:call-template>
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
				<w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				<w:sz w:val="18"/>
				<w:szCs w:val="18"/>
			    </w:rPr>
			</w:pPr>

			<xsl:call-template name="text-run">
			    <xsl:with-param name="text">
				<xsl:text>Schmerzlokalisation:</xsl:text>
			    </xsl:with-param>
			</xsl:call-template>
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
				<w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				<w:sz w:val="18"/>
				<w:szCs w:val="18"/>
			    </w:rPr>
			</w:pPr>

			<xsl:call-template name="text-run">
			    <xsl:with-param name="text">
				<xsl:text>Untere LWS mit Ausstrahlung entlang der Außenseite des </xsl:text>
			    </xsl:with-param>
			</xsl:call-template>

			<xsl:call-template name="insert-field"/>

			<xsl:call-template name="text-run">
			    <xsl:with-param name="text">
				<xsl:text> Beines bis zur Kleinzehe</xsl:text>
			    </xsl:with-param>
			</xsl:call-template>
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
				<w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				<w:sz w:val="18"/>
				<w:szCs w:val="18"/>
			    </w:rPr>
			</w:pPr>

			<xsl:call-template name="text-run">
			    <xsl:with-param name="text">
				<xsl:text>Intensität:</xsl:text>
			    </xsl:with-param>
			</xsl:call-template>
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
				<w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				<w:sz w:val="18"/>
				<w:szCs w:val="18"/>
			    </w:rPr>
			</w:pPr>

			<xsl:call-template name="text-run">
			    <xsl:with-param name="text">
				<xsl:text>In Ruhe leicht, bei Belastung stark</xsl:text>
			    </xsl:with-param>
			</xsl:call-template>
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
				<w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				<w:sz w:val="18"/>
				<w:szCs w:val="18"/>
			    </w:rPr>
			</w:pPr>

			<xsl:call-template name="text-run">
			    <xsl:with-param name="text">
				<xsl:text>Schmerzcharakter:</xsl:text>
			    </xsl:with-param>
			</xsl:call-template>
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
				<w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				<w:sz w:val="18"/>
				<w:szCs w:val="18"/>
			    </w:rPr>
			</w:pPr>

			<xsl:call-template name="text-run">
			    <xsl:with-param name="text">
				<xsl:text>Dumpf, brennend</xsl:text>
			    </xsl:with-param>
			</xsl:call-template>
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
				<w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				<w:sz w:val="18"/>
				<w:szCs w:val="18"/>
			    </w:rPr>
			</w:pPr>

			<xsl:call-template name="text-run">
			    <xsl:with-param name="text">
				<xsl:text>Modulation:</xsl:text>
			    </xsl:with-param>
			</xsl:call-template>
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
				<w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				<w:sz w:val="18"/>
				<w:szCs w:val="18"/>
			    </w:rPr>
			</w:pPr>

			<xsl:call-template name="text-run">
			    <xsl:with-param name="text">
				<xsl:text>Leichte Bewegung verbesser die Schmerzen, statische und Haltebewegungen verstärken den Schmerz</xsl:text>
			    </xsl:with-param>
			</xsl:call-template>
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
				<w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				<w:sz w:val="18"/>
				<w:szCs w:val="18"/>
			    </w:rPr>
			</w:pPr>

			<xsl:call-template name="text-run">
			    <xsl:with-param name="text">
				<xsl:text>Begleitsymptome:</xsl:text>
			    </xsl:with-param>
			</xsl:call-template>
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
				<w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				<w:sz w:val="18"/>
				<w:szCs w:val="18"/>
			    </w:rPr>
			</w:pPr>

			<xsl:call-template name="text-run">
			    <xsl:with-param name="text">
				<xsl:text>Keine, insbesondere keine Miktions- oder Defäkationsstörungen</xsl:text>
			    </xsl:with-param>
			</xsl:call-template>
		    </w:p>
		</w:tc>
	    </w:tr>
	</w:tbl>
    </xsl:template>

    <xsl:template match="//w:p[.//pheno_trigeminus]">
	<xsl:if test="$diag_trigeminus">
	    <w:tbl>
		<w:tblPr>
		    <w:tblW w:w="0" w:type="auto"/>
		    <w:tblInd w:w="2" w:type="dxa"/>
		    <w:tblLook w:val="00A0" w:firstRow="1" w:lastRow="0" w:firstColumn="1" w:lastColumn="0" w:noHBand="0" w:noVBand="0"/>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="bold" select="true()"/>
				<xsl:with-param name="text">
				    <xsl:text>Schmerztyp </xsl:text>
				</xsl:with-param>
			    </xsl:call-template>

			    <xsl:call-template name="insert-field">
				<xsl:with-param name="bold" select="true()"/>
			    </xsl:call-template>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="bold" select="true()"/>
				<xsl:with-param name="text">
				    <xsl:text>:</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>

			    <w:r>
				<w:rPr>
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
				<w:br/>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>Trigeminusneuralgie </xsl:text>
				</xsl:with-param>
			    </xsl:call-template>

			    <xsl:call-template name="insert-field"/>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>, VI, VII, VIII</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>Seit </xsl:text>
				</xsl:with-param>
			    </xsl:call-template>

			    <xsl:call-template name="insert-field"/>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text> bestehend, aktuell bis zu </xsl:text>
				</xsl:with-param>
			    </xsl:call-template>

			    <xsl:call-template name="insert-field"/>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text> Schmerzattacken täglich mit einer Dauer von bis zu </xsl:text>
				</xsl:with-param>
			    </xsl:call-template>

			    <xsl:call-template name="insert-field"/>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text> Minuten, anschließend Refraktärphase</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>Schmerzlokalisation:</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>Strikt </xsl:text>
				</xsl:with-param>
			    </xsl:call-template>

			    <xsl:call-template name="insert-field"/>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>, Versorgungsgebiet VI, VII, VIII</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>

			    <xsl:call-template name="insert-field"/>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>Intensität:</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>Sehr stark</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>Schmerzcharakter:</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>Stechend, brennend</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>Modulation:</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>Schmerz auslösbar durch Berührung, Sprechen, Trinken, Kauen, kalte Luft</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>

			    <xsl:call-template name="insert-field"/>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>Begleitsymptome:</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>
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
				    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
				    <w:sz w:val="18"/>
				    <w:szCs w:val="18"/>
				</w:rPr>
			    </w:pPr>

			    <xsl:call-template name="text-run">
				<xsl:with-param name="text">
				    <xsl:text>Trigeminoautonome Symptomatik mit ipsilateraler konjunktivaler Injektion, Lakrimation, Rhinorhoe, Ptosis</xsl:text>
				</xsl:with-param>
			    </xsl:call-template>
			</w:p>
		    </w:tc>
		</w:tr>
	    </w:tbl>
	</xsl:if>
    </xsl:template>
</xsl:stylesheet>
