<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <title>
          NHK World Archive - 
          <xsl:value-of select="episodeList/title"/>
        </title>
        <style type="text/css">
          table, th, td {
            border: 1px solid black;
            border-collapse: collapse; padding: 4px;
            text-align: center;
          }
          .title {
            text-align: left;
          }
          .subtitle {
            text-align: left;
          }
          .date {
            white-space: nowrap;
          }
          .description {
            text-align: left;
          }
        </style>
      </head>
      <body>
        <h1>
          <xsl:value-of select="episodeList/title"/>
        </h1>
        <p>Updated at 
          <xsl:value-of select="translate(episodeList/lastUpdated, 'TZ', ' ')"/> UTC
        </p>
        <p>
          <a>
            <xsl:attribute name="href">
              <xsl:value-of select="episodeList/seriesId"/>
              <xsl:text>.json</xsl:text>
            </xsl:attribute>
            <xsl:text>JSON version</xsl:text>
          </a>
        </p>
        <table>
          <tr>
            <th>Title</th>
            <th>Subtitle</th>
            <th>Raw</th>
            <th>Air Time (UTC)</th>
            <th>Series ID</th>
            <th>Airing ID</th>
            <th>Description</th>
          </tr>
          <xsl:for-each select="episodeList/episode">
            <tr>
              <td class="title">
                <a>
                  <xsl:attribute name="href">
                    <xsl:value-of select="link"/>
                  </xsl:attribute>
                  <xsl:value-of select="title"/>
                </a>
              </td>
              <td class="subtitle">
                <a>
                  <xsl:attribute name="href">
                    <xsl:value-of select="link"/>
                  </xsl:attribute>
                  <xsl:value-of select="subtitle"/>
                </a>
              </td>
              <td class="raw">
                <xsl:if test="raw">
                  <a>
                    <xsl:attribute name="href">
                      <xsl:value-of select="raw"/>
                    </xsl:attribute>
                    Raw
                  </a>
                </xsl:if>
              </td>
              <td class="date">
                <xsl:value-of select="translate(startDate, 'TZ', ' ')"/>
              </td>
              <td>
                <xsl:value-of select="seriesId"/>
              </td>
              <td>
                <xsl:value-of select="airingId"/>
              </td>
              <td class="description">
                <xsl:value-of select="description"/>
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
      </html>
  </xsl:template>
</xsl:stylesheet>
