//
//  Information.swift
//  FH-Survival
//
//  Created by Benni on 14.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import Foundation

private enum JSONKeys {
	static let id = "id"
	static let title = "title"
	static let location = "location"
	static let text = "text"
	static let date = "date"
	static let tags = "tags"
	static let urls = "urls"
	static let phone = "phone"
	static let images = "images"
}

struct Information {
	var id: Int
	let title: String
	let text: String
	let date: NSDate

	let location: String

	let tags: [Tag]
	let urls: [URL]
	let images: [String]

	var json: String {
		let jsonDict = self.jsonValue()

		if (NSJSONSerialization.isValidJSONObject(jsonDict)) {
			do {
				let jsonData = try NSJSONSerialization.dataWithJSONObject(jsonDict, options: NSJSONWritingOptions.PrettyPrinted)
				if let jsonString = String(data: jsonData, encoding: NSUTF8StringEncoding) {
					return jsonString
				} else {
					print("Info (\(self.title)) conversion to JSON failed: Couldn't create String from JSON data")
					return ""
				}
			} catch let error as NSError {
				print("Info (\(self.title)) conversion to JSON failed: \(error)")
			}
			return ""
		} else {
			print("Info (\(self.title)) conversion to JSON failed: Not a valid JSON object")
			return ""
		}
	}
}

extension Information {
	static let all = Resource<[Information]>(url: WebService.url, parseJSON: { json in
		guard let dictionaries = json["information"] as? [JSONDictionary] else { return nil }
		return dictionaries.flatMap(Information.init)
	})
}

extension Information {
	init? (json: [String: AnyObject]) {
		guard let id = json[JSONKeys.id] as? Int else { return nil }
		
		self.id = id
		self.title = json[JSONKeys.title] as? String ?? ""
		self.location = json[JSONKeys.location] as? String ?? ""
		self.text = json[JSONKeys.text] as? String ?? ""

		if let jsonTags = json[JSONKeys.tags] as? [String] {
			self.tags = jsonTags.flatMap(Tag.init)
		} else {
			self.tags = []
		}

		var urls: [URL] = []
		if let jsonURLs = json[JSONKeys.urls] as? [JSONDictionary] {
			urls = jsonURLs.flatMap(URL.init)
		}
		if let phone = json[JSONKeys.phone] as? String, phoneURL = NSURL(string: phone) where phone != "" {
			let url = URL(title: "phone", url: phoneURL, type: .Phone)
			urls.append(url)
		}
		self.urls = urls

		if let dateString = json[JSONKeys.date] as? String,
			let date = NSDate(string: dateString, format: "yyyy-MM-dd") {			
			self.date = date
		} else {
			self.date = NSDate()
		}

		if let jsonImages = json[JSONKeys.images] as? [String] {
			self.images = jsonImages
		} else {
			self.images = []
		}
	}

	private func jsonValue() -> JSONDictionary {
		var json: JSONDictionary = [:]

		json[JSONKeys.title] = self.title
		json[JSONKeys.id] = self.id
		json[JSONKeys.location] = self.location
		json[JSONKeys.text] = self.text
		json[JSONKeys.images] = self.images

		let dateFormatter = NSDateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd"
		json[JSONKeys.date] = dateFormatter.stringFromDate(self.date)

		var urls: [JSONDictionary] = []
		for url in self.urls where url.type != .Phone {
			urls.append(url.json)
		}
		json[JSONKeys.urls] = urls

		for url in self.urls where url.type == .Phone {
			json[JSONKeys.phone] = url.url.absoluteString
		}

		var tags: [String] = []
		for tag in self.tags {
			tags.append(tag.description)
		}
		json[JSONKeys.tags] = tags


		return json
	}
}



