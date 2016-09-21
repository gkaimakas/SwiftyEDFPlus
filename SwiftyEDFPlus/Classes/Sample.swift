//
//  Sample.swift
//  Pods
//
//  Created by Γιώργος Καϊμακάς on 10/06/16.
//
//

import Foundation

public struct Sample {
	let value: UInt16
	
	public init(value: UInt16) {
		self.value = value
	}
	
	public var data: Data {
		var value = self.value

		return Data(bytes: &value, count: MemoryLayout<UInt16>.size)
	}
}
