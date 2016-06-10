//
//  StringExtensions.swift
//  SwiftyEDFPlus
//
//  Created by Γιώργος Καϊμακάς on 10/06/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import SwiftyEDFPlus

class StringExtensionsSpec: QuickSpec {
	override func spec() {
		describe("padding") {
			it("should append spaces if the string is smaller than the expected size") {
				expect("abc".padding(5)) == "abc  "
			}
			
			it("should remove characters if the string is larger than the expected size") {
				expect("abcde".padding(3)) == "abc"
			}
		}
	}
}