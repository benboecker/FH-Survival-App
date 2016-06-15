//
//  Tag.swift
//  FH-Survival
//
//  Created by Benni on 14.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import Foundation


struct Tag: CollectionItem {
	var id: Int
	let name: String
	
	init? (json: [String: AnyObject]) {
		guard let name = json["tag"] as? String else { return nil }
		
		self.id = json["id"] as? Int ?? -1
		self.name = name
	}
}