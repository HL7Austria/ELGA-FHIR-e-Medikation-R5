h2 {
   counter-set: count2 3;
}
<p>Im Zuge der Abgabe eines Arzneimittels in einer Apotheke (nach Identifikation mittels e-card) kann der Akteur die Rezepte samt Verordnungen zu einem ELGA Teilnehmer abrufen. Alternativ zur Identifikation mit e-card kann mittels eMED-ID ein Rezept abgerufen werden</p>
<h4 id="vorbedingung">Vorbedingung</h4>
<ul>
<li>ELGA-Vorbedingung: GDA ist autorisiert, ELGA Teilnehmer ist identifiziert, eine gültige Kontaktbestätigung/ Berechtigung wurde vom ELGA-Berechtigungssystem ausgestellt.</li>
<li>e-Medikation Vorbedingung: Verordnungen vorhanden</li>
</ul>
<h4 id="akteure">Akteure</h4>
<ul>
<li>Arzt im niedergelassenen Bereich</li>
<li>Krankenanstalt</li>
<li>Apotheke</li>
<li>Einrichtung der Pflege</li>
</ul>
<h4 id="ablauf">Ablauf</h4>
<p>Der Akteur kann die Verordnungen des ELGA-Teilnehmers  abfragen. Es stehen grundsätzlich zwei Suchvarianten zur Verfügung </p>
<ul>
<li>Alle Verordnungen von noch nicht eingelösten und noch nicht abgelaufenen Rezepten. 
(findPrescriptionsForDispense) </li>
<li>Alle Verordnungen in einem bestimmten Zeitraum (findPrescriptions)</li>
</ul>
<p>Für diese beiden Abfragen gibt es zwei mögliche „Startpunkte“:</p>
<ul>
<li>Startpunkt 1: Suche mit eMED-ID Assertion
Suche ohne einem Patientenkontakt im ELGA BeS, auf Basis der eMED-ID Assertion, welche aufgrund der Angabe einer eMED-ID ausgestellt wurde. Mit dieser Assertion können ausschließlich Dokumente gefunden werden, die mit der betreffenden eMED-ID zusammenhängen (Rezept und zugehörige Abgaben, bzw. Pharmaceutical Advices).</li>
<li>Startpunkt 2: Suche mit Patientenkontakt
Bei der Suche nach Rezepten mit einem Patientenkontakt im ELGA BeS (z.B. auf Basis der gesteckten e-card), können alle Rezepte des ELGA-Teilnehmers gesucht werden.</li>
</ul>
<p>Es gibt keine Einschränkung bei der Anzeige der Datenfelder (z.B. ausstellender GDA darf angezeigt werden). Es werden über die Schnittstelle alle verfügbaren Datenfelder zu einer Verordnung/Rezept geliefert (lt. Datenmodell).</p>
<h5 id="ergebnis-im-gutfall">Ergebnis im Gutfall</h5>
<p>Im Gutfall werden dem Akteur die angeforderten Rezepte/ Verordnungen sowie die dazugehörigen Korrekturmeldungen („Pharmazeutischen Empfehlungen“) zurückgeliefert und stehen zur weiteren Verwendung zur Verfügung.</p>
<h5 id="ergebnis-im-fehlerfall">Ergebnis im Fehlerfall</h5>
<p>Im Fehlerfall wird der Vorgang abgebrochen und kann bei Bedarf wiederholt werden. 
Falls fehlerhafte Daten übergeben werden, muss eine Fehlermeldung zurückgeliefert werden mit dem Hinweis auf den Fehler.</p>
