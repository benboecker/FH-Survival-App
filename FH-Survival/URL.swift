//
//  URL.swift
//  FH-Survival
//
//  Created by Benni on 14.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import Foundation

struct URL {
	let title: String
	let url: NSURL
	
	init? (json: [String: AnyObject]) {
		guard let url = NSURL(string: json["url"] as? String ?? " ") else { return nil }
		
		self.title = json["title"] as? String ?? ""
		self.url = url
	}
}