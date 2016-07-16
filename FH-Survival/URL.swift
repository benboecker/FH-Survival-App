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
	case Phone
}

struct URL {
	let title: String
	let url: NSURL
	let type: URLType
}

extension URL {
	init? (json: [String: AnyObject]) {
		guard let url = NSURL(string: json["url"] as? String ?? " ") else { return nil }
		
		self.title = json["title"] as? String ?? ""
		self.url = url

		self.type = URL.determineURLType(self.url)
	}

	private static func determineURLType(url: NSURL) -> URLType {
		if (url.absoluteString.isMailAdress) {
			return .Mail
		} else if (url.scheme == "tel") {
			return .Phone
		}

		return .Web
	}

}

