//
//  LocalPatientIdentificationSpec.swift
//  SwiftyEDF
//
//  Created by Γιώργος Καϊμακάς on 10/06/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import SwiftyEDFPlus

class PatientIdentificationSpec: QuickSpec {
	override func spec() {
		describe("Builder") {
			it("should create a PatientIdentification object") {
				let identification = PatientIdentification.Builder()
					.setCode("Patient 01")
					.setName("John Appleseed")
					.setBirthDate(Date(day: 25, month: .September, year: 1987))
					.setSex(Sex.Male)
					.build()
				
				expect(identification.string) == "Patient_01 M 25-SEP-1987 John_Appleseed"
			}
			
			it("should create a PatientIdentification object with omitted fields") {
				let identification = PatientIdentification.Builder()
					.setName("John Appleseed")
					.build()
				
				expect(identification.string) == "X X X John_Appleseed"
			}
		}
	}
}
