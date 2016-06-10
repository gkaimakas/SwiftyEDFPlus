//
//  String.swift
//  Pods
//
//  Created by Γιώργος Καϊμακάς on 10/06/16.
//
//

import Foundation

public extension String {
	func padding(expectedLength: Int, placeholder: String = " ") -> String {
		return self.stringByPaddingToLength(expectedLength, withString: placeholder, startingAtIndex: 0)
	}
}