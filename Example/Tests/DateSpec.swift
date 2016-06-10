//
//  DateSpec.swift
//  SwiftyEDF
//
//  Created by Γιώργος Καϊμακάς on 10/06/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import SwiftyEDFPlus

class DateSpec: QuickSpec {
	override func spec() {
		describe("Date") {
			context(".string"){
				it("should return the date formatted as per the EDF+ specs") {
					let birthdate = Date(day: 2, month: .May, year: 1987)
					
					expect(birthdate).toNot(beNil())
					if let birthdate = birthdate {
						expect(birthdate.string) == "02-MAY-1987"
					}
				}
			}
		}
	}
}
