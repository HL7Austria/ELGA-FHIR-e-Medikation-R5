> **For the english version please click [here](intro_en.html).**

Die Elektronische Gesundheitsakte (ELGA) umfasst die relevanten multimedialen und gesundheitsbezogenen Daten und Informationen zu einer eindeutig identifizierten Person. Die Daten sind in einem oder mehreren computergestützten Informationssystemen gespeichert. Sie stehen allen berechtigten Personen entsprechend ihren Rollen und den datenschutzrechtlichen Bedingungen in einer bedarfsgerecht aufbereiteten elektronischen Form online zur Verfügung.
Die wesentliche Funktion von ELGA ist die Bereitstellung von patientenbezogenen medizinischen Dokumenten, die in vielen unterschiedlichen Informationssystemen der verschiedenen Gesundheitsdiensteanbieter erstellt werden. Zu den relevanten medizinischen Daten gehören auch die Medikationsdaten, die über die ELGA-Anwendung
„e-Medikation“ verfügbar gemacht werden. Dazu errichtet und betreibt der Hauptverband der Sozialversicherungen ein Informationssystem, das Ärzten, Apothekern und den ELGA- Teilnehmern selbst eine Übersicht über verordnete und abgegebene Medikamente bietet. Rechtsgrundlage für die Umsetzung der e-Medikation ist das „ELGA-Gesetz“ (GTelG 2012
§16a) sowie die „ELGA-Verordnung“ (ELGA-VO 2015 §14, 15 und 16).

Diese Medikationsdaten sollen nicht nur von Benutzern gelesen, sondern auch wieder in die IT-Systeme integriert und dort weiterverwendet werden können („Semantische Interoperabilität“). Für den Austausch der Medikationsdaten wird der internationale Standard
„Clinical Document Architecture, Release 2.0“ (CDA) von HL7 eingesetzt.

Der CDA-Standard wird für die Verwendung in der ELGA Anwendung e-Medikation im Detail ausspezifiziert, Vorgaben für einheitliche Dokumentation und Codierung der Information festgelegt und in implementierbaren Leitfäden veröffentlicht.

### e-Medikation

Die e-Medikation ist als Service zu verstehen, welches im Zuge des Verordnungs-, des Abgabe-, bzw. des Verabreichungsprozesses Informationen zur Medikation eines Patienten zur Verfügung stellt. Zentrale Elemente sind dabei die Medikationsdatenbank, sowie deren Schnittstellen zu bestehender IT-Infrastruktur (wie Arztpraxissoftware-, Apothekensoftware- und Krankenhausinformations-Systeme.
Zur Vernetzung wird die ELGA-Infrastruktur genutzt.

### Gegenüberstellung e-Medikation und e-Rezept
Für das Verständnis der in diesem Leitfaden beschriebenen Use-Cases ist ein Grundverständnis der Gemeinsamkeiten und Unterschiede zwischen e-Medikation und dem e-Rezept Service wichtig. Beide Systeme nutzen Informationen, die im Zuge der Rezeptausstellung durch Ärztin bzw. Arzt erfasst werden, wobei sich der Zweck der Datenspeicherung je Anwendung unterscheidet. Daher gibt es auch unterschiedliche gesetzliche Grundlagen und zwei getrennte technische Systeme. Die Folgende Tabelle fasst die wichtigsten Unterschiede zusammen:

<table>
    <tr>
        <td>e-Medikation</td>
        <td>e-Rezept</td>
    </tr>
    <tr>
        <td>Anwendung der elektronischen Gesundheitsakte ELGA</td>
        <td>Anwendung im e-card System</td>
    </tr>
    <tr>
        <td>Gesetzliche Grundlage: GTelG 2012</td>
        <td>Gesetzliche Grundlage: § 31a ASVG</td>
    </tr>
    <tr>
        <td>Nutzen: Wechselwirkungsprüfung, Vermeidung von Mehrfachverschreibungen, Übersicht über verordnete und in der Apotheke abgeholte Arzneimittel. Die Abgabe von rezeptpflichtigen Heilmitteln nur aufgrund eines Eintrags in der e-Medikation ist nicht zulässig. </td>
        <td>Nutzen: Reduktion und Vereinfachung papiergebundener Prozesse durch elektronische Erfassung, Einlösung und Abrechnung von Rezepten.</td>
    </tr>
    <tr>
        <td>Fokus: medizinische Daten (Arzneimittel, Dosierung, Einnahme…)</td>
        <td>Fokus: administrative Daten (Name, Versicherungsnummer…); bei Kassenrezepten: sozialversicherungs-relevante Aspekte (Versicherungsstatus, Rezeptgebührenbefreiung ...). Digitalisierung der Privatrezepte</td>
    </tr>
    <tr>
        <td>Datenerfassung ist Patientenrecht. Abmeldung von ELGA gesamt oder nur für e-Medikation möglich.</td>
        <td>Aufrechter Versicherungsschutz ist Voraussetzung für die Nutzung von e-Rezept. Bei Kassenrezepten: Datenerfassung ist Voraussetzung für die Kostenübernahme durch die Sozialversicherung (ersetzt das bisherige Papier-Kassenrezept). Keine Abmeldung möglich.</td>
    </tr>
    <tr>
        <td>Eine Ärztin bzw. ein Arzt hat nur mit aufrechter Kontaktbestätigung (= e-card wurde innerhalb der letzten 90 Tage in der Ordination gesteckt oder per NFC ausgelesen) Zugriff auf ELGA und e-Medikation (lesend und schreibend), weil Daten anderer GDA eingesehen bzw. Daten zur Einsicht für andere GDA gespeichert werden. Eine Apotheke hat nach Stecken der e-card 28 Tage lang Zugriff auf die e-Medikation.</td>
        <td>Eine Ärztin bzw. ein Arzt kann immer ein e-Rezept erstellen. Es reicht die Sozialversicherungsnummer, weil kein Zugriff auf Daten anderer GDA notwendig ist: Patientin bzw. Patient muss nicht anwesend sein, die e-card muss nicht gesteckt oder per NFC ausgelesen werden.</td>
    </tr>
    <tr>
        <td>Die Medikationsdaten (Verordnungen und Abgaben) der letzten 18 Monate sind gespeichert und für ELGA-Teilnehmer über das ELGA-Portal bzw. für den GDA bei aufrechter Kontaktbestätigung abrufbar. </td>
        <td>Versicherte können über die Portale und Apps der Sozialversicherung alle offenen Kassenrezepte einsehen, die für sie selbst sowie für Mitversicherte unter 14 Jahren ausgestellt wurden.<br/>Eine Ärztin bzw. ein Arzt kann jene e-Rezepte einsehen, die sie oder er selbst ausgestellt hat, nicht aber solche e-Rezepte, die andere Ärztinnen bzw. Ärzte ausgestellt haben.<br/>Apotheken erhalten durch Scan des e-Rezept Codes oder Eingabe der e-Rezept ID Zugriff auf EIN bestimmtes e-Rezept. Durch Stecken der e-card oder Nutzung der NFC-Funktion können Apotheken ALLE offenen e-Rezepte einer Person aufrufen.</td>
    </tr>
</table>

### Zweck
Das Ziel dieses Dokuments ist die Beschreibung der Struktur von e-Medikations- Dokumenten der Elektronischen Gesundheitsakte ELGA. Insbesondere behandelt das Dokument jegliche Strukturen, welche auf der Basis des Implementierungsleitfadens

„HL7 Implementation Guide for CDA® R2: Allgemeiner Implementierungsleitfaden für ELGA CDA Dokumente“ [OID Root 1.2.40.0.34.7.1]

speziell für die Dokumentenklassen

* Rezept
* Abgabe 
* Pharmazeutische Empfehlung (Korrekturmeldung)
* Medikationsliste (automatische Zusammenfassung)

gültig sind. Die Beschreibung enthält Festlegungen, Einschränkungen und Bedingungen auf	Grundlage von HL7 CDA-Elementen.

### Hierarchie der Implementierungsleitfäden

Der vorliegende Implementierungsleitfaden basiert auf der grundlegenden Implementierungsvorschrift für alle CDA Dokumente im österreichischen Gesundheitswesen.
Die CDA Dokumente der e-Medikation haben grundsätzlich den beiden aufeinander aufbauenden Implementierungsleitfäden zu folgen.

![Zusammenspiel der Implementierungsleitfäden](input/images/Zusammenspiel_der_Implementierungsleitfäden.jpg)

Die administrativen Daten im Dokumentheader und grundsätzliche Vorgaben für den medizinischen Inhalt werden vom „Allgemeinen Implementierungsleitfaden“ definiert. Der jeweilige „Spezielle Implementierungsleitfaden“ enthält die Vorgaben für die medizinischen Inhalte und ergänzt gegebenenfalls die Header-Vorgaben.

Für die Verwendung dieses Implementierungsleitfadens sind zusätzlich die Vorgaben aus

>„HL7 Implementation Guide for CDA® R2: Allgemeiner Implementierungsleitfaden für ELGA CDA Dokumente“ OID Root [1.2.40.0.34.7.1] in der Hauptversion 2 vorausgesetzt.
