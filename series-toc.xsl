<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <title>
          NHK World Archive
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
          .date {
            white-space: nowrap;
          }
        </style>
      </head>
      <body>
        <h1>NHK World Archive</h1>
        <p>Updated at 
          <xsl:value-of select="translate(seriesList/lastUpdated, 'TZ', ' ')"/> UTC
        </p>
        <p>
          <a href="index.json">JSON version</a> │ 
          <a href="http://nhkwdt2ljw4zwc2jgdwymfo4yquw2edzodlinwkoi34t5bhrduvrjgid.onion/">Tor Hidden Service</a> │
          <a href="mailto:contact@archivist.observer">contact@archivist.observer</a> (<a href="gpg.txt">GPG Key</a>)
        </p>
        <table>
          <tr>
            <th>Title</th>
            <th>Last Airing (UTC)</th>
            <th>Last Upload (UTC)</th>
            <th>Episode Count</th>
          </tr>
          <xsl:for-each select="seriesList/series">
            <tr>
              <td class="title">
                <a>
                  <xsl:attribute name="href">
                    <xsl:value-of select="uniqueId"/>
                    <xsl:text>.xml</xsl:text>
                  </xsl:attribute>
                  <xsl:value-of select="title"/>
                </a>
              </td>
              <td class="date">
                <xsl:value-of select="translate(lastAiring, 'TZ', ' ')"/>
              </td>
              <td class="date">
                <xsl:value-of select="translate(lastUpload, 'TZ', ' ')"/>
              </td>
              <td>
                <xsl:value-of select="count"/>
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
      </html>
  </xsl:template>
</xsl:stylesheet>
