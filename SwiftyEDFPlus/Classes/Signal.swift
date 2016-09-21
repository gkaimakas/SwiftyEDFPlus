//
//  Signal.swift
//  Pods
//
//  Created by Γιώργος Καϊμακάς on 10/06/16.
//
//

import Foundation

open class Signal {
	open static let OmittedField = "X"
	open static let Reserved = "".edf_padding(32)
	
	open class Builder {
		var label: String? = nil
		var transducerType: String? = nil
		var physicalDimension: String? = nil
		var physicalMaximum: String? = nil
		var physicalMinimum: String? = nil
		var digitalMaximum: String? = nil
		var digitalMinimum: String? = nil
		var prefiltering: String? = nil
		
		public init() {
		}
		
		open func setLabel(_ label: String) -> Builder {
			self.label = label
			return self
		}
		
		open func setTransducerType(_ type: String) -> Builder {
			self.transducerType = type
			return self
		}
		
		open func setPysicalDimension(_ dimension: String) -> Builder {
			self.physicalDimension = dimension
			return self
		}
		
		open func setPhysicalMinimum(_ min: String) -> Builder {
			self.physicalMinimum = min
			return self
		}
		
		open func setPhysicalMaximum(_ max: String) -> Builder {
			self.physicalMaximum = max
			return self
		}
		
		open func setDigitalMinimun(_ min: String) -> Builder {
			self.digitalMinimum = min
			return self
		}
		
		open func setDigitalMaximum(_ max: String) -> Builder {
			self.digitalMaximum = max
			return self
		}
		
		open func setPrefiltering(_ prefiltering: String) -> Builder {
			self.prefiltering = prefiltering
			return self
		}
		
		open func build() -> Signal {
			var labelString = Signal.OmittedField
			if let label = label {
				labelString = label
			}
			
			var transducerTypeString = Signal.OmittedField
			if let transducerType = transducerType {
				transducerTypeString = transducerType
			}
			
			var physicalDimensionString = Signal.OmittedField
			if let physicalDimension = physicalDimension {
				physicalDimensionString = physicalDimension
			}
			
			var physicalMinimumString = Signal.OmittedField
			if let physicalMinimum = physicalMinimum {
				physicalMinimumString = physicalMinimum
			}
			
			var physicalMaximumString = Signal.OmittedField
			if let physicalMaximum = physicalMaximum {
				physicalMaximumString = physicalMaximum
			}
			
			var digitalMinimumString = Signal.OmittedField
			if let digitalMinimum = digitalMinimum {
				digitalMinimumString = digitalMinimum
			}
			
			var digitalMaximumString = Signal.OmittedField
			if let digitalMaximum = digitalMaximum {
				digitalMaximumString = digitalMaximum
			}
			
			var prefilteringString = Signal.OmittedField
			if let prefiltering = prefiltering {
				prefilteringString = prefiltering
			}
			
			return Signal(label: labelString,
			              transducerType: transducerTypeString,
			              physicalDimension: physicalDimensionString,
			              physicalMinimum: physicalMinimumString,
			              physicalMaximum: physicalMaximumString,
			              digitalMinimum: digitalMinimumString,
			              digitalMaximum: digitalMaximumString,
			              prefiltering: prefilteringString)
		}
		
	}
	
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
	
	fileprivate init(label: String, transducerType: String, physicalDimension: String, physicalMinimum: String, physicalMaximum: String, digitalMinimum: String, digitalMaximum: String, prefiltering: String, samples: [Sample] = []) {
		
		self.label = label
		self.transducerType = transducerType
		self.physicalDimension = physicalDimension
		self.physicalMinimum = physicalMinimum
		self.physicalMaximum = physicalMaximum
		self.digitalMinimum = digitalMinimum
		self.digitalMaximum = digitalMaximum
		self.prefiltering = prefiltering
		self.samples = samples
	}
	
	open func addSampleWithValue(_ value: UInt16) -> Signal {
		return addSample(Sample(value: value))
	}
	
	open func addSample(_ sample: Sample) -> Signal{
		self.samples.append(sample)
		return self
	}
}
