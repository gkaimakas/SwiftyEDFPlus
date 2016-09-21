//
//  PatientIdentification.swift
//  Pods
//
//  Created by Γιώργος Καϊμακάς on 10/06/16.
//
//

import Foundation

public struct PatientIdentification {
	public static let FieldSeparator = " "
	public static let OmittedField = "X"
	public static let SpaceReplacement = "_"
	
	open class Builder {
		var code: String? = nil
		var sex: Sex? = nil
		var birthdate: Date? = nil
		var name: String? = nil
		var extraFields: [String] = []

		public init() {
		}

		open func setCode(_ code: String) -> Builder {
			self.code = code.replacingOccurrences(of: " ", with: PatientIdentification.SpaceReplacement)
			return self
		}

		open func setSex(_ sex: Sex) -> Builder {
			self.sex = sex
			return self
		}

		open func setBirthDate(_ birthdate: Date?) -> Builder {
			var builder = self
			self.birthdate = birthdate
			return self
		}

		open func setName(_ name: String) -> Builder {
			self.name = name.replacingOccurrences(of: " ", with: PatientIdentification.SpaceReplacement)
			return self
		}

		open func setExtraField(_ field: String) -> Builder {
			extraFields.append(
				field.replacingOccurrences(of: " ", with: PatientIdentification.SpaceReplacement)
			)
			return self
		}

		open func build() -> PatientIdentification {
			return PatientIdentification(code: code, sex: sex, birthdate: birthdate, name: name)
		}
	}

	let code: String?
	let sex: Sex?
	let birthdate: Date?
	let name: String?
	let extraFields: [String]

	fileprivate init(code: String?, sex: Sex?, birthdate: Date?, name: String?, extraFields: [String] = []) {
		self.code = code
		self.sex = sex
		self.birthdate = birthdate
		self.name = name
		self.extraFields = extraFields
	}

	public var string: String {
		var codeString = PatientIdentification.OmittedField
		if let code = code {
			codeString = code
		}

		var sexString: String = PatientIdentification.OmittedField
		if let sex = sex {
			sexString = sex.rawValue
		}

		var birthdateString: String = PatientIdentification.OmittedField
		if let birthdate = birthdate {
			birthdateString = birthdate.string
		}

		var nameString: String = PatientIdentification.OmittedField
		if let name = name {
			nameString = name
		}

		let params = [codeString, sexString, birthdateString, nameString] + extraFields
		return params
			.joined(separator: PatientIdentification.FieldSeparator)

	}
}
