//
//  String.swift
//  FH-Survival
//
//  Created by Benjamin Böcker on 29.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.

import Foundation

extension String {

	var isMailAdress: Bool {
		let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
		let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
		return emailTest.evaluateWithObject(self)
	}


	func containsString(string: String) -> Bool {
		return self.rangeOfString(string, options: [.CaseInsensitiveSearch, .DiacriticInsensitiveSearch]) != nil
	}


}