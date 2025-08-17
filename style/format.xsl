<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">

    <!-- Basic paragraph style defintions !-->

    <xsl:template name="pPr">
	<xsl:param name="jc" select="'both'" required="no"/>
	<xsl:param name="size" select="18" required="no"/>

	<w:pPr>
	    <w:jc w:val="{$jc}"/>
	    <w:rPr>
		<w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
			  w:cs="Lucida Sans Unicode"/>
		<w:sz w:val="{$size}"/>
		<w:szCs w:val="{$size}"/>
	    </w:rPr>
	</w:pPr>
    </xsl:template>

    <!-- Helper to generate a docx "run" element !-->

    <xsl:template name="text-run">
        <xsl:param name="text"/>
        <xsl:param name="size" select="18" required="no" />
        <xsl:param name="highlight" select="false()" required="no"/>
        <xsl:param name="bold" select="false()" required="no"/>

        <w:r>
            <w:rPr>
                <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
                <xsl:if test="$bold"><w:b/><w:bCs/></xsl:if>
                <w:sz w:val="{$size}"/>
                <w:szCs w:val="{$size}"/>
                <xsl:if test="$highlight"><w:highlight w:val="yellow"/></xsl:if>
            </w:rPr>
            <w:t xml:space="preserve"><xsl:value-of select="$text"/></w:t>
        </w:r>
    </xsl:template>

    <!-- Word field insertion !-->

    <xsl:template name="insert-field">
	<xsl:param name="bold" select="false()" required="no"/>

	<w:r>
	    <w:rPr>
		<w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
		<xsl:if test="$bold"><w:b/><w:bCs/></xsl:if>
		<w:sz w:val="18"/>
		<w:szCs w:val="18"/>
	    </w:rPr>
	    <w:fldChar w:fldCharType="begin"/>
	</w:r>

	<w:r>
	    <w:rPr>
		<w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
		<xsl:if test="$bold"><w:b/><w:bCs/></xsl:if>
		<w:sz w:val="18"/>
		<w:szCs w:val="18"/>
	    </w:rPr>
	    <w:instrText xml:space="preserve"> </w:instrText>
	</w:r>

	<w:r>
	    <w:rPr>
		<w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
		<xsl:if test="$bold"><w:b/><w:bCs/></xsl:if>
		<w:sz w:val="18"/>
		<w:szCs w:val="18"/>
	    </w:rPr>
	    <w:fldChar w:fldCharType="separate"/>
	</w:r>

	<w:r>
	    <w:rPr>
		<w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode" w:cs="Lucida Sans Unicode"/>
		<xsl:if test="$bold"><w:b/><w:bCs/></xsl:if>
		<w:sz w:val="18"/>
		<w:szCs w:val="18"/>
	    </w:rPr>
	    <w:fldChar w:fldCharType="end"/>
	</w:r>
    </xsl:template>

</xsl:stylesheet>
