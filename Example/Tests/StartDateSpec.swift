//
//  StartDateSpec.swift
//  SwiftyEDF
//
//  Created by Γιώργος Καϊμακάς on 10/06/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import SwiftyEDFPlus

class StartDateSpec: QuickSpec {
	override func spec() {
		
		describe("string") {
			it("should return the date formatted as per the EDF+ spec") {
				expect(StartDate(day: 1, month: 12, year: 1986)!.string) == "01.12.86"
				expect(StartDate(day: 1, month: 12, year: 2016)!.string) == "01.12.16"
				expect(StartDate(day: 1, month: 12, year: 2100)!.string) == "01.12.'yy'"
			}
		}
	}
}