//
//  ColorScheme.swift
//  FH-Survival
//
//  Created by Benjamin Böcker on 19.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

enum ColorScheme {
	enum ColorSchemeValue: Int {
		case Pink, Yellow, Green, Blue, Red
	}

	static var Primary: UIColor {
		return Colors.shared.primary
	}
	static var Secondary: UIColor {
		return Colors.shared.secondary
	}
	static var LightText: UIColor {
		return Colors.shared.lightText
	}
	static var DarkText: UIColor {
		return Colors.shared.darkText
	}

	static func setColorScheme(colorScheme: ColorSchemeValue) {
		Colors.shared.colorScheme = colorScheme
	}

	final private class Colors {
		static let shared = Colors()
		private let userDefaultsKey = "colorSchemeValue"

		var colorScheme: ColorSchemeValue {
			didSet {
				self.saveColorSchemeValue()

				switch colorScheme {
				case .Pink:
					self.primary = UIColor(hex: HexCodes.Pink.Primary)
					self.secondary = UIColor(hex: HexCodes.Pink.Secondary)
					self.lightText = UIColor(hex: HexCodes.Pink.LightText)
					self.darkText = UIColor(hex: HexCodes.Pink.DarkText)
				case .Yellow:
					self.primary = UIColor(hex: HexCodes.Yellow.Primary)
					self.secondary = UIColor(hex: HexCodes.Yellow.Secondary)
					self.lightText = UIColor(hex: HexCodes.Yellow.LightText)
					self.darkText = UIColor(hex: HexCodes.Yellow.DarkText)
				case .Green:
					self.primary = UIColor(hex: HexCodes.Green.Primary)
					self.secondary = UIColor(hex: HexCodes.Green.Secondary)
					self.lightText = UIColor(hex: HexCodes.Green.LightText)
					self.darkText = UIColor(hex: HexCodes.Green.DarkText)
				case .Blue:
					self.primary = UIColor(hex: HexCodes.Blue.Primary)
					self.secondary = UIColor(hex: HexCodes.Blue.Secondary)
					self.lightText = UIColor(hex: HexCodes.Blue.LightText)
					self.darkText = UIColor(hex: HexCodes.Blue.DarkText)
				case .Red:
					self.primary = UIColor(hex: HexCodes.Red.Primary)
					self.secondary = UIColor(hex: HexCodes.Red.Secondary)
					self.lightText = UIColor(hex: HexCodes.Red.LightText)
					self.darkText = UIColor(hex: HexCodes.Red.DarkText)
				}
			}
		}

		var primary = UIColor(hex: HexCodes.Blue.Primary)
		var secondary = UIColor(hex: HexCodes.Blue.Secondary)
		var lightText = UIColor(hex: HexCodes.Blue.LightText)
		var darkText = UIColor(hex: HexCodes.Blue.DarkText)

		private init() {
			let userDefaults = NSUserDefaults.standardUserDefaults()
			self.colorScheme = ColorSchemeValue(rawValue: userDefaults.integerForKey(self.userDefaultsKey))!
		}

		private func saveColorSchemeValue() {
			let userDefaults = NSUserDefaults.standardUserDefaults()
			userDefaults.setInteger(self.colorScheme.rawValue, forKey: self.userDefaultsKey)
		}
	}
}



