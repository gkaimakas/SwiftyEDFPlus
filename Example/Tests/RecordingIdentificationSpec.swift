//
//  RecordingIdentificationSpec.swift
//  SwiftyEDF
//
//  Created by Γιώργος Καϊμακάς on 10/06/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//


import Quick
import Nimble
import SwiftyEDFPlus

class RecordingIdentificationSpec: QuickSpec {
	override func spec() {
		
		describe("Builder") {
			it("should create a RecordingIdentification object") {
				let identification = RecordingIdentification.Builder()
					.setStartDate(Date(day: 29, month: .March, year: 1994))
					.setHospitalAdministrationCode("Some Hospital")
					.setResponsibleParty("John Appleseed")
					.setUsedEquipment("defibrilator")
					.build()
				
				expect(identification.string) == "Startdate 29-MAR-1994 Some_Hospital John_Appleseed defibrilator"
			}
			
			it("should create a RecordingIdentification object with omitted fields") {
				let identification = RecordingIdentification.Builder()
					.setStartDate(Date(day: 29, month: .March, year: 1994))
					.setResponsibleParty("John Appleseed")
					.setUsedEquipment("defibrilator")
					.build()
				
				expect(identification.string) == "Startdate 29-MAR-1994 X John_Appleseed defibrilator"
				
			}
			
		}
	}
}
