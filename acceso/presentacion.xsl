<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Correccion</title>
                <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
                <style>
                html{
                    margin-left: 15px;
                    margin-right: 15px;
                }
                </style>
            </head>
            <body>
                <h1 align="center">EXAMEN CORREGIDO</h1>
                <table class="table table-bordered">
                    <tr>
                        <td>Tipo<xsl:value-of select="type"/>
                        </td>
                        <td>Respuesta Correcta<xsl:value-of select="answer"/>
                        </td>
                        <td>Respuesta Usuario<xsl:value-of select="respuesta"/>
                        </td>
                        <td>Puntuacion<xsl:value-of select="puntos"/>
                        </td>
                    </tr>
                    <xsl:for-each select="questions/question">
                        <tr>
                            <td>
                                <xsl:value-of select="type"/>
                            </td>
                            <td>
                                <xsl:value-of select="answer"/>
                            </td>
                            <td>
                                <xsl:value-of select="respuesta"/>
                            </td>
                            <td>
                                <xsl:value-of select="puntos"/>
                                <xsl:if test="cartel/@imagen ='si'">
                                    <img style="max-width:15%" src="{cartel}" alt=""/>
                                </xsl:if>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <p align="center">NOTA DEL EXAMEN: <xsl:value-of select="sum(//puntos)"/>
                </p>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>