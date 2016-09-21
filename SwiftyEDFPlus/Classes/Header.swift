//
//  Header.swift
//  Pods
//
//  Created by Γιώργος Καϊμακάς on 12/06/16.
//
//

import Foundation

open class Header {
	open class Builder {
		var version: EDFVersion = EDFVersion.Version0
		var localPatientIdentification: PatientIdentification? = nil
		var localRecordingIdentification: RecordingIdentification? = nil
		var startDate: StartDate? = nil
		var startTime: StartTime? = nil
		
		public init() {
			
		}
		
		open func setVersion(_ version: EDFVersion) -> Builder {
			self.version = version
			return self
		}
		
		open func setLocalPatientIdentification(_ identification: PatientIdentification) -> Builder {
			self.localPatientIdentification = identification
			return self
		}
		
		open func setLocalRecordingIdentification(_ identification: RecordingIdentification) -> Builder {
			self.localRecordingIdentification = identification
			return self
		}
		
		open func setStartDate(_ date: StartDate) -> Builder {
			self.startDate = date
			return self
		}
		
		open func setStartTime(_ time: StartTime) -> Builder {
			self.startTime = time
			return self
		}
		
		open func build() throws -> Header {
			guard let localPatientIdentification = localPatientIdentification else {
				throw Errors.LocalPatientIdentificationError
			}
			
			guard let localRecordingIdentification = localRecordingIdentification else {
				throw Errors.LocalRecordingIdentificationError
			}
			
			guard let startDate = startDate else {
				throw Errors.StartDateError
			}
			
			guard let startTime = startTime else {
				throw Errors.StartTimeError
			}
			
			return Header(version: version, localPatientIdentification: localPatientIdentification, localRecordingIdentification: localRecordingIdentification, startDate: startDate, startTime: startTime)
		}
	}
	
	let version: EDFVersion
	let localPatientIdentification: PatientIdentification
	let localRecordingIdentification: RecordingIdentification
	let startDate: StartDate
	let startTime: StartTime
	
	fileprivate init(version: EDFVersion, localPatientIdentification: PatientIdentification, localRecordingIdentification: RecordingIdentification, startDate: StartDate, startTime: StartTime) {
		self.version = version
		self.localPatientIdentification = localPatientIdentification
		self.localRecordingIdentification = localRecordingIdentification
		self.startTime = startTime
		self.startDate = startDate
	}
}
