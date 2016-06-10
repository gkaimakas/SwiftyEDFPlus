//
//  StartTime.swift
//  Pods
//
//  Created by Γιώργος Καϊμακάς on 10/06/16.
//
//

import Foundation

public struct StartTime {
	public static let Separator = "."
	
	let hour: Int
	let minute: Int
	let second: Int
	
	public init? (hour: Int, minute: Int, second: Int) {
		if hour < 0 || hour > 23 {
			return nil
		}
		
		if minute < 0 || minute > 59 {
			return nil
		}
		
		if second < 0 || second > 59 {
			return nil
		}
		
		self.hour = hour
		self.minute = minute
		self.second = second
	}
	
	public var string: String {
		return String(format: "%02d", hour) + StartTime.Separator +
				String(format: "%02d", minute) + StartTime.Separator +
				String(format: "%02d", second)
	}
}
