<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" version="1.0" encoding="ISO-8859-1" omit-xml-declaration="yes" standalone="yes" indent="no"/>
<xsl:strip-space elements="*"/>
<xsl:template match="/">
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="rss">
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="item">

  <!--<span id="open"><img class="jiraTicketIcon" src="{./type/@iconUrl}" style="visibility:visible;"/></span>-->
<h1 class="jiraTitle">

  <xsl:value-of select="summary" disable-output-escaping="yes" />
  <!--<xsl:value-of select="xsl:substring-after(./title,']')" disable-output-escaping="yes" />-->

</h1>
<xsl:value-of select="description" disable-output-escaping="yes" />

<xsl:apply-templates/>
</xsl:template>

<xsl:template match="description">
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="attachments">
<xsl:if test="./attachment">
<h3>Anhänge</h3>
<div class="attachments">
<ul>
<xsl:apply-templates/>
</ul>
</div>
    </xsl:if>
</xsl:template>

<xsl:template match="attachment">
  <xsl:variable name="filename" select="./@name"/>
  <xsl:choose>
    <xsl:when test="contains($filename, '.png')">
      <a href="{/rss/channel/link}/secure/attachment/{./@id}/{./@name}" alt="{./@name}" target="_blank"><img class="thumbnail" src="{/rss/channel/link}/secure/attachment/{./@id}/{./@name}" alt="{./@name}"/><br/></a>
    </xsl:when>
    <xsl:otherwise>
      <li><a class="attachment" href="{/rss/channel/link}/secure/attachment/{./@id}/{./@name}" alt="{./@name}" target="_blank"><xsl:value-of select="./@name" disable-output-escaping="yes" /></a></li>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="comments">

<h3>Kommentare</h3>
<div class="comments">
<xsl:apply-templates/>
</div>
</xsl:template>

<xsl:template match="comment">

<div class="comment">
  <span class="panelHeader"><xsl:value-of select="@author" />, </span>
  <span class="creationDateTime"><xsl:value-of select="./@created" /></span>
  <hr/><br/>
  <xsl:value-of select="." disable-output-escaping="yes" />
</div>

<xsl:apply-templates/>
</xsl:template>

<xsl:template match="text()"></xsl:template>
</xsl:stylesheet>
