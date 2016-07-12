//
//  NSDate.swift
//  FH-Survival
//
//  Created by Benjamin Böcker on 20.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import Foundation


extension NSDate {
	/**
	This convenience initialiser takes a String and tries to parse it into a `NSDate` object via a given format String and a `NSDateFormatter`. If it fails to create a date, the initialiser fails and returns nil.

	- Parameter string: The date string to be parsed into the `NSDate` object.
	- Parameter format: The format string to use for date parsing.
	*/
	convenience init?(string: String, format: String) {
		let dateFormatter = NSDateFormatter()
		dateFormatter.dateFormat = format

		if let date = dateFormatter.dateFromString(string) {
			let timeInterval = date.timeIntervalSinceNow

			self.init(timeIntervalSinceNow: timeInterval)
		} else {
			return nil
		}
	}	
}
