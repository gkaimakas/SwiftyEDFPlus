//
//  Errors.swift
//  Pods
//
//  Created by Γιώργος Καϊμακάς on 12/06/16.
//
//

import Foundation

class Errors {
	static let Domain = "com.gkaimakas.SwiftyEDFPlus"
	
	static let CodeLocalPatientIdentificationNotSet = 1000
	static let CodeLocalRecordingIdentificationNotSet = 1001
	static let CodeStartDateNotSet = 1002
	static let CodeStartTimeNotSet = 1003
	
	static var LocalPatientIdentificationError: NSError {
		return NSError(domain: Errors.Domain, code: Errors.CodeLocalPatientIdentificationNotSet, userInfo: [
			NSLocalizedDescriptionKey: "LocalPatientIdentificatio not set"
			])
	}
	
	static var LocalRecordingIdentificationError: NSError {
		return NSError(domain: Errors.Domain, code: Errors.CodeLocalRecordingIdentificationNotSet, userInfo: [
			NSLocalizedDescriptionKey: "LocalRecordingIdentification not set"
			])
	}
	
	static var StartDateError: NSError {
		return NSError(domain: Errors.Domain, code: Errors.CodeStartDateNotSet, userInfo: [
			NSLocalizedDescriptionKey: "StartDate not set"
			])
	}
	
	static var StartTimeError: NSError {
		return NSError(domain: Errors.Domain, code: Errors.CodeStartTimeNotSet, userInfo: [
			NSLocalizedDescriptionKey: "StartTime not set"
			])
	}
}
