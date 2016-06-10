//
//  Date.swift
//  Pods
//
//  Created by Γιώργος Καϊμακάς on 10/06/16.
//
//

import Foundation

public struct Date {
	
	public enum Month: String {
		case January = "JAN"
		case February = "FEB"
		case March = "MAR"
		case May = "MAY"
		case June = "JUN"
		case July = "JUL"
		case August = "AUG"
		case September = "SEP"
		case October = "OCT"
		case December = "DEC"
	}
	
	public let day: Int
	public let month: Month
	public let year: Int
	
	public init?(day: Int, month: Month, year: Int) {
		
		if day < 0 || day > 31 {
			return nil
		}
		
		self.day = day
		self.month = month
		self.year = year
	}
	
	public var string: String {
		return String(format: "%02d", day) + "-" + month.rawValue + "-" + String(year)
	}
}
