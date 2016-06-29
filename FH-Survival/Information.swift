//
//  Information.swift
//  FH-Survival
//
//  Created by Benni on 14.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import Foundation

struct Information {
	var id: Int
	let title: String
	let text: String
	let date: NSDate

	let location: String
	let phone: String

	let tags: [Tag]
	let urls: [URL]
}

extension Information {
	static let all = Resource<[Information]>(url: WebService.url, parseJSON: { json in
		guard let dictionaries = json["information"] as? [JSONDictionary] else { return nil }
		return dictionaries.flatMap(Information.init)
	})
}

extension Information {
	init? (json: [String: AnyObject]) {
		guard let id = json["text"] as? Int else { return nil }
		
		self.id = id
		self.title = json["title"] as? String ?? ""
		self.location = json["location"] as? String ?? ""
		self.phone = json["phone"] as? String ?? ""
		self.text = json["text"] as? String ?? ""

		if let jsonTags = json["tags"] as? [String] {
			self.tags = jsonTags.flatMap(Tag.init)
		} else {
			self.tags = []
		}

		if let jsonURLs = json["urls"] as? [[String: AnyObject]] {
			self.urls = jsonURLs.flatMap(URL.init)
		} else {
			self.urls = []
		}

		if let dateString = json["date"] as? String,
			let date = NSDate(string: dateString, format: "yyyy-MM-dd") {			
			self.date = date
		} else {
			self.date = NSDate()
		}
	}
}