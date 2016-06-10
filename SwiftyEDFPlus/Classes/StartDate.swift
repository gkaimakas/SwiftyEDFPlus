//
//  StartDate.swift
//  Pods
//
//  Created by Γιώργος Καϊμακάς on 10/06/16.
//
//

import Foundation

public struct StartDate {
	public static let Separator = "."
	
	let day: Int
	let month: Int
	let year: Int
	
	public init?(day: Int, month: Int, year: Int) {
		if year < 1985 {
			return nil
		}
		
		if day < 1 || day > 31 {
			return nil
		}
		
		if month < 1 || month > 12 {
			return nil
		}
		
		self.day = day
		self.month = month
		self.year = year
	}
	
	public var string: String {
		var yearString = ""
		
		if year < 2000 {
			yearString = String(format: "%02d", year - 1900)
		} else if year < 2085 {
			yearString = String(format: "%02d", year - 2000)
		} else {
			yearString = "'yy'"
		}
		
		return String(format: "%02d", day) + StartDate.Separator +
			String(format: "%02d", month) + StartDate.Separator +
			yearString
	}
}
