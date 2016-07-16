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
		guard let id = json["id"] as? Int else { return nil }
		
		self.id = id
		self.title = json["title"] as? String ?? ""
		self.location = json["location"] as? String ?? ""
		self.text = json["text"] as? String ?? ""

		if let jsonTags = json["tags"] as? [String] {
			self.tags = jsonTags.flatMap(Tag.init)
		} else {
			self.tags = []
		}

		var urls: [URL] = []
		if let jsonURLs = json["urls"] as? [[String: AnyObject]] {
			urls = jsonURLs.flatMap(URL.init)
		}
		if let phone = json["phone"] as? String, phoneURL = NSURL(string: phone) where phone != "" {
			let url = URL(title: "phone", url: phoneURL, type: .Phone)
			urls.append(url)
		}
		self.urls = urls

		if let dateString = json["date"] as? String,
			let date = NSDate(string: dateString, format: "yyyy-MM-dd") {			
			self.date = date
		} else {
			self.date = NSDate()
		}
	}
}


