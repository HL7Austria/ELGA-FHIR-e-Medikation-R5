> **For the english version please click [here](usecases_en.html).**

Zum besseren Verständnis des Implementierungsleitfaden „e-Medikation“ sowie dem Zusammenspiel der CDA-Dokumente werden im Folgenden die Anwendungsfälle für die e- Medikation kurz dargestellt.
Folgende Akteure werden in der ELGA-Anwendung e-Medikation (eMEDAT) definiert:
-	Akteure im niedergelassenen Bereich
    -	Arzt
        - Kassenarzt
        - Wahlarzt
        - Facharzt
        - Hausapotheker (Da im GDA-Index jeder GDA nur eine Rolle besitzt und es eine Rolle „Hausapotheker“ nicht gibt, haben  
Hausapotheker dieselbe Rolle wie niedergelassene Ärzte ohne Hausapotheke. Somit hat jeder Arzt auch  
die Funktionalitäten zur Abgabe zur Verfügung.
)
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

Der gegenständliche Implementierungsleitfaden „e-Medikation“ definiert die folgenden CDA- Dokumente: Rezept, Abgabe, Korrekturmeldung (Pharmazeutische Empfehlung) und Medikationsliste. Um den Medikationsprozess und die folgend beschriebenen Anwendungsfälle abbilden zu können, werden diese Dokumente mit den folgenden Status in der e-Medikation abgebildet:
-	Rezept (PRESCRIPTION; Ein Rezept wird durch ein Prescription Dokument abgebildet und kann eine oder mehrere Verordnungen enthalten. Bezüglich der möglichen Statuswerte unterscheiden sich das Prescription Dokument und die einzelnen Verordnungen.)
    - OFFEN
    - EINGELÖST
    - STORNIERT
    - ABGELAUFEN 
-	Verordnung
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

#### Allgemein

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

#### Beschreibung

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

#### Beschreibung
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

