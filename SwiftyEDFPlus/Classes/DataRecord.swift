//
//  DataRecord.swift
//  Pods
//
//  Created by Γιώργος Καϊμακάς on 10/06/16.
//
//

import Foundation

open class DataRecord {
	open class Builder {
		let dataRecordDuration: Int
		
		public init(dataRecordDuration: Int) {
			self.dataRecordDuration = dataRecordDuration
		}
		
		open func build() -> DataRecord {
			return DataRecord(dataRecordDuration: dataRecordDuration)
		}
		
	}
	
	let dataRecordDuration: Int
	var signals: [Signal] = []
	
	fileprivate init(dataRecordDuration: Int) {
		self.dataRecordDuration = dataRecordDuration
	}
	
	open func addSignal(_ signal: Signal) -> DataRecord {
		signals.append(signal)
		return self
	}
}
