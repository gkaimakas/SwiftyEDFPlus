//
//  Signal.swift
//  Pods
//
//  Created by Γιώργος Καϊμακάς on 10/06/16.
//
//

import Foundation

public struct Signal {
	let label: String
	let transducerType: String
	let physicalDimension: String
	let physicalMinimum: String
	let physicalMaximum: String
	let digitalMinimum: String
	let digitalMaximum: String
	let prefiltering: String
	var numberOfSamples: Int {
		return samples.count
	}
	
	var samples: [Sample] = []
	
	public mutating func addSampleWithValue(value: Int16) -> Signal {
		return addSample(Sample(value: value))
	}
	
	public mutating func addSample(sample: Sample) -> Signal{
		self.samples.append(sample)
		return self
	}
}
