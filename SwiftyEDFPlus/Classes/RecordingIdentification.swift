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
	
	open class Builder {
		
		var startDate: Date? = nil
		var hospitalAdministrationCode: String? = nil
		var responsibleParty: String? = nil
		var usedEquipment: String? = nil
		var extraFields: [String] = []
		
		public init() {
		}
		
		open func setStartDate(_ date: Date?) -> Builder {
			self.startDate = date
			return self
		}
		
		open func setHospitalAdministrationCode(_ code: String) -> Builder {
			self.hospitalAdministrationCode = code.replacingOccurrences(of: " ", with: RecordingIdentification.SpaceReplacement)
			return self
		}
		
		open func setResponsibleParty(_ party: String) -> Builder {
			self.responsibleParty = party.replacingOccurrences(of: " ", with: RecordingIdentification.SpaceReplacement)
			return self
		}
		
		open func setUsedEquipment(_ equipment: String) -> Builder {
			self.usedEquipment = equipment.replacingOccurrences(of: " ", with: RecordingIdentification.SpaceReplacement)
			return self
		}
		
		open func setExtraField(_ field: String) -> Builder {
			self.extraFields.append(
				field.replacingOccurrences(of: " ", with: RecordingIdentification.SpaceReplacement)
			)
			return self
		}
		
		open func build() -> RecordingIdentification {
			return RecordingIdentification(startDate: startDate, hospitalAdministrationCode: hospitalAdministrationCode, responsibleParty: responsibleParty, usedEquipment: usedEquipment, extraFields: extraFields)
		}
	}
	
	let startDate: Date?
	let hospitalAdministrationCode: String?
	let responsibleParty: String?
	let usedEquipment: String?
	let extraFields: [String]
	
	fileprivate init(startDate: Date?, hospitalAdministrationCode: String?, responsibleParty: String?, usedEquipment: String?, extraFields: [String] = []) {
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
			.joined(separator: RecordingIdentification.FieldSeparator)
	}
}
