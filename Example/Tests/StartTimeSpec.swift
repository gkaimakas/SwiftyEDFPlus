//
//  StartTimeSpec.swift
//  SwiftyEDFPlus
//
//  Created by Γιώργος Καϊμακάς on 10/06/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//


import Quick
import Nimble
import SwiftyEDFPlus

class StartTimeSpec: QuickSpec {
	override func spec() {
		describe(".string") {
			it("should return a StartTime object as per EDF+ spec") {
				expect(StartTime(hour: 01, minute: 24, second: 59)?.string) == "01.24.59"
			}
		}
	}
}
