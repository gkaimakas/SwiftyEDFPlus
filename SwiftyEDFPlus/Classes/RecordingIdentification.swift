//
//  RecordingIdentification.swift
//  Pods
//
//  Created by Γιώργος Καϊμακάς on 10/06/16.
//
//

import Foundation

public struct RecordingIdentification {
	public static let FieldSeparator = " "
	public static let OmittedField = "X"
	public static let SpaceReplacement = "_"
	public static let Prefix = "Startdate"
	
	public class Builder {
		
		var startDate: Date? = nil
		var hospitalAdministrationCode: String? = nil
		var responsibleParty: String? = nil
		var usedEquipment: String? = nil
		var extraFields: [String] = []
		
		public init() {
		}
		
		public func setStartDate(date: Date?) -> Builder {
			self.startDate = date
			return self
		}
		
		public func setHospitalAdministrationCode(code: String) -> Builder {
			self.hospitalAdministrationCode = code.stringByReplacingOccurrencesOfString(" ", withString: RecordingIdentification.SpaceReplacement)
			return self
		}
		
		public func setResponsibleParty(party: String) -> Builder {
			self.responsibleParty = party.stringByReplacingOccurrencesOfString(" ", withString: RecordingIdentification.SpaceReplacement)
			return self
		}
		
		public func setUsedEquipment(equipment: String) -> Builder {
			self.usedEquipment = equipment.stringByReplacingOccurrencesOfString(" ", withString: RecordingIdentification.SpaceReplacement)
			return self
		}
		
		public func setExtraField(field: String) -> Builder {
			self.extraFields.append(
				field.stringByReplacingOccurrencesOfString(" ", withString: RecordingIdentification.SpaceReplacement)
			)
			return self
		}
		
		public func build() -> RecordingIdentification {
			return RecordingIdentification(startDate: startDate, hospitalAdministrationCode: hospitalAdministrationCode, responsibleParty: responsibleParty, usedEquipment: usedEquipment, extraFields: extraFields)
		}
	}
	
	let startDate: Date?
	let hospitalAdministrationCode: String?
	let responsibleParty: String?
	let usedEquipment: String?
	let extraFields: [String]
	
	private init(startDate: Date?, hospitalAdministrationCode: String?, responsibleParty: String?, usedEquipment: String?, extraFields: [String] = []) {
		self.startDate = startDate
		self.hospitalAdministrationCode = hospitalAdministrationCode
		self.responsibleParty = responsibleParty
		self.usedEquipment = usedEquipment
		self.extraFields = extraFields
	}
	
	public var string: String {
		var startDateString = RecordingIdentification.OmittedField
		if let startDate = startDate {
			startDateString = startDate.string
		}
		
		var hospitalAdministrationCodeString = RecordingIdentification.OmittedField
		if let hospitalAdministrationCode = hospitalAdministrationCode {
			hospitalAdministrationCodeString = hospitalAdministrationCode
		}
		
		var responsiblePartyString = RecordingIdentification.OmittedField
		if let responsibleParty = responsibleParty {
			responsiblePartyString = responsibleParty
		}
		
		var usedEquipmentString = RecordingIdentification.OmittedField
		if let usedEquipment = usedEquipment {
			usedEquipmentString = usedEquipment
		}
		
		let params = [RecordingIdentification.Prefix,
		              startDateString,
		              hospitalAdministrationCodeString,
		              responsiblePartyString,
		              usedEquipmentString
		              ] + extraFields
		
		return params
			.joinWithSeparator(RecordingIdentification.FieldSeparator)
	}
}
