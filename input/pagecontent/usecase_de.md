> **For the english version please click [here](usecases_en.html).**

Zum besseren Verständnis des Implementierungsleitfaden „e-Medikation“ sowie dem Zusammenspiel der CDA-Dokumente werden im Folgenden die Anwendungsfälle für die e- Medikation kurz dargestellt.

### Allgemein

#### Akteure
Folgende Akteure werden in der ELGA-Anwendung e-Medikation (eMEDAT) definiert:
- Akteure im niedergelassenen Bereich
    - Arzt
        - Kassenarzt
        - Wahlarzt
        - Facharzt
        - Hausapotheker (Da im GDA-Index jeder GDA nur eine Rolle besitzt und es eine Rolle „Hausapotheker“ nicht gibt, haben Hausapotheker dieselbe Rolle wie niedergelassene Ärzte ohne Hausapotheke. Somit hat jeder Arzt auch die Funktionalitäten zur Abgabe zur Verfügung.)
        - etc.
    -	Arztpraxisassistent
-	Krankenanstalt
    -	In der e-Medikation erfolgt keine Unterscheidung in stationären und ambulanten Bereich.
-	Akteure in der Apotheke
    -	Pharmazeut/In
    -	Pharmazeutisch-kaufmännisch(er/e) AssistentIn
-	Einrichtung der Pflege
    -	Die Umsetzung der Berechtigungen (z.B. darf nur ein Arzt eine Verordnung in e- Medikation speichern), obliegt der GDA-Software.
    -	Pflegeperson (siehe Vertreter, Vollmachtnehmer)
-	ELGA-Teilnehmer
    -	Vertreter 
        - Ombudsstelle
        - Vollmachtnehmer
        - gesetzlicher Vertreter
        - etc.

#### Dokumententypen
Der gegenständliche Implementierungsleitfaden „e-Medikation“ definiert die folgenden CDA- Dokumente: Rezept, Abgabe, Korrekturmeldung (Pharmazeutische Empfehlung) und Medikationsliste. Um den Medikationsprozess und die folgend beschriebenen Anwendungsfälle abbilden zu können, werden diese Dokumente mit den folgenden Status in der e-Medikation abgebildet:
-	Rezept (PRESCRIPTION; Ein Rezept wird durch ein Prescription Dokument abgebildet und kann eine oder mehrere Verordnungen enthalten. Bezüglich der möglichen Statuswerte unterscheiden sich das Prescription Dokument und die einzelnen Verordnungen.)
    - OFFEN
    - EINGELÖST
    - STORNIERT
    - ABGELAUFEN 
- Verordnung
    - OFFEN
    - EINGELOEST
    - STORNIERT
    - NICHT_DISPENSIERT
- Abgabe (DISPENSE)
    - ABGEGEBEN
    - ABGESETZT (Korrekturmeldung vorhanden)
    - STORNIERT (deprecated)
- Korrekturmeldung (Pharmazeutische Empfehlung, Pharmaceutical Advice)
    - GÜLTIG
    - STORNIERT (deprecated)
- Medikationsliste
    - GÜLTIG
    - ERSETZT (deprecated)

### Verordnung(en) mit Rezept anlegen

Im Zuge der Behandlung stellt der Arzt fest, dass dem ELGA Teilnehmer ein oder mehrere Arzneimittel verordnet werden müssen. Eine Verordnung besteht immer nur aus genau einer Medikation (= ein Arzneimittel). Das Rezept kann aus mehreren Verordnungen bestehen und bildet somit die Klammer über die Verordnungen. Das Rezept mit den Verordnungen wird mit einer eindeutigen eMED-ID versehen.
Die Prüfungen der Arzneimittel z.B. auf potentielle Wechselwirkungen, Kontraindikationen, Dosierungen, etc. erfolgt in der Eigenverantwortung des Arztes und ist nicht Gegenstand der e-Medikation.
Eine Speicherung von Verordnungen ohne Zuordnung eines Rezeptes ist nicht gültig. Die Verordnung wird als geprüft angesehen, wenn die zugeordnete Verordnung in e-Medikation gespeichert ist.

#### Vorbedingung

-	ELGA-Vorbedingung: GDA ist autorisiert, ELGA Teilnehmer ist identifiziert, eine gültige Kontaktbestätigung/ Berechtigung („Ticket“) wurde vom ELGA-Berechtigungssystem ausgestellt.
-	e-Medikation Vorbedingung: keine

#### Akteure

-	Arzt im niedergelassenen Bereich
-	Krankenanstalt
-	Einrichtung der Pflege

#### Ablauf

Die Erfassung eines Rezepts mit Verordnung stellt folgende Prozessschritte in der GDA- Software dar:
-	Arzneimittel auswählen: Der Arzt wählt eine oder mehrere Arzneimittelspezialitäten aus einem Katalog („ASP-Liste“, die Liste der humanen Arzneispezialitäten gelistet nach PZN) aus, wobei Handelsname, Pharmazentralnummer (PZN) sowie andere Daten zur Beschreibung des Arzneimittels (Stärke, Darreichungsform, Packungsgröße, Zulassungsnummer etc.) automatisch aus einem Katalog6 mit allen ELGA-relevanten Arzneimittelspezialitäten übernommen werden können.
-	eMED-ID anfordern: Die Vergabe der eindeutigen eMED-ID erfolgt zentral durch die Serverkomponente e-Medikation und kann über eine entsprechende Schnittstelle angefordert werden.
-	Arzneimittel ausnehmen: Arzneimittel können von der Speicherung in e-Medikation ausgenommen werden (funktionale Anforderung an die GDA-Software, siehe ELGA Usability-Styleguide & Situatives Opt-Out [2],[3],[4])
-	Rezept mit Verordnung in e-Medikation speichern: Prüfung der Eingabedaten
-	Rezept drucken (Anforderung an die GDA-Software, kein Teil in der e-Medikation). Die eMED-ID soll, sofern technisch möglich, sowohl als Klartext als auch als maschinenlesbarer Code (2D-Matrix-Code) auf dem e-Rezept-Ausdruck bzw. einem Papierrezept aufgedruckt werden (§18 Abs. 4 Z. 4 GTelG 2012) um die Versorgungskontinuität (verbesserte Arbeitsabläufe) als auch die anwenderfreundlichen Umsetzung der e-Medikation zu unterstützen.

Der Arzt kann pro „Patientenkontakt“ (Besuch) mehrere Rezepte mit Verordnungen in e- Medikation speichern; Rezepte können jedoch nur einzeln übermittelt werden. Das Rezept mit den Verordnungen ist sofort nach Speicherung in e-Medikation gültig.

> Der aktuelle Katalog „Liste der humanen Arzneispezialitäten gelistet nach PZN“ (ASP-Liste) wird von der AGES, der Österreichischen Agentur für Ernährungssicherheit bereitgestellt und kann über den Terminologieserver frei bezogen werden: https://termgit.elga.gv.at/

##### Anmerkungen zu den Datenfeldern:

Das Rezept wird durch eine Rezeptart gekennzeichnet, um die Gültigkeitsdauer prüfen zu können. In e-Medikation werden folgende Rezeptarten berücksichtigt:
-	Kassenrezept – 1 Monat gültig; eine Einlösung möglich; im Zuge des „Besorgerprozesses“ wird bei einer gespeicherten Teilabgabe die gesamte Gültigkeitsdauer auf 3 Monate verlängert
Es ist nicht möglich, zusätzliche Einlösungen anzugeben.
-	Privatrezept - 1 Monat gültig
    -	Die Gültigkeitsdauer von 1 Monat bezieht sich auf die erste Einlösung. Der Akteur kann eine erweiterte Gültigkeitsdauer mit maximal einem Jahr festlegen.
    -	bis zu 365 Tage bzw. bis zu 6 Einlösungen, wobei Gültigkeitsdauer und Anzahl der möglichen Einlösungen vom Arzt definiert werden können.  Dabei muss das Privatrezept innerhalb des ersten Monats erstmalig eingelöst werden (§ 4 Abs. 1 RezeptpflichtG).
-	Substitutionsrezept – Maximale Gültigkeitsdauer von 24 Monaten. Das GültigVon Datum darf maximal einen Monat in der Zukunft liegen. 
Es ist nicht möglich, zusätzliche Einlösungen anzugeben. 

Die Gültigkeitsdauer je Rezeptart folgt den rechtlichen Vorgaben. Es wird daher der Ausstellungstag in die Berechnung der Einlösefrist nicht mit eingerechnet. Die Gültigkeiten von Rezepten und somit die Verfügbarkeit in e-Medikation ergeben sich folgendermaßen:

- Wenn ein Rezept mit den Verordnungen in e-Medikation gespeichert ist, dann erhält das
Rezept/Verordnung den Status OFFEN.
- Ein Kassenrezept muss innerhalb von 1 Monat eingelöst werden, sonst erhält das Rezept den Status ABGELAUFEN.
- Ein Privatrezept muss innerhalb von 1 Monat eingelöst werden, sonst erhält es den Status ABGELAUFEN.
- Ein Substitutionsrezept ist im Status ABGELAUFEN, wenn das „bis Datum“ erreicht ist.
- Die Anzahl der Einlösungen bei Privatrezepten, gibt an wie viele Einlösungen auf ein Rezept durchgeführt werden dürfen bis die Verordnung auf dem Rezept und das Rezept
den Status=EINGELÖST erhält. Anzahl der Einlösungen bezieht sich immer auf ein
Rezept. Solange die Anzahl der Einlösungen (Abgaben) nicht erreicht wurde, hat die
Verordnung und Rezept den Status=OFFEN.
- Die Rezeptart beeinflusst die Regeln, die bei der Einlösung der Verordnung zur Anwendung kommen. ist für die Regeln der Einlösung notwendig. Siehe dazu Use Cases „Abgabe mittels eMED-ID durchführen“ und „Abgabe über e-card durchführen“. 
Es können nur Arzneimittel verordnet werden, die in der Liste der Arzneimittelspezialitäten
(„ASP-Liste“) vorkommen und als gültig vermerkt sind (ELGA_Gültigkeit = true). Ohne
Verordnungsbezug kann nur die Abgabe jener OTC-Präparate in der e-Medikation gespeichert werden, die auch wechselwirkungsrelevant (ELGA_MedikationWechselwirkungsRelevant = true) sind.
- Bei Kassen- und Substitutionsrezepten müssen alle Verordnungen mit einer Abgabe oder Leerabgabe referenziert werden. 

##### Ergebnis im Gutfall

Die am Rezept angegebenen Verordnungen sind im Status OFFEN in e-Medikation gespeichert. Die zuvor vom Server erstellte eMED-ID wurde für die Dokumentenerstellung verwendet und dem e-Rezept Service als Parameter übergeben.

##### Ergebnis im Fehlerfall

Im Fehlerfall wird der Vorgang abgebrochen und kann bei Bedarf wiederholt werden. Falls fehlerhafte Daten übergeben werden, muss eine Fehlermeldung zurückgeliefert werden mit dem Hinweis auf den Fehler.
Es können die folgenden Fehlerfälle aus der Schnittstelle zur e-Medikation heraus auftreten:
-	Speichern der Verordnung in e-Medikation nicht möglich
-	eMED-ID nicht ermittelbar

Hinweis: Die Ausstellung eines e-Rezepts bzw. eines Papierrezepts darf durch eine etwaiges „Nicht-funktionieren“ der e-Medikation nicht verhindert werden.

### Rezept mit Verordnung(en) abrufen

Im Zuge der Abgabe eines Arzneimittels in einer Apotheke (nach Identifikation mittels e-card) kann der Akteur die Rezepte samt Verordnungen zu einem ELGA Teilnehmer abrufen. Alternativ zur Identifikation mit e-card kann mittels eMED-ID ein Rezept abgerufen werden

#### Vorbedingung
-	ELGA-Vorbedingung: GDA ist autorisiert, ELGA Teilnehmer ist identifiziert, eine gültige Kontaktbestätigung/ Berechtigung wurde vom ELGA-Berechtigungssystem ausgestellt.
-	e-Medikation Vorbedingung: Verordnungen vorhanden

#### Akteure
-	Arzt im niedergelassenen Bereich
-	Krankenanstalt
-	Apotheke
-	Einrichtung der Pflege

#### Ablauf
Der Akteur kann die Verordnungen des ELGA-Teilnehmers  abfragen. Es stehen grundsätzlich zwei Suchvarianten zur Verfügung 
-	Alle Verordnungen von noch nicht eingelösten und noch nicht abgelaufenen Rezepten. 
(findPrescriptionsForDispense) 
-	Alle Verordnungen in einem bestimmten Zeitraum (findPrescriptions)

Für diese beiden Abfragen gibt es zwei mögliche „Startpunkte“:
-	Startpunkt 1: Suche mit eMED-ID Assertion
Suche ohne einem Patientenkontakt im ELGA BeS, auf Basis der eMED-ID Assertion, welche aufgrund der Angabe einer eMED-ID ausgestellt wurde. Mit dieser Assertion können ausschließlich Dokumente gefunden werden, die mit der betreffenden eMED-ID zusammenhängen (Rezept und zugehörige Abgaben, bzw. Pharmaceutical Advices).
-	Startpunkt 2: Suche mit Patientenkontakt
Bei der Suche nach Rezepten mit einem Patientenkontakt im ELGA BeS (z.B. auf Basis der gesteckten e-card), können alle Rezepte des ELGA-Teilnehmers gesucht werden.

Es gibt keine Einschränkung bei der Anzeige der Datenfelder (z.B. ausstellender GDA darf angezeigt werden). Es werden über die Schnittstelle alle verfügbaren Datenfelder zu einer Verordnung/Rezept geliefert (lt. Datenmodell).

##### Ergebnis im Gutfall
Im Gutfall werden dem Akteur die angeforderten Rezepte/ Verordnungen sowie die dazugehörigen Korrekturmeldungen („Pharmazeutischen Empfehlungen“) zurückgeliefert und stehen zur weiteren Verwendung zur Verfügung.

##### Ergebnis im Fehlerfall
Im Fehlerfall wird der Vorgang abgebrochen und kann bei Bedarf wiederholt werden. 
Falls fehlerhafte Daten übergeben werden, muss eine Fehlermeldung zurückgeliefert werden mit dem Hinweis auf den Fehler.

### Verordnung stornieren


Der Akteur muss die Verordnung stornieren können. Es sind folgende Fälle möglich:
-	einzelne Verordnung stornieren (über eine Korrekturmeldung). Dieses Storno ist von allen berechtigten Akteuren (siehe unten) durchführbar. 
-	ganzes Rezept stornieren (über ein Update der XDS-Metadaten oder alle Verordnungen über eine Korrekturmeldung stornieren). Dieses Storno ist nur durch den Ersteller des Dokuments durchführbar.

#### Vorbedingung
- ELGA-Vorbedingung: GDA ist autorisiert, ELGA Teilnehmer ist identifiziert, eine gültige Kontaktbestätigung/ Berechtigung („Ticket“) wurde vom ELGA-Berechtigungssystem ausgestellt.
- e-Medikation Vorbedingung: Verordnung mit dem Status=OFFEN ist vorhanden

#### Akteure
-	Arzt im niedergelassenen Bereich
-	Krankenanstalt
-	Einrichtung der Pflege

#### Ablauf
-	Einzelne Verordnung stornieren:
    -	Eine Verordnung kann mittels einer Korrekturmeldung (Pharmazeutischen Empfehlung) storniert werden. Der Akteur bestimmt die Verordnung (oder mehrere), welche storniert werden soll/sollen. Die Auswahl erfolgt über die VerordnungsID. Die Verordnung erhält den Status „STORNIERT“. Eine Stornierung ist nur zulässig, falls die referenzierte Verordnung bereits in e-Medikation vorhanden ist und den Status
„OFFEN“ besitzt. Bereits abgegebene Verordnungen können nicht mehr verändert werden.
-	Ganzes Rezept stornieren:
Ein Rezept gilt als storniert, wenn einer der folgenden beiden Methoden angewandt wird:

    -	Der Akteur bestimmt alle Verordnung des Rezepts und storniert jede einzelne Verordnung des Rezepts. Das Rezept erhält den Status = STORNIERT, wenn alle zugeordneten Verordnungen den Status = STORNIERT aufweisen.
    -	Der Akteur bestimmt das Rezept mit den Verordnungen (über eMED-ID). Es wird ein Update der Metadaten des Rezepts ausgeführt. Dies kann nur vom Ersteller des Rezepts durchgeführt werden.

##### Ergebnis im Gutfall
Die Verordnung bzw. das Rezept erhalten den Status= STORNIERT.

##### Ergebnis im Fehlerfall
Im Fehlerfall wird der Vorgang abgebrochen und kann bei Bedarf wiederholt werden. Die Verordnung behält den Status „OFFEN“.

### Verordnung/Rezept ändern


Der Arzt muss eine bereits in e-Medikation gespeicherte Verordnung ändern können. Die Änderungen darf von jedem Arzt vorgenommen werden, unabhängig davon, ob der Arzt die Verordnung erstellt hat oder nicht.

#### Vorbedingung
-	ELGA-Vorbedingung: GDA ist autorisiert, ELGA Teilnehmer ist identifiziert, eine gültige Kontaktbestätigung/Berechtigung („Ticket“) wurde vom ELGA-Berechtigungssystem ausgestellt.
-	e-Medikation Vorbedingung: Verordnung mit dem Status=OFFEN ist vorhanden.

#### Akteure
-	Arzt im niedergelassenen Bereich
-	Krankenanstalt
-	Einrichtung der Pflege

#### Ablauf

Eine Verordnung kann mittels einer Korrekturmeldung (=Pharmazeutischen Empfehlung) geändert werden. Der Arzt kann nur die folgenden Datenfelder einer Verordnung ändern, nicht aber das verordnete Arzneimittel oder die Menge selbst:
-	Art der Anwendung
-	Zusatzinformation
-	Ergänzende Information
-	Alternative Einnahme
-	Tagesdosierung
-	Morgen Dosierung
-	Mittags Dosierung
-	Abends Dosierung
-	Nachts Dosierung
-	Frequenz
-	Therapieart
-	Tagesangabe

Verordnungen mit dem Status ABGELAUFEN, NICHT DISPENSIERT, EINGELÖST, STORNIERT können nicht geändert werden. Die Medikation (z.B. Handelsname) einer Verordnung kann NICHT geändert werden.
Ist eine Änderung der Medikation notwendig, kann der Akteur eine neue Verordnung anlegen und eine Stornierung der zu ändernden Verordnung veranlassen (Rücksprache). Das gleiche gilt für die Angabe „Menge“, dazu muss der Arzt ein weiteres Rezept mit einer entsprechenden Verordnung ausstellen. Die Verringerung der Menge kann nicht abgebildet werden.
Die eMED-ID am Rezept muss bei einer Änderung der Verordnung gleich bleiben. Jede Änderung ist zu protokollieren; Es muss nachvollziehbar sein,
-	wann die Änderung der Verordnung durchgeführt wurde.
-	welcher GDA die Änderung der Verordnung durchgeführt hat.

Der Aussteller des Rezepts mit der entsprechenden Verordnung bleibt gleich und darf nicht durch die Änderung der Verordnung verändert werden.

##### Ergebnis im Gutfall
Im Gutfall wird die Änderung der Datenfelder der Verordnung über eine Korrekturmeldung durchgeführt und in e-Medikation gespeichert.

##### Ergebnis im Fehlerfall
Im Fehlerfall wird der Vorgang abgebrochen und kann bei Bedarf wiederholt werden. Die in e-Medikation gespeicherte Verordnung wurde nicht verändert.
Falls fehlerhafte Daten übergeben werden, muss eine Fehlermeldung zurückgeliefert werden mit dem Hinweis auf den Fehler.

### Abgabe mit Verordnungsbezug durchführen
Eine Apotheke bzw. ein hausapothekenführender Arzt möchte ein Rezept für einen ELGA-Teilnehmer einlösen, dessen Verordnungen bereits in der e-Medikation gespeichert wurden. Hierzu müssen zunächst die Verordnungsdaten abgerufen werden und anschließend die Abgaben mit dem entsprechenden Verordnungsbezug gespeichert werden. 
Für die Abfrage der Verordnungen aus der e-Medikation bestehen grundsätzlich 2 Möglichkeiten:
-	Abfrage der Verordnungsdaten mittels eMED-ID 
-	Abfrage der Verordnungsdaten auf Basis einer bestehenden ELGA-Kontaktbestätigung

#### Vorbedingung
-	ELGA-Vorbedingung: GDA ist autorisiert, ELGA Teilnehmer ist identifiziert, eine gültige Kontaktbestätigung/Berechtigung („Ticket“) wurde vom ELGA-Berechtigungssystem ausgestellt.
-	e-Medikation Vorbedingung: Verordnung mit dem Status=OFFEN ist vorhanden

#### Akteure
-	Arzt im niedergelassenen Bereich
-	Apotheke

#### Ablauf
-	Rezept mit Verordnungen abrufen
    
    Üblicherweise wird in einem e-Rezept-Datensatz die korrespondierende eMED-ID gespeichert und liegt daher beim Abruf des e-Rezepts elektronisch als Zusatzinformation                                                                                                     vor. Alternativ kann die eMED-ID durch Scan des Matrix-Codes auf dem e-Rezept-Ausdruck oder durch manuelle Eingabe erfolgen. In diesem Fall ist keine ELGA-Kontaktbestätigung erforderlich. Allerdings ist hierdurch ausschließlich der Zugriff auf die Daten des durch die eMED-ID referenzierten Rezepts möglich und nicht auf andere in der e-Medikation gespeicherte Daten (z.B. komplette e-Medikationsliste des Patienten).
        
        - Abfrage der Verordnungsdaten auf Basis einer bestehenden ELGA-Kontaktbestätigung

    Sämtliche zu einem ELGA-Teilnehmer in der e-Medikation gespeicherten Verordnungsdaten können auf Basis einer bestehenden ELGA-Kontaktbestätigung (z.B. ausgelöst durch Einlesen der e-card) abgerufen werden. 

-	Abgabe in der e-Medikation speichern

    Die Daten aus der Verordnung sind in der Regel vollständig für die Abgabe zu übernehmen. In Sonderfällen (z.B. Austausch eines Medikaments nach Rücksprache mit dem Arzt) können die aus der Verordnung übernommenen Daten geändert werden. 

    Für den Fall, dass bereits erfolgte Abgaben nacherfasst werden sollen (z.B. technische Probleme zum Zeitpunkt der eigentlichen Abgabe), wird als Erfassungsdatum der Zeitpunkt der Nacherfassung gesetzt, während als Abgabedatum das in der Vergangenheit liegende Datum der tatsächlichen Abgabe eingetragen wird

In der Fachlogik gelten folgende Prüfregeln:

-	Damit die Verordnung eingelöst werden kann, muss diese den Status OFFEN haben.
-	Rezepte mit der Rezeptart=Privatrezepte können von mehreren Akteuren eingelöst werden, z.B. verschiedene Apotheken.
-	Rezepte mit der Rezeptart=Kassenrezept und Substitutionsrezept können nur von einem Akteur eingelöst werden. Somit müssen alle Verordnungen zu einem Rezept abgegeben werden. Verordnungen, die nicht abgegeben werden, erhalten den Status NICHT DISPENSIERT
-	Zu Rezepten mit dem Status ABGELAUFEN können keine Abgaben mehr gespeichert werden. Die (nachträgliche) Speicherung von Abgaben zu einem abgelaufenen Rezept kann im Anlassfall allerdings ohne Verordnungsbezug erfolgen (siehe Kapitel xxx).

##### Sonderfälle

###### Austausch
Wird ein Arzneimittel verordnet, welches in der Apotheke nicht vorhanden ist, so kann im Rahmen der gesetzlichen Bestimmungen, der Apotheker bzw. der hausapotheken- führende Arzt ein wirkstoffgleiches Arzneimittel bzw. nach Rücksprache mit dem Arzt ein alternatives Arzneimittel abgeben.
Jedenfalls ist das tatsächlich abgegebene Arzneimittel in e-Medikation zu speichern und der Verordnung/dem Rezept zuzuordnen, um die Zugrundeliegende Verordnung einzulösen.

###### Besorger
Der Prozess des „Besorgers“ (ein Arzneimittel ist nicht lagernd und muss bestellt werden) wird in e-Medikation abgebildet. Das Rezept wird von der Apotheke eingelöst und die Abgabe wird als „Teilabgabe“ gekennzeichnet (siehe Markierung FFP „First Fill, Part Fill“ oder RFP „Refill - Part Fill“). Es wird die Verordnung nicht in den Status „EINGELOEST“ versetzt und es können solange weitere Abgaben dispensiert werden, bis eine Abgabe mit der Markierung RFC „Refill - Complete“ gespeichert wird. Die Kennzeichnung zeigt, dass das Arzneimittel dem Patienten noch nicht ausgehändigt wurde. Die Kennzeichnung zeigt auch, ob alle Packungen einer Verordnung bzw. teilweise Packungen einer Verordnung bestellt werden. Solange eine Abgabe mit der Kennzeichnung „Besorger“ vorhanden ist, muss die Abgabe mit der eMED-ID abrufbar sein.
Der Prozess einer „Teilabgabe“ eines Rezeptes kann mit obiger Logik des „Besorgers“ auch abgebildet werden.

###### OTC
-	Erfolgt die Abgabe eines OTC auf Basis einer Verordnung, wird die Abgabe immer in e-Medikation gespeichert, auch wenn dieses OTC nicht in der ASP-Liste als wechselwirkungsrelevante Arzneispezialität geführt ist.
-	Erfolgt die Abgabe eines OTC ohne Verordnungsbezug (siehe Kapitel „Abgabe ohne Verordnungsbrzug durchführen“), darf die Abgabe nur in e-Medikation gespeichert werden, wenn dieses OTC in der ASP-Liste als wechselwirkungsrelevante Arzneispezialität geführt ist.

##### Ergebnis im Gutfall
Die Verordnung ist eingelöst und die Medikationsabgabe ist gespeichert. Die Verknüpfung von Verordnung und Abgabe ist vorhanden. Teilabgaben sind entsprechend markiert.

##### Ergebnis im Fehlerfall
Im Fehlerfall wird der Vorgang abgebrochen und kann bei Bedarf wiederholt werden. Die in e-Medikation gespeicherte Verordnung wird nicht verändert. 

### Abgabe ohne Verordnungsbezug durchführen

Der Akteur speichert die Arzneimittel in e-Medikation, welche tatsächlich abgegeben werden. Dieser Prozess wird durchgeführt 

-	bei Abgabe von nicht verordneten Arzneimitteln (Abgabe von wechselwirkungsrelevanten OTC )
- wenn ein e-Rezept-Eintrag oder ein Papierrezept vorhanden ist und keine Verordnungen in e-Medikation eingetragen wurden
-	Abgabe eines Arztmusters
-	Nacherfassung von bereits abgegebenen Arzneimitteln (z.B. wenn eine Speicherung zum Zeitpunkt der Abgabe aus technischen Gründen nicht möglich war, bei Arzneimittelbezug aus dem Ausland etc.)

#### Vorbedingung
-	ELGA-Vorbedingung: GDA ist autorisiert, ELGA Teilnehmer ist identifiziert, eine gültige Kontaktbestätigung/Berechtigung („Ticket“) wurde vom ELGA-Berechtigungssystem ausgestellt.
-	e-Medikation Vorbedingung: keine

#### Akteure
-	Arzt im niedergelassenen Bereich
-	Apotheke
-	Krankenanstalt
-	Einrichtung der Pflege

#### Ablauf

Der Akteur erfasst die Medikationsabgabe. Die Prüfungen der Arzneimittel z.B. auf potentielle Wechselwirkungen, Kontraindikationen, Dosierungen etc. erfolgt in der Eigenverantwortung des Akteurs und ist nicht Gegenstand des Informationssystems „e- Medikation“.

Wenn eine Medikationsabgabe (ohne Rezept/Verordnung) in e-Medikation gespeichert wird, dann gilt die Medikationsabgabe als vom Akteur geprüft. Wenn ein e-Rezept-Eintrag oder ein Papierrezept ohne e-Medikations-Verordnung vorhanden ist, dann obliegt es dem abgebenden Akteur diese zu prüfen.

Im Rahmen der Nacherfassung von bereits erfolgten Abgaben wird als Erfassungsdatum der Zeitpunkt der Nacherfassung gesetzt, während als Abgabedatum das in der Vergangenheit liegende Datum der tatsächlichen Abgabe eingetragen wird.

##### Ergebnis im Gutfall
745	Die Medikationsabgabe ist in e-Medikation gespeichert.

##### Ergebnis im Fehlerfall
Im Fehlerfall wird der Vorgang abgebrochen und kann bei Bedarf wiederholt werden.

Falls fehlerhafte Daten übergeben werden, muss eine Fehlermeldung zurückgeliefert werden mit dem Hinweis auf den Fehler.

### Abgabe abrufen

Im Zuge der Behandlung eines ELGA Teilnehmers kann der Akteur die Medikationsabgaben eines ELGA Teilnehmers abrufen.

#### Vorbedingung
-	ELGA-Vorbedingung: GDA ist autorisiert, ELGA Teilnehmer ist identifiziert, eine gültige Kontaktbestätigung/Berechtigung („Ticket“) wurde vom ELGA-Berechtigungssystem ausgestellt.
-	e-Medikation Vorbedingung: Abgaben in den letzten 365 Tagen vorhanden

#### Akteure
-	Arzt im niedergelassenen Bereich
-	Krankenanstalt
-	Apotheke
-	Pflege

#### Ablauf
Der Akteur fragt die Medikationsabgabe des identifizierten ELGA-Teilnehmers ab. Folgende Filterungen/Suchfunktionen können vorgenommen werden:
-	eMED-ID
-	Zeitraum
Stornierte Abgaben können nicht abgerufen werden. Es gibt keine Einschränkung bei der Anzeige der Datenfelder (z.B. abgebender GDA darf angezeigt werden). Es werden alle Datenfelder zu einer Abgabe über die Schnittstelle zur Verfügung gestellt.

##### Ergebnis im Gutfall
Im Gutfall werden dem Akteur die angeforderten Medikationsabgaben als auch zugehörige Korrekturmeldungen zurückgeliefert und stehen zur weiteren Verwendung zur Verfügung.

##### Ergebnis im Fehlerfall
Im Fehlerfall wird der Vorgang abgebrochen und kann bei Bedarf wiederholt werden. 
Falls fehlerhafte Daten übergeben werden, muss eine Fehlermeldung zurückgeliefert werden mit dem Hinweis auf den Fehler.

### Abgabe stornieren

Der Akteur muss die Abgabe stornieren können (z.B. wenn irrtümlich eine Abgabe gespeichert wurde). Das Stornieren der Abgabe ist jederzeit möglich und darf nur vom Ersteller der Abgabe durchgeführt werden.

#### Vorbedingung
-	ELGA-Vorbedingung: GDA ist autorisiert, ELGA Teilnehmer ist identifiziert, eine gültige Kontaktbestätigung/Berechtigung („Ticket“) wurde vom ELGA-Berechtigungssystem ausgestellt.
-	e-Medikation Vorbedingung: Abgabe vorhanden, Status= ABGEGEBEN

#### Akteure
-	Arzt im niedergelassenen Bereich
-	Apotheke
-	Krankenanstalt
-	Pflege

#### Ablauf
Der Akteur wählt die Medikationsabgabe, welche storniert werden soll. Die Stornierung  von Abgaben ist jederzeit möglich. Die Abgabe erhält den Status=STORNIERT und kann nicht mehr abgerufen werden. Handelt es sich bei der Abgabe um eine Medikation mit Verordnungsbezug, dann wechselt der Status der Verordnung auf „OFFEN“oder – falls der Gültigkeitszeitraum des zugrunde liegenden Rezepts überschritten wurde – auf „ABGELAUFEN“

##### Ergebnis im Gutfall

Im Gutfall wird die Stornierung der Medikationsabgabe durchgeführt. Die Abgabe erhält den Status STORNIERT, eine der Abgabe zugrunde liegende Verordnung den Status OFFEN oder ABGELAUFEN.

##### Ergebnis im Fehlerfall
Im Fehlerfall wird der Vorgang abgebrochen und kann bei Bedarf wiederholt werden.
Falls fehlerhafte Daten übergeben werden, muss eine Fehlermeldung zurückgeliefert werden mit dem Hinweis auf den Fehler.

### Abgabe absetzen

Im Patientengespräch erfährt der Akteur, dass eine erfolgte Medikationsabgabe vom ELGA Teilnehmer nicht eingenommen wird. In diesem Fall wurde ein Arzneimittel zwar in der Apotheke abgegeben, es wird bzw. wurde aber nicht mehr (z.B. aufgrund von Unverträglichkeiten) eingenommen. Ein Absetzen einer Medikationsabgabe kann von jedem Akteur (außer ELGA-Teilnehmer selbst) durchgeführt werden.

#### Vorbedingung


-	GDA ist autorisiert, ELGA Teilnehmer ist identifiziert, eine gültige Kontaktbestätigung/Berechtigung („Ticket“) wurde vom ELGA-Berechtigungssystem ausgestellt.
-	e-Medikation Vorbedingung: Abgabe vorhanden, Status= ABGEGEBEN

#### Akteure
-	Arzt im niedergelassenen Bereich
-	Krankenanstalt
-	Apotheke
-	Pflege

#### Ablauf

Eine Abgabe kann mittels einer Korrekturmeldung (=Pharmazeutischen Empfehlung) abgesetzt werden. Der Akteur bestimmt die abzusetzende Medikationsabgabe durch Übergabe der AbgabeID.

Der Akteur muss das Datum der Absetzung angeben. 

Das Datum der Absetzung muss beim Abruf der Medikationsabgaben und bei der Medikationsliste dargestellt werden.
Solange eine Medikationsabgabe abgerufen werden kann, kann die Medikationsabgabe auch abgesetzt werden. Im Zuge einer Absetzung erfolgen keine weiteren Prüfungen.
Das	Absetzen	kann	via	Metadatenupdate	der	entsprechenden	Pharmazeutischen Empfehlung wieder rückgängig gemacht werden.

##### Ergebnis im Gutfall
Im Gutfall wird das Absetzen der Medikationsabgabe durchgeführt und in e-Medikation gespeichert (Status=ABGESETZT). Das Absetzdatum ist in den Abgabedatenfeldern vorhanden.

##### Ergebnis im Fehlerfall
Im Fehlerfall wird der Vorgang abgebrochen und kann bei Bedarf wiederholt werden. Der Status der Abgabe ist „ABGEGEBEN“.
Falls fehlerhafte Daten übergeben werden, muss eine Fehlermeldung zurückgeliefert werden mit dem Hinweis auf den Fehler.

### Abgabe ändern

Der Akteur muss die Daten einer Medikationsabgabe ändern können (z.B. bei Einstellungen der Dosierung eines Arzneimittels). Es dürfen nur definierte Datenfelder geändert werden.

#### Vorbedingung
-	GDA ist autorisiert, ELGA Teilnehmer ist identifiziert, eine gültige Kontaktbestätigung/Berechtigung („Ticket“) wurde vom ELGA-Berechtigungssystem ausgestellt.
-	e-Medikation Vorbedingung: Abgabe vorhanden, Status=ABGEGEBEN

#### Akteure
-	Arzt im niedergelassenen Bereich
-	Krankenanstalt
-	Apotheke

#### Ablauf

Der Akteur bestimmt die zu ändernde Medikationsabgabe durch Übergabe der AbgabeID.Der Akteur kann nur bestimmte Datenfelder einer Medikationsabgabe ändern, nicht aber das Arzneimittel oder die Menge selbst. Folgende Datenfelder können verändert werden:
-	Art der Anwendung
-	Zusatzinformation
-	Alternative Einnahme
-	Ergänzende Information
-	Tagesdosierung
-	Morgen Dosierung
-	Mittags Dosierung
-	Abends Dosierung
-	Nachts Dosierung
-	Tagesangabe
-	Frequenz
-	Therapieart

Die Medikation (z.B. Handelsname) einer Medikationsabgabe kann NICHT geändert werden. Der GDA der Medikationsabgabe bleibt der gleiche und darf nicht durch die Änderung verändert werden.

##### Ergebnis im Gutfall
Im Gutfall wird die Änderung der Medikationsabgabe durchgeführt und in e-Medikation gespeichert.

##### Ergebnis im Fehlerfall
Im Fehlerfall wird der Vorgang abgebrochen und kann bei Bedarf wiederholt werden. Falls fehlerhafte Daten übergeben werden, muss eine Fehlermeldung zurückgeliefert werden mit dem Hinweis auf den Fehler.

### Medikationsliste abrufen

Im Zuge der Behandlung eines ELGA Teilnehmers möchte der Akteur die Medikationsliste des ELGA Teilnehmers abrufen. Die Medikationsliste fasst offene Verordnungen und Abgaben zusammen.

#### Vorbedingung
-	GDA ist autorisiert, ELGA Teilnehmer ist identifiziert, eine gültige Kontaktbestätigung/Berechtigung („Ticket“) wurde vom ELGA-Berechtigungssystem ausgestellt.
-	e-Medikation Vorbedingung: keine

#### Akteure
-	Arzt im niedergelassenen Bereich
-	Krankenanstalt
-	Apotheke
-	Pflege
-	ELGA-Teilnehmer

#### Ablauf
Der Akteur kann die gesamte, konsolidierte Medikationsliste (sortierbare Zusammenfassung über Zulassungsnummer und Abgabe bzw. Verordnungsdatum) abrufen.
Die Medikationsliste wird bei Aufruf serverseitig erstellt und enthält die aktuell gültigen Abgaben bzw. Verordnungen (z.B. bei einer Änderung wird nur die geänderte Dosierung angezeigt).
 

##### Ergebnis im Gutfall
Im Gutfall wird dem Akteur die angeforderte Medikationsliste zurückgeliefert und steht zur weiteren Verwendung zur Verfügung. Sind keine relevanten Verordnungen und Abgaben vorhanden, so wird eine „leere Liste“ retourniert.

##### Ergebnis im Fehlerfall
Im Fehlerfall wird der Vorgang abgebrochen und kann bei Bedarf wiederholt werden. Falls fehlerhafte Daten übergeben werden, muss eine Fehlermeldung zurückgeliefert werden mit dem Hinweis auf den Fehler.

#### Alternativer Ablauf

Bei der Ermittlung der aktuellen Medikation eines Patienten ist die Verwendung der konsolidierten Medikationsliste optional. Alternativ können alle verfügbaren (Quell)Daten der e-Medikation (das sind die Dokumenten- klassen Rezept (Prescription), Abgabe (Dispense), und die entsprechenden Korrektur- meldungen  bzw.  Pharmazeutische  Empfehlungen  (Pharmaceutical  Advice)  separat entsprechend dem im IHE Pharmacy Profil definierten Abfragen („Queries“) abgerufen und in der lokalen Software weiterverarbeitet werden.

Dies hat den Vorteil, dass man auch die Historie der Änderungen sehen kann, welche in der Implementierung der Medikationsliste bereits eingearbeitet sind.