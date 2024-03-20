h2 {
   counter-set: count2 1;
}
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