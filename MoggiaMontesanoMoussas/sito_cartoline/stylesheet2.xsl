<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs">
    
    <xsl:output method="html" />
    <xsl:template match="/"> 
        <html>
            <head>
                <title>
                    <xsl:value-of select="//tei:titleStmt/tei:title"/>
                </title>
              
                <style>
                    body {
                    background-image: url('images/carta-antica.jpg');
                    margin: 0px;
                    font-family: 'Acephimere';
                    font-size: 15px;
                    }
                    
                    h1{
                    font-family: 'Champagne &amp; Limousines';
                    
                    }
                    h3{
                    font-size: 15px;
                    margin-top: 5px;
                    }
                    p{
                    margin-left: 10px;
                    }
                    
                    #retroImg {
                    margin-top: 20px;
                    }
                    
                    .menu {
                    overflow: hidden;
                    background-color: black;
                    position: fixed; 
                    top: 0; 
                    width: 100%;
                    font-family: 'Champagne &amp; Limousines';
                    font-size: 20px;
                    }
                    
                    .menu a {
                    float: left;
                    display: block;
                    color: white;
                    text-align: center;
                    padding: 14px 16px;
                    text-decoration: none;
                    }
                    
                    .menu a:hover {
                    background-color: white;
                    color: black;
                    }
                    
                    #content-fronte {
                    column-count: 2;
                    }
                    
                    #content-retro {
                    column-count: 2;
                    
                    }
                    
                    #footer {
                    position: relative;
                    bottom: 0px;
                    padding-top: 10px;
                    width: 100%;
                    padding-left: 14px;
                    background-color: black;
                    color: white;
                    column-count: 2;
                    font-family: 'Acephimere';
                    }
                    #immagini{
                    margin-left: 300px;
                    margin-right: 300px;
                    }
                    .chiara, .rebecca, .eleni{
                    float: left;
                    padding: 10px 6%;
                    }
                    
                    .chiara1, .rebecca1, .eleni1 {
                    width: 80px;
                    
                    
                    }
                    
                    #tChiara, #tRebecca, #tEleni {
                    color: white;
                    text-align: center;
                    font-family: 'reey';
                    }
                    
              
                    
                    
                </style>
            </head>
            <body>
                <div id="menu" class="menu">
                    <a href="home.html">Home</a>
                    <a href="cartolina1.html">Cartolina 1</a>
                    <a href="cartolina2.html">Cartolina 2</a>
                    <a href="cartolina3.html">Cartolina 3</a>
                </div>
                <div id="intestazione">
                    <h1 style="margin-top: 50px; text-align: center"><xsl:value-of select="//tei:titleStmt/tei:title"/></h1>
                  
                </div>
                <div id="content-fronte" style="margin-left: 10px">
             
                    <img><xsl:attribute name="src"><xsl:value-of select="//tei:figure/tei:graphic/@url"/></xsl:attribute></img> 
                    <xsl:for-each select="//tei:surface[@n='1']//tei:zone"> 
                        
                        <div class="codice-elemento">
                            <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
                            <xsl:attribute name="style"> <xsl:value-of select="@ulx"/> <xsl:value-of select="@uly"/> <xsl:value-of select="(@lry)-(@uly)"/> <xsl:value-of select="((@lrx)-(@ulx))"/> </xsl:attribute> <!-- Determino la distanza dei punti ma non la richiedo-->
                        </div>
                    </xsl:for-each>
                    
                 <p><xsl:value-of select="//tei:figDesc"/></p>
                     
                  <p class="testo">
                      <p class="testo"><xsl:attribute name="id"> <strong>Autore: </strong><xsl:value-of select="//tei:bibl//tei:author/@ref"/></xsl:attribute><xsl:value-of select="//tei:bibl//tei:author"/></p>
                  </p>
              
                </div>
            
                <div id="content-retro" style="margin-top: 10px; margin-bottom: 10px; margin-left: 10px; line-height: 40%">
                
                        <img><xsl:attribute name="src"><xsl:value-of select="//tei:surface[@n='2']//tei:graphic/@url"/></xsl:attribute></img>
                        <xsl:for-each select="//tei:surface[@n='2']//tei:zone">
                            <div class="line">
                                <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
                                <xsl:attribute name="style"> <xsl:value-of select="@ulx"/> <xsl:value-of select="@uly"/> <xsl:value-of select="(@lry)-(@uly)"/> <xsl:value-of select="((@lrx)-(@ulx))"/> </xsl:attribute>
                            </div>
                        </xsl:for-each>
              
                       
                            <h3 id="messaggio" style="margin-top: 5px">Messaggio</h3>
                            <xsl:for-each select="(//tei:div[@type='message']/tei:p)">
                                <p class="testo">
                                    <xsl:attribute name="id"><xsl:value-of select="@facs"/></xsl:attribute>
                                    <xsl:apply-templates/>
                                </p>
                            </xsl:for-each>
                            <p class="testo"><xsl:attribute name="id"><xsl:value-of select="//tei:signed/@facs"/></xsl:attribute><xsl:value-of select="//tei:signed"/>
                            </p>
                    
                            <h3>Destinazione:</h3>
                            <xsl:for-each select="(//tei:div[@type='destination']//tei:addrLine)">
                                <p class="testo">
                                    <xsl:attribute name="id"><xsl:value-of select="@facs"/></xsl:attribute>
                                    <xsl:apply-templates/>
                                </p>
                            </xsl:for-each>
                    
                            <h3>Timbro e francobollo:</h3> <!--POSTAGE POSTMARK-->
                            <p class="testo">
                                <xsl:attribute name="id"><xsl:value-of select="//tei:div[@type='destination']//tei:stamp[@type='postmark']/@facs"/></xsl:attribute>
                        
                                <xsl:value-of select="//tei:div[@type='destination']//tei:stamp[@type='postage']/@facs"/><!--A cosa serve il facs?--> <!--Forse vanno tole le parentesi quadre-->
                                
                                <xsl:for-each select="(//tei:div[@type='destination']//tei:stamp)">
                                    <xsl:apply-templates/>
                                </xsl:for-each>
                            </p>
                    
                            <h3>Caratteri non manoscritti:</h3>
                            <xsl:for-each select="//tei:div[@type='printed']//tei:p">
                                <p class="testo">
                                    <xsl:attribute name="id"><xsl:value-of select="@facs"/></xsl:attribute>
                                    <xsl:apply-templates/>
                                </p>
                            </xsl:for-each>
                   
                    </div>
               
            </body>
            <footer id="footer">
                <p id="foot">
                    <h4>Informazioni sull'edizione</h4>
                    Trascrizione realizzata da: <xsl:value-of select="//tei:titleStmt/tei:respStmt/tei:name[@xml:id='RM']"/>, <xsl:value-of select="//tei:titleStmt/tei:respStmt/tei:name[@xml:id='CM']"/> e <xsl:value-of select="//tei:titleStmt/tei:respStmt/tei:name[@xml:id='EM']"/><br></br>
                        Ente di appartenenza: <i>Comune di La Spezia</i><br></br>
                    Compilatore: <xsl:value-of select="//tei:editionStmt/tei:respStmt/tei:name[@xml:id='TC']"/><br></br>
                    Responsabile scientifico: <xsl:value-of select="//tei:editionStmt/tei:respStmt/tei:name[@xml:id='GP']"/> e <xsl:value-of select="//tei:editionStmt/tei:respStmt/tei:name[@xml:id='ES']"/><br></br>
                    Funzionario responsabile: <xsl:value-of select="//tei:editionStmt/tei:respStmt/tei:name[@xml:id='MR']"/>
                                    <h4>Informazioni sulla pubblicazione:</h4>
                                        Publisher: <i>Unipi, Pisa</i><br></br>
                                        Copyright: <i>Laboratorio di Cultura Digitale – Università di Pisa</i>
                                        <h4>Crediti:</h4>
                                        Progetto realizzato per il corso di Codifica di Testi, a.a. 2018/2019				
                </p>
                <span id="immagini">
                    <div class="chiara">                
                        <a href="mailto:c.montesano1@studenti.unipi.it"><img class="chiara1" src="images/chiara.png"> </img>
                            <p id="tChiara">Chiara</p></a>
                    </div>
                    <div class="rebecca">
                        <a href="mailto:r.moggia@studenti.unipi.it"><img class="rebecca1" src="images/rebecca.png"> </img>
                            <p id="tRebecca">Rebecca</p></a>
                    </div>
                    <div class="eleni">					  
                        <a href="mailto:e.moussas@studenti.unipi.it"><img class="eleni1" src="images/eleni.png"> </img>
                            <p id="tEleni">Eleni</p></a>
                        
                    </div>
                </span>
            </footer>	
        </html>
    </xsl:template>
</xsl:stylesheet>