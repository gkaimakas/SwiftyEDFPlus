//
//  String.swift
//  Pods
//
//  Created by Γιώργος Καϊμακάς on 10/06/16.
//
//

import Foundation

public extension String {
	func edf_padding(_ expectedLength: Int, placeholder: String = " ") -> String {
		return self.padding(toLength: expectedLength, withPad: placeholder, startingAt: 0)
	}
}
