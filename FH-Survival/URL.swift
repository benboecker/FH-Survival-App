//
//  URL.swift
//  FH-Survival
//
//  Created by Benni on 14.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import Foundation

enum URLType {
	case Web
	case Mail
}

struct URL {
	let title: String
	let url: NSURL

	var type: URLType {
		return self.determineURLType()
	}
	
	init? (json: [String: AnyObject]) {
		guard let url = NSURL(string: json["url"] as? String ?? " ") else { return nil }
		
		self.title = json["title"] as? String ?? ""
		self.url = url
	}

	private func determineURLType() -> URLType {
		if (self.checkForMail(self.url.absoluteString)) {
			return .Mail
		}

		return .Web
	}

	private func checkForMail(mail: String) -> Bool {
		let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
		let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
		return emailTest.evaluateWithObject(mail)
	}
}

