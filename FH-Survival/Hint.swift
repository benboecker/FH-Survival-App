//
//  Information.swift
//  FH-Survival
//
//  Created by Benni on 14.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import Foundation

struct Hint: Information {
	var id: Int
	let title: String
	let text: String
	
	let tags: [Tag]
	let urls: [URL]
	
	init? (json: [String: AnyObject], tags: Collection) {
		guard let text = json["text"] as? String else { return nil }
		
		self.id = json["id"] as? Int ?? Int.random(0...100000)
		self.title = json["title"] as? String ?? ""
		self.text = text

		var infoTags: [Tag] = []
		if let jsonTagIDs = json["tags"] as? [Int] {
			for tagID in jsonTagIDs {
				if let tag = tags.getItemByID(tagID) as? Tag {
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
				} else {
					return nil
				}
			}
		}
		self.urls = urls
	}
}