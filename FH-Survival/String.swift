//
//  String.swift
//  FH-Survival
//
//  Created by Benjamin Böcker on 29.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.

import Foundation

extension String {

	/**
	Checks whether the String is an E-Mail-Adress.
	*/
	var isMailAdress: Bool {
		let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
		let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
		return emailTest.evaluateWithObject(self)
	}

	/**
	Replacement for the default `containsString()`-method. Checks for the substring with default options *case insensitive* and *diacritic insensitive*.
	
	- Parameter string: The string to search for.
	- Parameter options: String comparison options. Defaults to `.CaseInsensitiveSearch` and `DiacriticInsensitiveSearch`.
	- Returns: A boolean indicating whether the search string appears in the calling string.

	*/
	func containsString(string: String, options: NSStringCompareOptions = [.CaseInsensitiveSearch, .DiacriticInsensitiveSearch]) -> Bool {
		return self.rangeOfString(string, options: options) != nil
	}


}