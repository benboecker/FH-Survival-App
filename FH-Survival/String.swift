//
//  String.swift
//  FH-Survival
//
//  Created by Benjamin Böcker on 29.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.

import Foundation

extension String {
	func containsString(string: String) -> Bool {
		return self.rangeOfString(string, options: [.CaseInsensitiveSearch, .DiacriticInsensitiveSearch]) != nil
	}
}