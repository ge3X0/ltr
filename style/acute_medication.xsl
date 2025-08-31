<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">

    <!-- Allgemeine Variablen !-->

    <xsl:template match="akutmedikation_zuvor">
        <xsl:call-template name="string-list">
            <xsl:with-param name="selection" select="$data//medication[@when = 'former' and @which = 'acute']/entry/name"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="akutmedikation_aufnahme">
        <xsl:call-template name="string-list">
            <xsl:with-param name="selection" select="$data//medication[@when = 'current' and @which = 'acute']/entry/name"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="//w:p[.//akutmedikation]">
        <w:tbl>
            <w:tblPr>
                <w:tblW w:w="0" w:type="auto"/>
                <w:tblInd w:w="-106" w:type="dxa"/>
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
                <w:gridCol w:w="3691"/>
                <w:gridCol w:w="15"/>
                <w:gridCol w:w="5371"/>
                <w:gridCol w:w="20"/>
            </w:tblGrid>

            <w:tr>
                <w:tc>
                    <w:tcPr>
                        <w:tcW w:w="9097" w:type="dxa"/>
                        <w:gridSpan w:val="4"/>
                        <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                    </w:tcPr>

                    <w:p>
			<xsl:call-template name="pPr"/>

                        <xsl:call-template name="text-run">
                            <xsl:with-param name="bold" select="true()"/>
                            <xsl:with-param name="text">
                                <xsl:text>Schmerztherapeutische Akutmedikation</xsl:text>
                            </xsl:with-param>
                        </xsl:call-template>
                    </w:p>
                </w:tc>
            </w:tr>

            <w:tr>
                <w:tc>
                    <w:tcPr>
                        <w:tcW w:w="3706" w:type="dxa"/>
                        <w:gridSpan w:val="2"/>
                    </w:tcPr>

                    <w:p>
			<xsl:call-template name="pPr">
			    <xsl:with-param name="size" select="14"/>
			</xsl:call-template>

                        <xsl:call-template name="text-run">
                            <xsl:with-param name="bold" select="true()"/>
                            <xsl:with-param name="size" select="14"/>
                            <xsl:with-param name="text">
                                <xsl:text>Indikation</xsl:text>
                            </xsl:with-param>
                        </xsl:call-template>
                    </w:p>
                </w:tc>

                <w:tc>
                    <w:tcPr>
                        <w:tcW w:w="5391" w:type="dxa"/>
                        <w:gridSpan w:val="2"/>
                    </w:tcPr>

                    <w:p>
			<xsl:call-template name="pPr">
			    <xsl:with-param name="size" select="14"/>
			</xsl:call-template>

                        <xsl:call-template name="text-run">
                            <xsl:with-param name="bold" select="true()"/>
                            <xsl:with-param name="size" select="14"/>
                            <xsl:with-param name="text">
                                <xsl:text>Substanz/Medikament</xsl:text>
                            </xsl:with-param>
                        </xsl:call-template>
                    </w:p>
                </w:tc>
            </w:tr>

            <xsl:if test="$diag_overuse">
                <w:tr>
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="3706" w:type="dxa"/>
                            <w:gridSpan w:val="2"/>
                        </w:tcPr>

                        <w:p>
			    <xsl:call-template name="pPr"/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="text">
                                    <xsl:text>Migräneattacke</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>

                        <w:p>
			    <xsl:call-template name="pPr"/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="size" select="18"/>
                                <xsl:with-param name="text">
                                    <xsl:text>während der Schmerzmittelpause</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>

                        <w:p>
			    <xsl:call-template name="pPr"/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="size" select="18"/>
                                <xsl:with-param name="text">
                                    <xsl:text>(für weitere 2 Wochen empfohlen)</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>
                    </w:tc>

                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="5391" w:type="dxa"/>
                            <w:gridSpan w:val="2"/>
                        </w:tcPr>

                        <w:p>
			    <xsl:call-template name="pPr"/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="bold" select="true()"/>
                                <xsl:with-param name="text">
                                    <xsl:text>Dimenhydrinat (Vomex A®)</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="text">
                                    <xsl:text> Dragee 50 mg (maximal 3x täglich) oder Dimenhydrinat (Vomex A®) als Suppositorium 150 mg (Tageshöchstdosis 300 mg)</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>

                        <w:p>
			    <xsl:call-template name="pPr"/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="bold" select="true()"/>
                                <xsl:with-param name="text">
                                    <xsl:text>Melperon 10 mg </xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="text">
                                    <xsl:text>(bis zu 5x täglich) unter Beachtung des Nebenwirkungsspektrums, insbesondere Reaktionsvermögen. Melperon kann bei regelmäßiger Einnahme Dyskinesien verursachen, zudem schränken beide Medikamente die Fahrtauglichkeit ein.</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>

                        <w:p/>

                        <w:p>
			    <xsl:call-template name="pPr"/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="text">
                                    <xsl:text>Im Notfall, bei Eskalation der Rebound-Kopfschmerzen: </xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>

                        <w:p>
			    <xsl:call-template name="pPr"/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="text">
                                    <xsl:text>16 mg Dexamethason in 250 ml NaCl als Kurzinfusion i.v.</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>

                        <w:p/>

                        <w:p>
			    <xsl:call-template name="pPr"/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="text">
                                    <xsl:text>Oder orale Anwendung: </xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>

                        <w:p>
			    <xsl:call-template name="pPr"/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="text">
                                    <xsl:text>Prednisolon 100 mg oral (z.B. 2x50 mg Decortin H) oder als Suppositorium (Rectodelt 100 mg)</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>
                    </w:tc>
                </w:tr>
            </xsl:if>

            <xsl:if test="$diag_migraine_without_aura">
                <w:tr>
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="3706" w:type="dxa"/>
                            <w:gridSpan w:val="2"/>
                        </w:tcPr>

                        <w:p>
			    <xsl:call-template name="pPr"/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="text">
                                    <xsl:text>Migräne ohne Aura</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>

                        <xsl:call-template name="nach_pause"/>
                    </w:tc>

                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="5391" w:type="dxa"/>
                            <w:gridSpan w:val="2"/>
                        </w:tcPr>

                        <w:p>
			    <xsl:call-template name="pPr"/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="bold" select="true()"/>
                                <xsl:with-param name="text">
                                    <xsl:text>Dimenhydrinat (Vomex A®) </xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="text">
                                    <xsl:text>50 mg bei Übelkeit </xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>

                        <w:p>
			    <xsl:call-template name="pPr"/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="bold" select="true()"/>
                                <xsl:with-param name="text">
                                    <xsl:text>+ Eletriptan 40 mg</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>

                        <w:p>
			    <xsl:call-template name="pPr"/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="bold" select="true()"/>
                                <xsl:with-param name="text">
                                    <xsl:text>+ Naproxen 500 mg </xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="text">
                                    <xsl:text>gleichzeitig mit dem Triptan zur Verhinderung des Wiederkehrkopfschmerzes einnehmen</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>

                        <w:p/>

                        <w:p>
			    <xsl:call-template name="pPr"/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="text">
                                    <xsl:text>Alternativ kann an Stelle von Eletriptan 40 mg auch Rizatriptan 10 mg zur Anwendung kommen.</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>

                        <w:p/>

                        <w:p>
			    <xsl:call-template name="pPr"/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="bold" select="true()"/>
                                <xsl:with-param name="text">
                                    <xsl:text>Bitte Triptane innerhalb einer Attacke nicht mischen</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>

                        <w:p>
			    <xsl:call-template name="pPr"/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="text">
                                    <xsl:text>Erneute Einnahme frühestens nach 4 Stunden bei primär guter Wirksamkeit und auftretenden Wiederkehrkopfschmerz, maximal 3 Tage in Folge anwenden. </xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>

                        <w:p/>

                        <w:p>
			    <xsl:call-template name="pPr"/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="bold" select="true()"/>
                                <xsl:with-param name="text">
                                    <xsl:text>Ersatzmedikation bei Wirkungslosigkeit:</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>

                        <w:p>
			    <xsl:call-template name="pPr"/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="bold" select="true()"/>
                                <xsl:with-param name="text">
                                    <xsl:text>Metamizol </xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="text">
                                    <xsl:text>(z.B. Novalgin/Novaminsulfon) 1 g (entspr. 40 Tropfen) in Abständen von 6-8 Stunden bis zu 4x am Tag möglich. Oder:</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>

                        <w:p>
			    <xsl:call-template name="pPr"/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="bold" select="true()"/>
                                <xsl:with-param name="text">
                                    <xsl:text>Diclofenac: </xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="text">
                                    <xsl:text>Initialdosis 50 mg (entspr. 20 Tropfen). Falls nach 2 Std. keine ausreichende Besserung eintritt, zweite Dosis von 50 mg (20 Tropfen) möglich. Weitere Dosen in Abständen von 4-6 Stunden möglich. Gesamtdosis von 200 mg/Tag darf nicht überschritten werden. </xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>
                    </w:tc>
                </w:tr>
            </xsl:if>

            <xsl:if test="$diag_migraine_with_aura">
                <w:tr>
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="3706" w:type="dxa"/>
                            <w:gridSpan w:val="2"/>
                        </w:tcPr>

                        <w:p>
			    <xsl:call-template name="pPr"/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="text">
                                    <xsl:text>Migräne mit Aura</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>

                        <xsl:call-template name="nach_pause"/>
                    </w:tc>

                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="5391" w:type="dxa"/>
                            <w:gridSpan w:val="2"/>
                        </w:tcPr>

                        <w:p>
			    <xsl:call-template name="pPr"/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="bold" select="true()"/>
                                <xsl:with-param name="text">
                                    <xsl:text>Metamizol </xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="text">
                                    <xsl:text>(z.B. Novalgin/Novaminsulfon) 1 g (entspr. 40 Tropfen) in Abständen von 6-8 Stunden bis zu 4x am Tag möglich. Oder:</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>

                        <w:p>
			    <xsl:call-template name="pPr"/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="bold" select="true()"/>
                                <xsl:with-param name="text">
                                    <xsl:text>Diclofenac: </xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="text">
                                    <xsl:text>Initialdosis 50 mg (entspr. 20 Tropfen). Falls nach 2 Std. keine ausreichende Besserung eintritt, zweite Dosis von 50 mg (20 Tropfen) möglich. Weitere Dosen in Abständen von 4-6 Stunden möglich. Gesamtdosis von 200 mg/Tag darf nicht überschritten werden. </xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>

                        <w:p/>

                        <w:p>
			    <xsl:call-template name="pPr"/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="text">
                                    <xsl:text>Bei sicherer vollständiger Rückbildung der Aurasymptomatik Anschlussbehandlung mittels Triptan (s.o.) möglich. </xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>

                        <w:p/>

                        <w:p>
			    <xsl:call-template name="pPr"/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="bold" select="true()"/>
                                <xsl:with-param name="text">
                                    <xsl:text>Triptane sind während einer Aura kontraindiziert.</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>
                    </w:tc>
                </w:tr>
            </xsl:if>

            <xsl:if test="$diag_status_migrainosus">
                <w:tr>
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="3706" w:type="dxa"/>
                            <w:gridSpan w:val="2"/>
                        </w:tcPr>

                        <w:p>
			    <xsl:call-template name="pPr"/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="text">
                                    <xsl:text>Status migraenosus</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>

                        <w:p>
			    <xsl:call-template name="pPr"/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="text">
                                    <xsl:text>(Attackendauer mehr als 72 Stunden)</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>
                    </w:tc>

                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="5391" w:type="dxa"/>
                            <w:gridSpan w:val="2"/>
                        </w:tcPr>

                        <w:p>
			    <xsl:call-template name="pPr"/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="text">
                                    <xsl:text>Prednisolon 100 mg + ggf. Diazepam 10 mg zur Schmerzdistanzierung</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>

                        <w:p/>

                        <w:p>
			    <xsl:call-template name="pPr"/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="text">
                                    <xsl:text>Oder alternativ durch den Arzt durchzuführen:</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>

                        <w:p>
			    <xsl:call-template name="pPr"/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="text">
                                    <xsl:text>Aspirin 1.000 mg als Kurzinfusion</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>
                    </w:tc>
                </w:tr>
            </xsl:if>

            <xsl:if test="$diag_cluster">
                <w:tr>
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="3706" w:type="dxa"/>
                            <w:gridSpan w:val="2"/>
                        </w:tcPr>

                        <w:p>
			    <xsl:call-template name="pPr"/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="text">
                                    <xsl:text>Clusterkopfschmerz</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>
                    </w:tc>

                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="5391" w:type="dxa"/>
                            <w:gridSpan w:val="2"/>
                        </w:tcPr>

                        <w:p>
			    <xsl:call-template name="pPr"/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="text">
                                    <xsl:text>100% Sauerstoffinhalation 15 l/min über 15 Minuten mit Gesichtsmaske</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>

                            <w:br/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="text">
                                    <xsl:text>oder</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>

                            <w:br/>
                        </w:p>

                        <w:p>
			    <xsl:call-template name="pPr"/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="bold" select="true()"/>
                                <xsl:with-param name="text">
                                    <xsl:text>Sumatriptan Inject 6 mg</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="text">
                                    <xsl:text>, maximal 2x täglich, Mindestabstand 4 Stunden, keine Obergrenze in Form von Tagen/Monat </xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>

                            <w:br/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="text">
                                    <xsl:text>alternativ</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>

                            <w:br/>
                        </w:p>

                        <w:p>
			    <xsl:call-template name="pPr"/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="bold" select="true()"/>
                                <xsl:with-param name="text">
                                    <xsl:text>Zolmitriptan 5 mg nasal</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="text">
                                    <xsl:text> maximal 2x täglich, Mindestabstand 4 Stunden, keine Obergrenze in Form von Tagen/Monat</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>

                            <w:br/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="text">
                                    <xsl:text>und/oder</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>

                            <w:br/>
                        </w:p>

                        <w:p>
			    <xsl:call-template name="pPr"/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="bold" select="true()"/>
                                <xsl:with-param name="text">
                                    <xsl:text>Xylocain-Nasenspray</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>

                            <w:br/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="text">
                                    <xsl:text>und/oder</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>

                            <w:br/>
                        </w:p>

                        <w:p>
			    <xsl:call-template name="pPr"/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="bold" select="true()"/>
                                <xsl:with-param name="text">
                                    <xsl:text>10 ml Eiswasser</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>
                    </w:tc>
                </w:tr>
            </xsl:if>

            <xsl:if test="$diag_spaks">
                <w:tr>
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="3706" w:type="dxa"/>
                            <w:gridSpan w:val="2"/>
                        </w:tcPr>

                        <w:p>
			    <xsl:call-template name="pPr"/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="text">
                                    <xsl:text>Kopfschmerz vom Spannungstyp</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>
                    </w:tc>

                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="5391" w:type="dxa"/>
                            <w:gridSpan w:val="2"/>
                        </w:tcPr>

                        <w:p>
			    <xsl:call-template name="pPr"/>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="text">
                                    <xsl:text>Euminz N kutan im Bereich der schmerzhaften Kopfpartien 3x im Abstand von jeweils 10 Minuten auftragen</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>
                    </w:tc>
                </w:tr>
            </xsl:if>

            <w:tr>
                <w:tc>
                    <w:tcPr>
                        <w:tcW w:w="3706" w:type="dxa"/>
                        <w:gridSpan w:val="2"/>
                    </w:tcPr>

                    <w:p>
			<xsl:call-template name="pPr"/>
                    </w:p>
                </w:tc>

                <w:tc>
                    <w:tcPr>
                        <w:tcW w:w="5391" w:type="dxa"/>
                        <w:gridSpan w:val="2"/>
                    </w:tcPr>

                    <w:p>
			<xsl:call-template name="pPr"/>
                    </w:p>
                </w:tc>
            </w:tr>

            <w:tr>
                <w:tc>
                    <w:tcPr>
                        <w:tcW w:w="9097" w:type="dxa"/>
                        <w:gridSpan w:val="4"/>
                    </w:tcPr>

                    <w:p>
			<xsl:call-template name="pPr"/>

                        <xsl:call-template name="text-run">
                            <xsl:with-param name="bold" select="true()"/>
                            <xsl:with-param name="text">
                                <xsl:text>10-20-Regel</xsl:text>
                            </xsl:with-param>
                        </xsl:call-template>

                        <xsl:call-template name="text-run">
                            <xsl:with-param name="text">
                                <xsl:text> zur Vorbeugung von Kopfschmerzen bei Medikamentenübergebrauch:</xsl:text>
                            </xsl:with-param>
                        </xsl:call-template>
                    </w:p>

                    <w:p>
                        <w:pPr>
                            <w:numPr>
                                <w:ilvl w:val="0"/>
                                <w:numId w:val="21"/>
                            </w:numPr>
                            <w:ind w:left="601" w:hanging="241"/>
                        </w:pPr>

                        <xsl:call-template name="text-run">
                            <xsl:with-param name="size" select="16"/>
                            <xsl:with-param name="text">
                                <xsl:text>Schmerzmittel und/oder Triptane maximal an 10 Tagen/Monat einnehmen, an mindestens 20 Tagen/Monat keine Akutmedikamente einsetzen.</xsl:text>
                            </xsl:with-param>
                        </xsl:call-template>
                    </w:p>

                    <xsl:if test="$diag_migraine_with_aura">
                        <w:p>
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:ind w:left="601" w:hanging="241"/>
                            </w:pPr>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="size" select="16"/>
                                <xsl:with-param name="text">
                                    <xsl:text>Triptane sind während einer Aura kontraindiziert</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>
                    </xsl:if>

                    <xsl:if test="$print_full || $age > 64">
                        <w:p>
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:ind w:left="601" w:hanging="241"/>
                            </w:pPr>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="size" select="16"/>
                                <xsl:with-param name="highlight" select="true()"/>
                                <xsl:with-param name="text">
                                    <xsl:text>Kardiovaskuläre Risikofaktoren bestehen nach individueller Abklärung nicht. Aufgrund dieser Situation sehen wir aktuell nach ausführlicher Aufklärung keine individuelle Kontraindikation für die Behandlung mit Triptanen über dem 65. Lebensjahr.</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>
                    </xsl:if>

                    <w:p>
                        <w:pPr>
                            <w:numPr>
                                <w:ilvl w:val="0"/>
                                <w:numId w:val="21"/>
                            </w:numPr>
                            <w:ind w:left="601" w:hanging="241"/>
                        </w:pPr>

                        <xsl:call-template name="text-run">
                            <xsl:with-param name="highlight" select="true()"/>
                            <xsl:with-param name="size" select="16"/>
                            <xsl:with-param name="text">
                                <xsl:text>Beachtung des </xsl:text>
                            </xsl:with-param>
                        </xsl:call-template>

                        <xsl:call-template name="text-run">
                            <xsl:with-param name="highlight" select="true()"/>
                            <xsl:with-param name="bold" select="true()"/>
                            <xsl:with-param name="size" select="16"/>
                            <xsl:with-param name="text">
                                <xsl:text>Agranulozytoserisikos unter Metamizol</xsl:text>
                            </xsl:with-param>
                        </xsl:call-template>

                        <xsl:call-template name="text-run">
                            <xsl:with-param name="highlight" select="true()"/>
                            <xsl:with-param name="size" select="16"/>
                            <xsl:with-param name="text">
                                <xsl:text>. Bei Fieber/Schüttelfrost, Halsschmerzen, Abgeschlagenheit oder Affektionen von Haut und Schleimhäuten ist unverzüglich ein Arzt aufzusuchen und auf die Medikamenteneinnahme hinzuweisen. </xsl:text>
                            </xsl:with-param>
                        </xsl:call-template>
                    </w:p>

                    <xsl:if test="$diag_overuse">
                        <w:p>
                            <w:pPr>
                                <w:numPr>
                                    <w:ilvl w:val="0"/>
                                    <w:numId w:val="21"/>
                                </w:numPr>
                                <w:ind w:left="601" w:hanging="241"/>
                            </w:pPr>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="size" select="16"/>
                                <xsl:with-param name="text">
                                    <xsl:text>Wir empfehlen die Fortführung der </xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="bold" select="true()"/>
                                <xsl:with-param name="size" select="16"/>
                                <xsl:with-param name="text">
                                    <xsl:text>Analgetikapause für insgesamt vier Wochen.</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>

                            <xsl:call-template name="text-run">
                                <xsl:with-param name="size" select="16"/>
                                <xsl:with-param name="text">
                                    <xsl:text> Analgetikapause heißt: Alle Medikamente für die Akutbehandlung von Kopfschmerzen dürfen für einen bestimmten Zeitraum nicht eingenommen werden. Die Pause hat nach spätestens vier bis sechs Wochen ihr Ziel erreicht und kann beendet werden. Attacken können dann wieder mit Akutmedikation behandelt werden. Eine medikamentöse Attackentherapie kann auch dann wieder beginnen. Nach Abschluss der Analgetikapause sollte eine Reevaluation der Kopfschmerzen und entsprechende Diagnosesicherung erfolgen.</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>
                        </w:p>
                    </xsl:if>

                    <w:p>
                        <w:pPr>
                            <w:numPr>
                                <w:ilvl w:val="0"/>
                                <w:numId w:val="21"/>
                            </w:numPr>
                            <w:ind w:left="601" w:hanging="241"/>
                        </w:pPr>

                        <w:hyperlink>
                            <w:r>
                                <w:rPr>
                                    <w:rFonts w:ascii="Lucida Sans Unicode" w:hAnsi="Lucida Sans Unicode"
                                              w:cs="Lucida Sans Unicode"/>
                                    <w:b/>
                                    <w:bCs/>
                                    <w:color w:val="0000FF"/>
                                    <w:sz w:val="16"/>
                                    <w:szCs w:val="16"/>
                                    <w:u w:val="single"/>
                                </w:rPr>
                                <w:t>www.headbook.me</w:t>
                            </w:r>
                        </w:hyperlink>


                        <xsl:call-template name="text-run">
                            <xsl:with-param name="size" select="16"/>
                            <xsl:with-param name="text">
                                <xsl:text>  Informations- und Selbsthilfeforum der Schmerzklinik Kiel im Internet zu allen Fragen der Schmerztherapie. Austausch mit Betroffenen. Monatlicher Live-Chat mit Prof. Dr. Göbel zu Fragen der Schmerztherapie.</xsl:text>
                            </xsl:with-param>
                        </xsl:call-template>
                    </w:p>
                </w:tc>
            </w:tr>
        </w:tbl>
    </xsl:template>
</xsl:stylesheet>
