  <div xmlns="http://www.w3.org/1999/xhtml" class="container"> 
   Zum besseren Verständnis des Implementierungsleitfaden „e-Medikation“ werden im Folgenden die Anwendungsfälle kurz dargestellt.
    <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#allgemein">Allgemein</a></li>
        <li><a data-toggle="tab" href="#pres_create">Verordnung(en) mit Rezept anlegen</a></li>
        <li><a data-toggle="tab" href="#pres_read">Rezept mit Verordnung(en) abrufen</a></li>
    </ul>
    <div class="tab-content">
        <div id="allgemein" class="tab-pane fade in active">
            <h3 id="allgemein"></h3>
            <h4 id="akteure">Akteure</h4>

<p>Folgende Akteure werden in der ELGA-Anwendung e-Medikation (eMEDAT) definiert:</p>
<ul>
<li>Akteure im niedergelassenen Bereich<ul>
<li>Arzt<ul>
<li>Kassenarzt</li>
<li>Wahlarzt</li>
<li>Facharzt</li>
<li>Hausapotheker (Da im GDA-Index jeder GDA nur eine Rolle besitzt und es eine Rolle „Hausapotheker“ nicht gibt, haben Hausapotheker dieselbe Rolle wie niedergelassene Ärzte ohne Hausapotheke. Somit hat jeder Arzt auch die Funktionalitäten zur Abgabe zur Verfügung.)</li>
<li>etc.</li>
</ul>
</li>
<li>Arztpraxisassistent</li>
</ul>
</li>
<li>Krankenanstalt<ul>
<li>In der e-Medikation erfolgt keine Unterscheidung in stationären und ambulanten Bereich.</li>
</ul>
</li>
<li>Akteure in der Apotheke<ul>
<li>Pharmazeut/In</li>
<li>Pharmazeutisch-kaufmännisch(er/e) AssistentIn</li>
</ul>
</li>
<li>Einrichtung der Pflege<ul>
<li>Die Umsetzung der Berechtigungen (z.B. darf nur ein Arzt eine Verordnung in e- Medikation speichern), obliegt der GDA-Software.</li>
<li>Pflegeperson (siehe Vertreter, Vollmachtnehmer)</li>
</ul>
</li>
<li>ELGA-Teilnehmer<ul>
<li>Vertreter <ul>
<li>Ombudsstelle</li>
<li>Vollmachtnehmer</li>
<li>gesetzlicher Vertreter</li>
<li>etc.</li>
</ul>
</li>
</ul>
</li>
</ul>
<h4 id="dokumententypen">Dokumententypen</h4>
<p>Der gegenständliche Implementierungsleitfaden „e-Medikation“ definiert die folgenden CDA- Dokumente: Rezept, Abgabe, Korrekturmeldung (Pharmazeutische Empfehlung) und Medikationsliste. Um den Medikationsprozess und die folgend beschriebenen Anwendungsfälle abbilden zu können, werden diese Dokumente mit den folgenden Status in der e-Medikation abgebildet:</p>
<ul>
<li>Rezept (PRESCRIPTION; Ein Rezept wird durch ein Prescription Dokument abgebildet und kann eine oder mehrere Verordnungen enthalten. Bezüglich der möglichen Statuswerte unterscheiden sich das Prescription Dokument und die einzelnen Verordnungen.)<ul>
<li>OFFEN</li>
<li>EINGELÖST</li>
<li>STORNIERT</li>
<li>ABGELAUFEN </li>
</ul>
</li>
<li>Verordnung<ul>
<li>OFFEN</li>
<li>EINGELOEST</li>
<li>STORNIERT</li>
<li>NICHT_DISPENSIERT</li>
</ul>
</li>
<li>Abgabe (DISPENSE)<ul>
<li>ABGEGEBEN</li>
<li>ABGESETZT (Korrekturmeldung vorhanden)</li>
<li>STORNIERT (deprecated)</li>
</ul>
</li>
<li>Korrekturmeldung (Pharmazeutische Empfehlung, Pharmaceutical Advice)<ul>
<li>GÜLTIG</li>
<li>STORNIERT (deprecated)</li>
</ul>
</li>
<li>Medikationsliste<ul>
<li>GÜLTIG</li>
<li>ERSETZT (deprecated)</li>
</ul>
</li>
</ul>

        </div>
        <div id="pres_create" class="tab-pane fade">
        
<h3 id="pres_create"></h3>
<p>Im Zuge der Behandlung stellt der Arzt fest, dass dem ELGA Teilnehmer ein oder mehrere Arzneimittel verordnet werden müssen. Eine Verordnung besteht immer nur aus genau einer Medikation (= ein Arzneimittel). Das Rezept kann aus mehreren Verordnungen bestehen und bildet somit die Klammer über die Verordnungen. Das Rezept mit den Verordnungen wird mit einer eindeutigen eMED-ID versehen.
Die Prüfungen der Arzneimittel z.B. auf potentielle Wechselwirkungen, Kontraindikationen, Dosierungen, etc. erfolgt in der Eigenverantwortung des Arztes und ist nicht Gegenstand der e-Medikation.
Eine Speicherung von Verordnungen ohne Zuordnung eines Rezeptes ist nicht gültig. Die Verordnung wird als geprüft angesehen, wenn die zugeordnete Verordnung in e-Medikation gespeichert ist.</p>
<h4 id="vorbedingung">Vorbedingung</h4>
<ul>
<li>ELGA-Vorbedingung: GDA ist autorisiert, ELGA Teilnehmer ist identifiziert, eine gültige Kontaktbestätigung/ Berechtigung („Ticket“) wurde vom ELGA-Berechtigungssystem ausgestellt.</li>
<li>e-Medikation Vorbedingung: keine</li>
</ul>
<h4 id="akteure">Akteure</h4>
<ul>
<li>Arzt im niedergelassenen Bereich</li>
<li>Krankenanstalt</li>
<li>Einrichtung der Pflege</li>
</ul>
<h4 id="ablauf">Ablauf</h4>
<p>Die Erfassung eines Rezepts mit Verordnung stellt folgende Prozessschritte in der GDA- Software dar:</p>
<ul>
<li>Arzneimittel auswählen: Der Arzt wählt eine oder mehrere Arzneimittelspezialitäten aus einem Katalog („ASP-Liste“, die Liste der humanen Arzneispezialitäten gelistet nach PZN) aus, wobei Handelsname, Pharmazentralnummer (PZN) sowie andere Daten zur Beschreibung des Arzneimittels (Stärke, Darreichungsform, Packungsgröße, Zulassungsnummer etc.) automatisch aus einem Katalog6 mit allen ELGA-relevanten Arzneimittelspezialitäten übernommen werden können.</li>
<li>eMED-ID anfordern: Die Vergabe der eindeutigen eMED-ID erfolgt zentral durch die Serverkomponente e-Medikation und kann über eine entsprechende Schnittstelle angefordert werden.</li>
<li>Arzneimittel ausnehmen: Arzneimittel können von der Speicherung in e-Medikation ausgenommen werden (funktionale Anforderung an die GDA-Software, siehe ELGA Usability-Styleguide &amp; Situatives Opt-Out [2],[3],[4])</li>
<li>Rezept mit Verordnung in e-Medikation speichern: Prüfung der Eingabedaten</li>
<li>Rezept drucken (Anforderung an die GDA-Software, kein Teil in der e-Medikation). Die eMED-ID soll, sofern technisch möglich, sowohl als Klartext als auch als maschinenlesbarer Code (2D-Matrix-Code) auf dem e-Rezept-Ausdruck bzw. einem Papierrezept aufgedruckt werden (§18 Abs. 4 Z. 4 GTelG 2012) um die Versorgungskontinuität (verbesserte Arbeitsabläufe) als auch die anwenderfreundlichen Umsetzung der e-Medikation zu unterstützen.</li>
</ul>
<p>Der Arzt kann pro „Patientenkontakt“ (Besuch) mehrere Rezepte mit Verordnungen in e- Medikation speichern; Rezepte können jedoch nur einzeln übermittelt werden. Das Rezept mit den Verordnungen ist sofort nach Speicherung in e-Medikation gültig.</p>
<blockquote>
<p>Der aktuelle Katalog „Liste der humanen Arzneispezialitäten gelistet nach PZN“ (ASP-Liste) wird von der AGES, der Österreichischen Agentur für Ernährungssicherheit bereitgestellt und kann über den Terminologieserver frei bezogen werden: <a href="https://termgit.elga.gv.at/">https://termgit.elga.gv.at/</a></p>
</blockquote>
<h5 id="anmerkungen-zu-den-datenfeldern-">Anmerkungen zu den Datenfeldern:</h5>
<p>Das Rezept wird durch eine Rezeptart gekennzeichnet, um die Gültigkeitsdauer prüfen zu können. In e-Medikation werden folgende Rezeptarten berücksichtigt:</p>
<ul>
<li>Kassenrezept – 1 Monat gültig; eine Einlösung möglich; im Zuge des „Besorgerprozesses“ wird bei einer gespeicherten Teilabgabe die gesamte Gültigkeitsdauer auf 3 Monate verlängert
Es ist nicht möglich, zusätzliche Einlösungen anzugeben.</li>
<li>Privatrezept - 1 Monat gültig<ul>
<li>Die Gültigkeitsdauer von 1 Monat bezieht sich auf die erste Einlösung. Der Akteur kann eine erweiterte Gültigkeitsdauer mit maximal einem Jahr festlegen.</li>
<li>bis zu 365 Tage bzw. bis zu 6 Einlösungen, wobei Gültigkeitsdauer und Anzahl der möglichen Einlösungen vom Arzt definiert werden können.  Dabei muss das Privatrezept innerhalb des ersten Monats erstmalig eingelöst werden (§ 4 Abs. 1 RezeptpflichtG).</li>
</ul>
</li>
<li>Substitutionsrezept – Maximale Gültigkeitsdauer von 24 Monaten. Das GültigVon Datum darf maximal einen Monat in der Zukunft liegen. 
Es ist nicht möglich, zusätzliche Einlösungen anzugeben. </li>
</ul>
<p>Die Gültigkeitsdauer je Rezeptart folgt den rechtlichen Vorgaben. Es wird daher der Ausstellungstag in die Berechnung der Einlösefrist nicht mit eingerechnet. Die Gültigkeiten von Rezepten und somit die Verfügbarkeit in e-Medikation ergeben sich folgendermaßen:</p>
<ul>
<li>Wenn ein Rezept mit den Verordnungen in e-Medikation gespeichert ist, dann erhält das
Rezept/Verordnung den Status OFFEN.</li>
<li>Ein Kassenrezept muss innerhalb von 1 Monat eingelöst werden, sonst erhält das Rezept den Status ABGELAUFEN.</li>
<li>Ein Privatrezept muss innerhalb von 1 Monat eingelöst werden, sonst erhält es den Status ABGELAUFEN.</li>
<li>Ein Substitutionsrezept ist im Status ABGELAUFEN, wenn das „bis Datum“ erreicht ist.</li>
<li>Die Anzahl der Einlösungen bei Privatrezepten, gibt an wie viele Einlösungen auf ein Rezept durchgeführt werden dürfen bis die Verordnung auf dem Rezept und das Rezept
den Status=EINGELÖST erhält. Anzahl der Einlösungen bezieht sich immer auf ein
Rezept. Solange die Anzahl der Einlösungen (Abgaben) nicht erreicht wurde, hat die
Verordnung und Rezept den Status=OFFEN.</li>
<li>Die Rezeptart beeinflusst die Regeln, die bei der Einlösung der Verordnung zur Anwendung kommen. ist für die Regeln der Einlösung notwendig. Siehe dazu Use Cases „Abgabe mittels eMED-ID durchführen“ und „Abgabe über e-card durchführen“. 
Es können nur Arzneimittel verordnet werden, die in der Liste der Arzneimittelspezialitäten
(„ASP-Liste“) vorkommen und als gültig vermerkt sind (ELGA_Gültigkeit = true). Ohne
Verordnungsbezug kann nur die Abgabe jener OTC-Präparate in der e-Medikation gespeichert werden, die auch wechselwirkungsrelevant (ELGA_MedikationWechselwirkungsRelevant = true) sind.</li>
<li>Bei Kassen- und Substitutionsrezepten müssen alle Verordnungen mit einer Abgabe oder Leerabgabe referenziert werden. </li>
</ul>
<h5 id="ergebnis-im-gutfall">Ergebnis im Gutfall</h5>
<p>Die am Rezept angegebenen Verordnungen sind im Status OFFEN in e-Medikation gespeichert. Die zuvor vom Server erstellte eMED-ID wurde für die Dokumentenerstellung verwendet und dem e-Rezept Service als Parameter übergeben.</p>
<h5 id="ergebnis-im-fehlerfall">Ergebnis im Fehlerfall</h5>
<p>Im Fehlerfall wird der Vorgang abgebrochen und kann bei Bedarf wiederholt werden. Falls fehlerhafte Daten übergeben werden, muss eine Fehlermeldung zurückgeliefert werden mit dem Hinweis auf den Fehler.
Es können die folgenden Fehlerfälle aus der Schnittstelle zur e-Medikation heraus auftreten:</p>
<ul>
<li>Speichern der Verordnung in e-Medikation nicht möglich</li>
<li>eMED-ID nicht ermittelbar</li>
</ul>
<p>Hinweis: Die Ausstellung eines e-Rezepts bzw. eines Papierrezepts darf durch eine etwaiges „Nicht-funktionieren“ der e-Medikation nicht verhindert werden.</p>


        </div>
        <div id="pres_read" class="tab-pane fade">
            {% include usecase_3_pres_read_de.md %}
        </div>
    </div>
</div>