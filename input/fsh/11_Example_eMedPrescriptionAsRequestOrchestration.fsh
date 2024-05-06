Instance: Example-eMedPrescriptionAsRequestOrchestration
InstanceOf: eMedPrescriptionAsRequestOrchestration
Description: "Example of a eMedPrescription as RequestOrchestration with data as similar as possible to https://gitlab.com/elga-gmbh/cda-beispielbefunde/-/blob/master/Basisleitf%C3%A4den_(2.06.2)/ELGA-083-e-Medikation_1-Rezept_mit_Verordnungen1-4%20Dosierungsvarianten%20an%20EINEM%20Tag.xml?ref_type=headshttps://gitlab.com/elga-gmbh/cda-beispielbefunde/-/blob/master/Basisleitf%C3%A4den_(2.06.2)/ELGA-083-e-Medikation_1-Rezept_mit_Verordnungen1-4%20Dosierungsvarianten%20an%20EINEM%20Tag.xml"
Usage: #example
* id = WYE82A2G8EE1
* contained = Example-eMedRequest
* status = #completed
* intent = #order
* code = https://termgit.elga.gv.at/ValueSet/elga-medikationrezeptart#KASSEN "Kassenrezept"
* subject.reference = https://fhir.hl7.at/r5-core-main/Patient-HL7ATCorePatientExample05-FullElga
* authoredOn = "2013-03-24T08:20:15+01:00"
* author.reference = https://fhir.hl7.at/r5-core-main/Practitioner-HL7ATCorePractitionerExample01

Instance: Example-eMedRequest
InstanceOf: eMedRequest
Description: "Example of a eMedRequest as MedicationRequest with data as similar as possible to the first entry/'Verordnung' of https://gitlab.com/elga-gmbh/cda-beispielbefunde/-/blob/master/Basisleitf%C3%A4den_(2.06.2)/ELGA-083-e-Medikation_1-Rezept_mit_Verordnungen1-4%20Dosierungsvarianten%20an%20EINEM%20Tag.xml?ref_type=headshttps://gitlab.com/elga-gmbh/cda-beispielbefunde/-/blob/master/Basisleitf%C3%A4den_(2.06.2)/ELGA-083-e-Medikation_1-Rezept_mit_Verordnungen1-4%20Dosierungsvarianten%20an%20EINEM%20Tag.xml"
Usage: #example
* identifier = WYE82A2G8EEW-4711
* groupIdentifier = WYE82A2G8EE1
* status = #completed
* intent = #order
* medication.concept = $asp-liste#981417 "CIPROXIN FTBL 500MG"
* subject.reference = https://fhir.hl7.at/r5-core-main/Patient-HL7ATCorePatientExample05-FullElga
* requester.reference = https://fhir.hl7.at/r5-core-main/Practitioner-HL7ATCorePractitionerExample01
* note.text = "Dosierung genau einhalten!"
* effectiveDosePeriod.start = "2013-03-24T08:20:15+01:00"
* effectiveDosePeriod.end = "2013-04-07T00:00:00+01:00"
* dosageInstruction[0].patientInstruction = "Alternativ Tablette in Wasser auflösen"
* dosageInstruction[=].timing.repeat.frequency = 2
* dosageInstruction[=].timing.repeat.when = http://hl7.org/fhir/ValueSet/event-timing#MORN "Morning"
* dosageInstruction[+].patientInstruction = "Alternativ Tablette in Wasser auflösen"
* dosageInstruction[=].timing.repeat.frequency = 1
* dosageInstruction[=].timing.repeat.when = http://hl7.org/fhir/ValueSet/event-timing#EVE "Evening"
//* dosageInstruction[=].doseAndRate.type = $dose-rate-type#ordered "Ordered"
//* dosageInstruction[=].doseAndRate.doseQuantity = 1 $DoseForm#100000073665 
* dispenseRequest.numberOfRepeatsAllowed = 0