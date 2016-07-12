//
//  Int.swift
//  FH-Survival
//
//  Created by Benni on 14.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import Foundation

extension Int {

	/**
	This class method returns a random Int in the valid integer interval.

	- Returns: A random positive integer.
	*/
	static func random() -> Int {
		return Int(arc4random())
	}

	/**
	This class method returns a random Int in the given Int range.

	- Parameter range: The range in which the random Int will be, including both bounds. The lower boundary may be negative.
	- Returns: A random integer in the given Int range.
	*/
	static func random(range: Range<Int>) -> Int {
		return Int(arc4random_uniform(UInt32(range.endIndex - range.startIndex))) + range.startIndex
	}
}