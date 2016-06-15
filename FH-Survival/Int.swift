//
//  Int.swift
//  FH-Survival
//
//  Created by Benni on 14.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import Foundation

extension Int {
	static func random() -> Int {
		return Int(arc4random())
	}
	
	static func random(range: Range<Int>) -> Int {
		return Int(arc4random_uniform(UInt32(range.endIndex - range.startIndex))) + range.startIndex
	}
}