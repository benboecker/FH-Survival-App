//
//  NSDate.swift
//  FH-Survival
//
//  Created by Benjamin Böcker on 20.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import Foundation

extension NSDate {
	convenience init?(string: String, format: String) {
		let dateFormatter = NSDateFormatter()
		dateFormatter.dateFormat = format

		if let date = dateFormatter.dateFromString(string) {
			let timeInterval = date.timeIntervalSinceNow

			self.init(timeIntervalSinceNow: timeInterval)
		} else {
			self.init()
		}
	}	
}
