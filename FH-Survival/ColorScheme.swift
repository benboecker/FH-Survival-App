//
//  ColorScheme.swift
//  FH-Survival
//
//  Created by Benjamin Böcker on 19.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

enum ColorScheme {
	private enum HexCodes {
		static let LightText = 0x545454
		static let DarkText = 0x1A1A1A
		static let Accent = 0xFF0080
		static let Primary = 0xFF0080
		static let Secondary = 0x810041
	}

	static let Primary = UIColor(hex: HexCodes.Primary)
	static let Secondary = UIColor(hex: HexCodes.Secondary)
	static let Accent = UIColor(hex: HexCodes.Accent)
	static let LightText = UIColor(hex: HexCodes.LightText)
	static let DarkText = UIColor(hex: HexCodes.DarkText)
}



