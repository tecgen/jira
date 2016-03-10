<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="text" version="1.0" encoding="UTF-8" omit-xml-declaration="yes" standalone="yes" indent="no"/>
<xsl:strip-space elements="*"/>
<!-- HTML Table to CSV transformation -->
<xsl:template match="/">
<xsl:apply-templates/></xsl:template>
<xsl:template match="table">
<xsl:apply-templates/>
</xsl:template>
<xsl:template match="tr">
<xsl:text>
</xsl:text><xsl:apply-templates/></xsl:template>

<xsl:template match="th">"<xsl:value-of select="."/>"<xsl:if test="following-sibling::th">,</xsl:if></xsl:template>

<xsl:template match="td">"<xsl:value-of select="."/>"<xsl:if test="following-sibling::td">,</xsl:if></xsl:template>

<xsl:template match="text()"></xsl:template>
</xsl:stylesheet>
