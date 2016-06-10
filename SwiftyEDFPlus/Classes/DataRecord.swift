//
//  DataRecord.swift
//  Pods
//
//  Created by Γιώργος Καϊμακάς on 10/06/16.
//
//

import Foundation

public struct DataRecord {
	public class Builder {
		let dataRecordDuration: Int
		
		public init(dataRecordDuration: Int) {
			self.dataRecordDuration = dataRecordDuration
		}
		
		public func create() -> DataRecord {
			return DataRecord(dataRecordDuration: dataRecordDuration)
		}
		
	}
	
	let dataRecordDuration: Int
	
	private init(dataRecordDuration: Int) {
		self.dataRecordDuration = dataRecordDuration
	}
}
