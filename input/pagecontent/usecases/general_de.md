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
