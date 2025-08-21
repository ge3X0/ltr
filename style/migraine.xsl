<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">

    <xsl:template match="//w:p[.//mitaura_akut]">
        <xsl:if test="$diag_migraine_with_aura">
            <w:p>
                <xsl:call-template name="text-run">
                    <xsl:with-param name="text">
                        <xsl:text>Bei </xsl:text>
                    </xsl:with-param>
                </xsl:call-template>

                <xsl:call-template name="text-run">
                    <xsl:with-param name="bold" select="true()"/>
                    <xsl:with-param name="text">
                        <xsl:text>Migräne mit Aura</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>

                <xsl:call-template name="text-run">
                    <xsl:with-param name="text">
                        <xsl:text> ist der Einsatz von Triptanen während einer Aura kontraindiziert. Hier empfiehlt sich die Einnahme von Akutanalgetika wie Novaminsulfon® (Metamizol) 40° bis zu 4x täglich. Alternativ ist Diclofenac 20°, maximal 3x täglich möglich. Nach sicher abgeklungener Aurasymptomatik kann der Einsatz von Triptanen erfolgen.</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
            </w:p>
        </xsl:if>
    </xsl:template>

    <xsl:template name="with_and"><xsl:if test="$diag_migraine_with_aura"><xsl:text> mit und</xsl:text></xsl:if></xsl:template>
    <xsl:template match="//mitund"><xsl:if test="$diag_migraine_with_aura"><xsl:text> mit und</xsl:text></xsl:if></xsl:template>

    <!-- <xsl:template match="//aura"> -->
    <!--     <xsl:choose> -->
    <!--         <xsl:when test="$diag_migraine_with_aura"> -->
    <!--             <xsl:text>Vorübergehende einseitige Sehstörungen in Form von Fortifikationsphänomenen</xsl:text> -->
    <!--         </xsl:when> -->
    <!--         <xsl:otherwise> -->
    <!--             <xsl:text>Keine</xsl:text> -->
    <!--         </xsl:otherwise> -->
    <!--     </xsl:choose> -->
    <!-- </xsl:template> -->

    <xsl:template match="//anamnese_aura">
        <xsl:if test="$diag_migraine_with_aura">
            <xsl:text> Dabei treten visuelle Auren in Form von Fortifikationsphänomenen in etwa der Hälfte der Attacken auf.</xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:template match="//anamnese_status">
        <xsl:if test="$diag_status_migrainosus">
            <xsl:text> Einzelne Attacken verlaufen häufig prolongiert als Status migraenosus.</xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:template match="//empf_vitb2">
        <xsl:if test="$diag_migraine_without_aura or $diag_migraine_with_aura">
            <w:p>
                <w:pPr>
                    <w:jc w:val="both"/>
                </w:pPr>

                <xsl:call-template name="text-run">
                    <xsl:with-param name="highlight" select="true()"/>
                    <xsl:with-param name="text">
                        <xsl:text>Zur Prophylaxe der Migräne erhielt </xsl:text>
                        <xsl:call-template name="patient"/>
                        <xsl:text> die hochdosierten Nahrungsergänzungsmittel </xsl:text>
                    </xsl:with-param>
                </xsl:call-template>

                <xsl:call-template name="text-run">
                    <xsl:with-param name="bold" select="true()"/>
                    <xsl:with-param name="highlight" select="true()"/>
                    <xsl:with-param name="text">
                        <xsl:text>Vitamin B2 und Magnesium</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>

                <xsl:call-template name="text-run">
                    <xsl:with-param name="highlight" select="true()"/>
                    <xsl:with-param name="text">
                        <xsl:text>.</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
            </w:p>
        </xsl:if>
    </xsl:template>

    <xsl:template match="//akut_empfehlung">
	<xsl:if test="$diag_migraine_without_aura or $diag_migraine_with_aura">
	    <w:p>
		<w:pPr>
		    <w:jc w:val="both" />
		</w:pPr>

		<xsl:call-template name="text-run">
		    <xsl:with-param name="text">
			<xsl:text>Wir empfahlen </xsl:text>
		    </xsl:with-param>
		</xsl:call-template>

		<xsl:if test="$diag_overuse">
		    <xsl:call-template name="text-run">
			<xsl:with-param name="text">
			    <xsl:text>nach Abschluss der Medikamentenpause </xsl:text>
			</xsl:with-param>
		    </xsl:call-template>
		</xsl:if>

		<xsl:call-template name="text-run">
		    <xsl:with-param name="bold" select="true()"/>
		    <xsl:with-param name="text">
			<xsl:text>zur Attackenbehandlung der Migräne ohne Aura</xsl:text>
		    </xsl:with-param>
		</xsl:call-template>

		<xsl:call-template name="text-run">
		    <xsl:with-param name="text">
			<xsl:text> den Einsatz einer Kombination aus dem selektiven Serotoninrezeptoragonisten </xsl:text>
		    </xsl:with-param>
		</xsl:call-template>

		<xsl:call-template name="text-run">
		    <xsl:with-param name="bold" select="true()"/>
		    <xsl:with-param name="highlight" select="true()"/>
		    <xsl:with-param name="text">
			<xsl:text>Eletriptan 40 mg</xsl:text>
		    </xsl:with-param>
		</xsl:call-template>

		<xsl:call-template name="text-run">
		    <xsl:with-param name="text">
			<xsl:text> oral mit dem langwirksamen </xsl:text>
		    </xsl:with-param>
		</xsl:call-template>

		<xsl:call-template name="text-run">
		    <xsl:with-param name="bold" select="true()"/>
		    <xsl:with-param name="highlight" select="true()"/>
		    <xsl:with-param name="text">
			<xsl:text>Naproxen</xsl:text>
		    </xsl:with-param>
		</xsl:call-template>

		<xsl:call-template name="text-run">
		    <xsl:with-param name="text">
			<xsl:text> als Tablette zu 500 mg. Ziel dieser Kombination ist zum einen eine schnelle und effektive Schmerzlinderung, zum anderen ein Verhindern oder zumindest Hinauszögern des Auftretens von Wiederkehrkopfschmerzen. Der empfohlene selektive Serotoninrezeptoragonist gehört zur Gruppe der Triptane. Bei dessen Anwendung müssen einige Besonderheiten berücksichtigt werden. Bei zunächst erfolgreicher Anwendung des Triptans können nach einigen Stunden sog. Wiederkehrkopfschmerzen auftreten. Wiederkehrkopfschmerzen sind definiert als erneut auftretende Migränekopfschmerzen, meist innerhalb von 4 bis 12 Stunden, nachdem die initiale Applikation des Triptans zu einer bedeutsamen Reduktion der Migränekopfschmerzen geführt hatte. In dieser Situation ist eine Wiederholung der Anwendung möglich. Allerdings sollte dabei ein Abstand von mindestens 4 Stunden zur Erstanwendung eingehalten werden. Innerhalb von 24 Stunden sollte die Einnahme des Triptans maximal einmal wiederholt werden. Die Migräneakutmedikation sollte </xsl:text>
		    </xsl:with-param>
		</xsl:call-template>

		<xsl:call-template name="text-run">
		    <xsl:with-param name="bold" select="true()"/>
		    <xsl:with-param name="text">
			<xsl:text>maximal an 10 Tagen im Monat</xsl:text>
		    </xsl:with-param>
		</xsl:call-template>

		<xsl:call-template name="text-run">
		    <xsl:with-param name="text">
			<xsl:text> eingenommen werden, um die Entstehung eines medikamenteninduzierten Dauerkopfschmerzes zu verhindern. Zur Therapiekontrolle sollte die Migräne-App kontinuierlich geführt werden, um sowohl Kopfschmerzsymptome als auch Therapieeffekte im Verlauf zu protokollieren (Download kostenlos in iOS bzw. Google-Play Store). Die Migräne-App dokumentiert den Verlauf von Migräne und Kopfschmerzen mit aktiver Dateneingabe. Sie meldet aggregierte Informationen aus dem Datensatz zurück und unterstützt so Patienten als auch betreuende Ärzte in der Verlaufs- und Erfolgskontrolle, bei der Einhaltung von Therapieregeln sowie bei der Therapieanpassung. Die Migräne-App enthält zusätzlich umfangreiche Report-, Informations- und Selbsthilfe-Tools.</xsl:text>
		    </xsl:with-param>
		</xsl:call-template>
	    </w:p>
	</xsl:if>
    </xsl:template>


</xsl:stylesheet>
