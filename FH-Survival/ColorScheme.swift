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

	static var all: [ColorScheme] {
		return [ColorScheme.strawberryColorScheme,
		        ColorScheme.citrusColorScheme,
		        ColorScheme.limeColorScheme,
		        ColorScheme.blueberryColorScheme,
		        ColorScheme.cherryColorScheme
		]
	}

	private static var strawberryColorScheme: ColorScheme {
		return ColorScheme(name: "Erdbeere",
		                   primary: UIColor(hex: ColorHexCodes.Strawberry.Primary),
		                   secondary: UIColor(hex: ColorHexCodes.Strawberry.Secondary),
		                   accent: UIColor(hex: ColorHexCodes.Strawberry.Accent),
		                   primaryText: UIColor(hex: ColorHexCodes.Strawberry.PrimaryText),
		                   secondaryText: UIColor(hex: ColorHexCodes.Strawberry.SecondaryText),
		                   hintText: UIColor(hex: ColorHexCodes.Strawberry.HintText),
		                   background: UIColor(hex: ColorHexCodes.Strawberry.Background))
	}

	private static var citrusColorScheme: ColorScheme {
		return ColorScheme(name: "Zitrone",
		                   primary: UIColor(hex: ColorHexCodes.Citrus.Primary),
		                   secondary: UIColor(hex: ColorHexCodes.Citrus.Secondary),
		                   accent: UIColor(hex: ColorHexCodes.Citrus.Accent),
		                   primaryText: UIColor(hex: ColorHexCodes.Citrus.PrimaryText),
		                   secondaryText: UIColor(hex: ColorHexCodes.Citrus.SecondaryText),
		                   hintText: UIColor(hex: ColorHexCodes.Citrus.HintText),
		                   background: UIColor(hex: ColorHexCodes.Citrus.Background))
	}

	private static var limeColorScheme: ColorScheme {
		return ColorScheme(name: "Limette",
		                   primary: UIColor(hex: ColorHexCodes.Lime.Primary),
		                   secondary: UIColor(hex: ColorHexCodes.Lime.Secondary),
		                   accent: UIColor(hex: ColorHexCodes.Lime.Accent),
		                   primaryText: UIColor(hex: ColorHexCodes.Lime.PrimaryText),
		                   secondaryText: UIColor(hex: ColorHexCodes.Lime.SecondaryText),
		                   hintText: UIColor(hex: ColorHexCodes.Lime.HintText),
		                   background: UIColor(hex: ColorHexCodes.Lime.Background))
	}

	private static var blueberryColorScheme: ColorScheme {
		return ColorScheme(name: "Blaubeere",
		                   primary: UIColor(hex: ColorHexCodes.Blueberry.Primary),
		                   secondary: UIColor(hex: ColorHexCodes.Blueberry.Secondary),
		                   accent: UIColor(hex: ColorHexCodes.Blueberry.Accent),
		                   primaryText: UIColor(hex: ColorHexCodes.Blueberry.PrimaryText),
		                   secondaryText: UIColor(hex: ColorHexCodes.Blueberry.SecondaryText),
		                   hintText: UIColor(hex: ColorHexCodes.Blueberry.HintText),
		                   background: UIColor(hex: ColorHexCodes.Blueberry.Background))
	}

	private static var cherryColorScheme: ColorScheme {
		return ColorScheme(name: "Kirsche",
		                   primary: UIColor(hex: ColorHexCodes.Cherry.Primary),
		                   secondary: UIColor(hex: ColorHexCodes.Cherry.Secondary),
		                   accent: UIColor(hex: ColorHexCodes.Cherry.Accent),
		                   primaryText: UIColor(hex: ColorHexCodes.Cherry.PrimaryText),
		                   secondaryText: UIColor(hex: ColorHexCodes.Cherry.SecondaryText),
		                   hintText: UIColor(hex: ColorHexCodes.Cherry.HintText),
		                   background: UIColor(hex: ColorHexCodes.Cherry.Background))
	}

	
}