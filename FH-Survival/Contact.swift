//
//  Contact.swift
//  FH-Survival
//
//  Created by Benni on 14.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import Foundation

enum ContactSortOption {
	case Title
	case Location
}

struct Contact: Information {
	var id: Int
	let text: String
	let title: String
	
	let location: String
	let phone: String
	let tags: [Tag]
	let urls: [URL]
	
	init (json: [String: AnyObject], tags: Collection<Tag>) {
		self.id = json["id"] as? Int ?? Int.random(0...100000)
		self.title = json["title"] as? String ?? ""
		self.location = json["location"] as? String ?? ""
		self.phone = json["phone"] as? String ?? ""
		self.text = ""
		
		var infoTags: [Tag] = []
		if let jsonTagIDs = json["tags"] as? [Int] {
			for tagID in jsonTagIDs {
				if let tag = tags.getItemByID(tagID) {
					infoTags.append(tag)
				}
			}
		}
		self.tags = infoTags
		
		var urls: [URL] = []
		if let jsonURLs = json["urls"] as? [[String: AnyObject]] {
			for jsonURL in jsonURLs {
				if let url = URL(json: jsonURL) {
					urls.append(url)
				}
			}
		}
		self.urls = urls
	}
}