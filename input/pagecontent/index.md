> **For the english version please click [here](index_en.md).**

Ziel dieses Implementierungsleitfadens ist die Beschreibung von Struktur, Format und Standards von medizinischen Dokumenten der Elektronischen Gesundheitsakte „ELGA“ gemäß Gesundheitstelema- tikgesetz 2012 (GTelG 2012), aber auch für medizinische Dokumente im österreichischen Gesund- heitswesen.

Die Anwendung dieses Implementierungsleitfadens hat im Einklang mit der Rechtsordnung der Republik Österreich und insbesondere mit den relevanten Materiengesetzen (z.B. Ärztegesetz 1998, Apothekenbetriebsordnung 2005, Krankenanstalten- und Kuranstaltengesetz, Gesundheits- und Kran- kenpflegegesetz, Rezeptpflichtgesetz, Datenschutzgesetz 2000, Gesundheitstelematikgesetz 2012) zu erfolgen. Technische Möglichkeiten können gesetzliche Bestimmungen selbstverständlich nicht verändern, vielmehr sind die technischen Möglichkeiten im Einklang mit den Gesetzen zu nutzen.

Sprachliche Gleichbehandlung: Soweit im Text Bezeichnungen nur im generischen Maskulinum angeführt sind, beziehen sie sich auf Männer und Frauen in gleicher Weise. Unter dem Begriff
„Patient“ werden sowohl Bürger, Kunden und Klienten zusammengefasst, welche an einem Behandlungs- oder Pflegeprozess teilnehmen als auch gesunde Bürger, die derzeit nicht an einem solchen teilnehmen. Es wird ebenso darauf hingewiesen, dass umgekehrt der Begriff Bürger auch Patienten, Kunden und Klienten mit einbezieht.

### Verbindlichkeit
Mit der ELGA-Verordnung 2015 (in der Fassung der ELGA-VO-Nov-2015) macht die Bundesministerin für Gesundheit die Festlegungen für Inhalt, Struktur, Format und Codierung verbindlich, die in den Implementierungsleitfäden Entlassungsbrief Ärztlich, Entlassungsbrief Pflege, Pflegesituationsbericht, Laborbefunde, Befund bildgebender Diagnostik, e-Medikation sowie XDS Metadaten (jeweils in der Version 2.06) getroffen wurden. Die anzuwendenden ELGA-Interoperabilitätsstufen ergeben sich aus
§ 21 Abs. 6 ELGA-VO. Die Leitfäden in ihrer jeweils aktuell gültigen Fassung sowie die aktualisierten Terminologien sind von der Gesundheitsministerin auf www.gesundheit.gv.at zu veröffentlichen. Der Zeitplan zur Bereitstellung der Dokumente für ELGA wird durch das das Gesundheitstelematikge- setz 2012 (GTelG 2012) und darauf basierenden Durchführungsverordnungen durch die Bundes- ministerin für Gesundheit vorgegeben.
Neue Hauptversionen der Implementierungsleitfäden KÖNNEN ab dem Tag ihrer Veröffentlichung durch den Bundesministerin für Gesundheit (www.gesundheit.gv.at) verwendet werden, spätestens 18 Monate nach ihrer Veröffentlichung MÜSSEN sie verwendet werden. Andere Aktualisierungen (Nebenversionen) dürfen auch ohne Änderung dieser Verordnung unter www.gesundheit.gv.at veröffentlicht und verwendet werden.
Die Einhaltung der gesetzlichen Bestimmungen liegt im Verantwortungsbereich der Ersteller der CDA- Dokumente.

### Zielgruppe
Anwender dieses Dokuments sind Softwareentwickler und Berater, die allgemein mit Implementierungen und Integrationen im Umfeld der ELGA, insbesondere der ELGA- Gesundheitsdaten, betraut sind. Eine weitere Zielgruppe sind alle an der Erstellung von CDA- Dokumenten beteiligten Personen, einschließlich der Endbenutzer der medizinischen Softwaresysteme und der Angehörigen von Gesundheitsberufen.

### Hinweis auf verwendete Grundlagen
Der vorliegende Leitfaden wurde unter Verwendung der nachstehend beschriebenen Dokumente erstellt. Das Urheberrecht an allen genannten Dokumenten wird im vollen Umfang respektiert.

Dieser Standard beruht auf der Spezifikation „HL7 Clinical Document Architecture, Release 2.0“, für die das Copyright © von Health Level Seven International gilt. HL7 Standards können über die HL7 Anwendergruppe Österreich (HL7 Austria), die offizielle Vertretung von Health Level Seven International in Österreich bezogen werden (www.hl7.at). Alle auf nationale Verhältnisse angepassten und veröffentlichten HL7-Spezifkationen können ohne Lizenz- und Nutzungsgebühren in jeder Art von Anwendungssoftware verwendet werden.

Dieser Leitfaden beruht auf Inhalten des LOINC® (Logical Observation Identifiers Names and Codes, siehe http://loinc.org). Die LOINC-Codes, Tabellen, Panels und Formulare unterliegen dem Copyright
© 1995-2014, Regenstrief Institute, Inc. und dem LOINC Committee, sie sind unentgeltlich erhältlich. Lizenzinformationen sind unter http://loinc.org/terms-of-use abrufbar. Weiters werden Inhalte des UCUM® verwendet, UCUM-Codes, Tabellen und UCUM Spezifikationen beruhen auf dem Copyright
© 1998-2013 des Regenstrief Institute, Inc. und der Unified Codes for Units of Measures (UCUM) Organization. Lizenzinformationen sind unter http://unitsofmeasure.org/trac/wiki/TermsOfUse abrufbar.

### Hinweise zur Nutzung des Leitfadens
Der vorliegende Leitfaden wurde unter der Leitung der ELGA GmbH und unter Mitwirkung der genannten Personen (Mitglieder der Arbeitsgruppen zur Harmonisierung der Implementierungsleitfäden) erstellt. Die Arbeiten für den vorliegenden Leitfaden wurden von den Autoren gemäß dem Stand der Technik und mit größtmöglicher Sorgfalt erbracht. Die HL7 Austria und die ELGA GmbH genehmigen ausdrücklich die Anwendung des Leitfadens ohne Lizenz- und Nutzungsgebühren zum Zweck der Erstellung medizinischer Dokumente und weisen darauf hin, dass dies mit dem Einverständnis aller Mitwirkenden erfolgt.

### Revisionsliste
Diese Version ist eine Korrekturversion zu Version 2.05 vom 17.03.2015 und ersetzt diese. Die durchgeführten Änderungen ersehen Sie der Revisionsliste in Kapitel 6.2.

### Weitere unterstützende Materialien
Gemeinsam mit diesem Leitfaden werden auf der Website der ELGA GmbH (www.elga.gv.at) weitere Dateien und Dokumente zur Unterstützung bereitgestellt: Beispieldokumente, zu verwendende Codes, Vorgaben zur Registrierung von CDA-Dokumenten, das Referenz-Stylesheet zur Darstellung von CDA-Dokumenten, Algorithmen zur Prüfung der Konformität von CDA-Dokumenten etc.

Fragen, Kommentare oder Anregungen für die Weiterentwicklung können an cda@elga.gv.at gesendet werden. 

### Erarbeitung des Implementierungsleitfadens
#### v3
TODO Prozess, Autoren und Mitwirkende

Für den aktuellen Herausgeber siehe [Support & Imprint](support_de.md).

#### v2
Der Implementierungsleitfaden in der Hauptversion 2 entstand im Projekt e-Medikation auf Basis diverser Konsultationen unter Einbeziehung von Vertretern aller Stakeholder. Da die medizinischen Inhalte damals bereits gesetzlich bzw. durch Verordnung des Bundesministers festgelegt sind, wurde keine Harmonisierungsgruppe eingesetzt. Darüber hinaus wurde der damalige Implementierungsleitfaden für die Abstimmung und Diskussion im Zuge der Entwicklung der Usability-Styleguides herangezogen und entsprechend weiterentwickelt. Das Dokument durchlief eine öffentliche Kommentierungsphase und ein nationales Standardisierungsverfahren ("Ballot") durch die HL7 Anwendergruppe Österreich (HL7 Austria). Folgende Personen waren damals an der Erstellung des Leitfadens beteiligt:

##### Herausgeber, Projektleiter, CDA-Koordinator
<table>
    <tr>
        <td>Kürzel</td>
        <td>Organisation</td>
        <td>Person (ohne Titel)</td>
    </tr>
    <tr>
        <td>SSA</td>
        <td>ELGA GmbH</td>
        <td>Stefan Sabutsch</td>
    </tr>
</table>

##### Autor Fachkoordinator
<table>
    <tr>
        <td>Kürzel</td>
        <td>Organisation</td>
        <td>Person (ohne Titel)</td>
    </tr>
    <tr>
        <td>JBR</td>
        <td>CodeWerk	Software	Services	and Development GmbH</td>
        <td>Jürgen Brandstätter</td>
    </tr>
</table>

##### Mitwirkende
<table>
    <tr>
        <td>Organisation</td>
        <td>Person (ohne Titel)</td>
    </tr>
    <tr>
        <td>SVC</td>
        <td>Michael Bauer</td>
    </tr>
    <tr>
        <td>SVC</td>
        <td>Michael Deimel</td>
    </tr>
    <tr>
        <td>SVC</td>
        <td>Tanja Krammer</td>
    </tr>
    <tr>
        <td>SVC</td>
        <td>Martin Asenbaum</td>
    </tr>
    <tr>
        <td>ELGA GmbH</td>
        <td>Alexander Kollmann</td>
    </tr>
    <tr>
        <td>ELGA GmbH</td>
        <td>Oliver Kuttin</td>
    </tr>
    <tr>
        <td>ELGA GmbH</td>
        <td>Carina Seerainer</td>
    </tr>
</table>