//
//  AppColor.swift
//  ColorTest
//
//  Created by Benni on 16.07.16.
//  Copyright © 2016 Benni. All rights reserved.
//

import UIKit

final class AppColor {
	private static let userDefaultsKey = "selected_app_color_scheme"
	private static let shared = AppColor()

	private var colorSchemes: [ColorScheme] = ColorScheme.all
	private var selectedColorScheme: ColorScheme = ColorScheme.all.first! {
		didSet {
			self.saveColorScheme()
		}
	}

	private init() {
		self.selectedColorScheme = self.loadColorScheme()
	}

	static var primary: UIColor {
		return AppColor.shared.primaryColor()
	}
	static var secondary: UIColor {
		return AppColor.shared.secondaryColor()
	}
	static var accent: UIColor {
		return AppColor.shared.accentColor()
	}
	static var primaryText: UIColor {
		return AppColor.shared.primaryTextColor()
	}
	static var secondaryText: UIColor {
		return AppColor.shared.secondaryTextColor()
	}
	static var hintTextText: UIColor {
		return AppColor.shared.hintTextColor()
	}
	static var background: UIColor {
		return AppColor.shared.backgroundColor()
	}
	static var white: UIColor {
		return UIColor.whiteColor()
	}
	static var black: UIColor {
		return UIColor.blackColor()
	}

	static func setSelectedColorScheme(colorScheme: ColorScheme) {
		AppColor.shared.selectedColorScheme = colorScheme
	}
}

extension AppColor {
	private func primaryColor() -> UIColor {
		return self.selectedColorScheme.primary
	}

	private func secondaryColor() -> UIColor {
		return self.selectedColorScheme.secondary
	}

	private func accentColor() -> UIColor {
		return self.selectedColorScheme.accent
	}

	private func primaryTextColor() -> UIColor {
		return self.selectedColorScheme.primaryText
	}

	private func secondaryTextColor() -> UIColor {
		return self.selectedColorScheme.secondaryText
	}

	private func hintTextColor() -> UIColor {
		return self.selectedColorScheme.hintText
	}

	private func backgroundColor() -> UIColor {
		return self.selectedColorScheme.background
	}

	private func saveColorScheme() {
		let index = ColorScheme.all.indexOf { (color) -> Bool in
			return color.name == self.selectedColorScheme.name
		}

		if let index = index {
			let userDefaults = NSUserDefaults.standardUserDefaults()
			userDefaults.setInteger(index, forKey: AppColor.userDefaultsKey)
		}
	}

	private func loadColorScheme() -> ColorScheme {
		let userDefaults = NSUserDefaults.standardUserDefaults()
		let index = userDefaults.integerForKey(AppColor.userDefaultsKey)

		return ColorScheme.all[index]
	}
}







