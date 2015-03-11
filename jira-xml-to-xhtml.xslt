<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" version="1.0" encoding="ISO-8859-1" omit-xml-declaration="yes" standalone="yes" indent="no"/>

<xsl:template match="/">
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="rss">
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="item">
<xsl:apply-templates/>
<html>
<title>
  <xsl:value-of select="title" disable-output-escaping="yes" />
</title>
<body>
<h1><xsl:value-of select="title" disable-output-escaping="yes" /></h1>
<hr />
<xsl:value-of select="description" disable-output-escaping="yes" />
</body>
</html>
</xsl:template>

<xsl:template match="description">
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="text()"></xsl:template>
</xsl:stylesheet>