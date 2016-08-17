//
//  UIColor.swift
//  FH-Survival
//
//  Created by Benjamin Böcker on 19.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

extension UIColor {
	convenience init(hex: Int, alpha: CGFloat = 1.0) {
		let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
		let green = CGFloat((hex & 0xFF00) >> 8) / 255.0
		let blue = CGFloat((hex & 0xFF)) / 255.0

		self.init(red:red, green:green, blue:blue, alpha:alpha)
	}

	convenience init(hexString: String, alpha: CGFloat = 1.0) {
		var hexInt: UInt32 = 0

		let scanner: NSScanner = NSScanner(string: hexString)
		scanner.charactersToBeSkipped = NSCharacterSet(charactersInString: "#")
		scanner.scanHexInt(&hexInt)

		let red = CGFloat((hexInt & 0xFF0000) >> 16) / 255.0
		let green = CGFloat((hexInt & 0xFF00) >> 8) / 255.0
		let blue = CGFloat((hexInt & 0xFF)) / 255.0

		self.init(red:red, green:green, blue:blue, alpha:alpha)
	}
}