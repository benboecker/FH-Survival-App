//
//  ColorScheme.swift
//  ColorTest
//
//  Created by Benni on 18.07.16.
//  Copyright © 2016 Benni. All rights reserved.
//

import UIKit

struct ColorScheme {
	let name: String
	let primary: UIColor
	let secondary: UIColor
	let accent: UIColor
	let primaryText: UIColor
	let secondaryText: UIColor
	let hintText: UIColor
	let background: UIColor

	init(json: JSONDictionary) {
		self.name = json["name"] as? String ?? ""

		let primaryColorString = json["primary"] as? String ?? "#000000"
		let secondaryColorString = json["secondary"] as? String ?? "#000000"
		let accentColorString = json["accent"] as? String ?? "#000000"
		let primaryTextColorString = json["primaryText"] as? String ?? "#000000"
		let secondaryTextColorString = json["secondaryText"] as? String ?? "#000000"
		let hintTextColorString = json["hintText"] as? String ?? "#000000"
		let backgroundColorString = json["background"] as? String ?? "#000000"

		self.primary = UIColor(hexString: primaryColorString)
		self.secondary = UIColor(hexString: secondaryColorString)
		self.accent = UIColor(hexString: accentColorString)
		self.primaryText = UIColor(hexString: primaryTextColorString)
		self.secondaryText = UIColor(hexString: secondaryTextColorString)
		self.hintText = UIColor(hexString: hintTextColorString)
		self.background = UIColor(hexString: backgroundColorString, alpha: 0.9)
	}

	static var all: [ColorScheme] {
		var colorSchemes: [ColorScheme] = []
		let jsonPath = NSBundle.mainBundle().pathForResource("colorSchemes", ofType: "json")!
		let jsonData = NSData(contentsOfFile: jsonPath)!
		let json = try? NSJSONSerialization.JSONObjectWithData(jsonData, options: []) as? JSONDictionary ?? [:]

		let jsonColorSchemes: [JSONDictionary] = json!["colorSchemes"] as? [JSONDictionary] ?? [[:]]
		for jsonElement in jsonColorSchemes {
			colorSchemes.append(ColorScheme(json: jsonElement))
		}

		return colorSchemes
	}



	
}



