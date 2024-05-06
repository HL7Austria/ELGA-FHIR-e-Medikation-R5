Profile: eMedPrescriptionAsRequestOrchestration
Parent: RequestOrchestration
Id: eMed-prescription-with-multiple-eMed-requests
Title: "1 ELGA e-Medication Prescription with multiple MedicationRequests (eMedPrescriptionAsRequestOrchestration)"
Description: "**Description:** In the course of treatment, the doctor determines that the ELGA participant must be prescribed one or more medicines. A MedicationRequest always consists of exactly one medication (= one medicine). The e-Medication prescription can consist of several MedicationRequests and thus forms a grouping over them. The prescription and it's MedicationRequests are labelled with one unique, common eMED ID. The doctor is responsible for checking the medicines, e.g. for potential interactions, contraindications, dosages, etc. and this is not part of e-Medication. Storing requests without assigning a prescription is not valid. The prescription is considered to have been checked if the associated prescription is saved in e-Medication.

**Beschreibung:** Im Zuge der Behandlung stellt der Arzt fest, dass dem ELGA Teilnehmer ein oder mehrere Arzneimittel verordnet werden müssen. Eine Verordnung besteht immer nur aus genau einer Medikation (= ein Arzneimittel). Das Rezept kann aus mehreren Verordnungen/MedicationRequests bestehen und bildet somit die Klammer über die Verordnungen/MedicationRequests. Das Rezept und seine Verordnungen/MedicationRequests werden mit einer eindeutigen, gemeinsamen eMED-ID versehen. Die Prüfungen der Arzneimittel z.B. auf potentielle Wechselwirkungen, Kontraindikationen, Dosierungen, etc. erfolgt in der Eigenverantwortung des Arztes und ist nicht Gegenstand der e-Medikation. Eine Speicherung von Verordnungen/MedicationRequests ohne Zuordnung eines Rezeptes ist nicht gültig. Die Verordnung/MedicationRequest wird als geprüft angesehen, wenn die zugeordnete Verordnung in e-Medikation gespeichert ist."

* id 1..1
* id ^short = "eMED-ID" //austria specific

* contained 1..*
* contained ^short = "one or several MedicationRequests | eine oder mehrere Verordnungen/MedicationRequests"
* contained only eMedRequest

* status = #completed 
* status ^short = "For CDA compatability: always completed, even if the prescription is still be acted upon. | Für CDA-Kompatibilität: immer abgeschlossen, auch wenn das Rezept noch bearbeitet werden muss."

* intent = #order
* intent ^short = "	The prescription represents a request/demand and authorization for action by the requestor. | Das Rezept stellt eine Anfrage/Anforderung und Ermächtigung zum Handeln durch den Antragsteller dar."

* code 1..1
* code from $medRezArt (required) 
* code ^short = "Prescription type, default 'Kassen', still must be stated | Rezeptart, standardmäßig „Kassen“, muss jedoch angegeben werden"

* subject 1..1
* subject only Reference(HL7ATCorePatient)
* subject ^short = "Associated HL7 Austria patient. | Zugewiesener HL7 AustriaPatient"

* authoredOn 1..1
* authoredOn ^short = "When the prescription was authored | Wann das Rezept verfasst wurde"

* author 1..1
* author only Reference(Practitioner) //austria specific, austrianOrganization and so on?
* author ^short = "Creator of the proposal | Ersteller des Rezepts"