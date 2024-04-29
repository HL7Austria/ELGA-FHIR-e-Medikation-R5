Profile: eMedRequest
Parent: MedicationRequest
Id: eMed-requests
Title: "2 ELGA e-Medication MedicationRequests (eMedRequest)"
Description: "**Description:** In the course of treatment, the doctor determines that the ELGA participant must be prescribed one or more medicines. A MedicationRequest always consists of exactly one medication (= one medicine). The e-Medication prescription can consist of several MedicationRequests and thus forms a grouping over them. The prescription and it's MedicationRequests are labelled with one unique, common eMED ID. The doctor is responsible for checking the medicines, e.g. for potential interactions, contraindications, dosages, etc. and this is not part of e-Medication. Storing requests without assigning a prescription is not valid. The prescription is considered to have been checked if the associated prescription is saved in e-Medication.

**Beschreibung:** Im Zuge der Behandlung stellt der Arzt fest, dass dem ELGA Teilnehmer ein oder mehrere Arzneimittel verordnet werden müssen. Eine Verordnung besteht immer nur aus genau einer Medikation (= ein Arzneimittel). Das Rezept kann aus mehreren Verordnungen/MedicationRequests bestehen und bildet somit die Klammer über die Verordnungen/MedicationRequests. Das Rezept und seine Verordnungen/MedicationRequests werden mit einer eindeutigen, gemeinsamen eMED-ID versehen. Die Prüfungen der Arzneimittel z.B. auf potentielle Wechselwirkungen, Kontraindikationen, Dosierungen, etc. erfolgt in der Eigenverantwortung des Arztes und ist nicht Gegenstand der e-Medikation. Eine Speicherung von Verordnungen/MedicationRequests ohne Zuordnung eines Rezeptes ist nicht gültig. Die Verordnung/MedicationRequest wird als geprüft angesehen, wenn die zugeordnete Verordnung in e-Medikation gespeichert ist."

* priorPrescription ^short = "In case of a modification, takes a reference to the MedicationRequests that has been replaced. | Im Falle einer Änderung wird ein Verweis auf die ersetzte Verordnungen/MedicationRequests aufgenommen."

* groupIdentifier 1..1
* groupIdentifier ^short = "eMed-ID" //austria specific

* status = #completed 
* status ^short = "For CDA compatability: always completed, even if the prescription is still be acted upon. | Für CDA-Kompatibilität: immer abgeschlossen, auch wenn das Rezept noch bearbeitet werden muss."

* intent = #order
* intent ^short = "	The prescription represents a request/demand and authorization for action by the requestor. | Das Rezept stellt eine Anfrage/Anforderung und Ermächtigung zum Handeln durch den Antragsteller dar."

//* medication only CodeableReference(eMedMedications) // ToDo check why the linca guys did this 
* medication from $asp-liste 
* medication ^short = "Medication in conformance with the ELGA e-Medication used PZN (i.e. ASP-Liste). | Arzneimittel entsprechend der ELGA e-Medikation verwendet PZN (d.h. ASP-Liste)."

* subject only Reference(HL7ATCorePatient)
* subject ^short = "Each MedicationRequest is associated with one HL7 Austria patient. | Jede Verordnung/MedicationRequest ist einem HL7 AustriaPatient zugewiesen."

//* basedOn 0..1
//* basedOn only Reference(LINCAProposalMedicationRequest)   
//* basedOn ^short = "Proposal item this prescription is based on. Leave empty for ad-hoc prescriptions, or if an existing prescription is to be corrected by this item (in this case, use the priorPrescription attribute)"

* performer 1..1
* performer only Reference(Practitioner) 
* performer ^short = "ToDo create austrian practitioner with hl7 austria. || The authorizing practitioner for this prescription, identified by their OID according to GDA Index. | Der approbierende Arzt für diese Verschreibung, identifiziert durch seine OID gemäß GDA-Index."

//* supportingInformation ^short = "First Element is reserved for reference to origin (LINCARequestOrchestration) assigned on LinkedCare Platform. Used to link instantiated proposal items back to the proposal header (LINCARequestOrchestration)."

* dosageInstruction.doseAndRate.doseQuantity.code from $DoseForm
* dosageInstruction.doseAndRate.doseQuantity.code ^short = "ToDo look into last LINCA solution for doseQuantitiy"