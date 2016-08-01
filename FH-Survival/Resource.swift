//
//  Resource.swift
//  FH-Survival
//
//  Created by Benjamin Böcker on 29.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import Foundation

/**
# Struct Resource

This struct represents a resource to load from the web.
*/
struct Resource<ResourceType> {
	let url: NSURL
	let parse: NSData -> ResourceType?
}

extension Resource {
	/**

	- Parameter url:
	- Parameter parseJSON:
	*/
	init (url: NSURL, parseJSON: AnyObject -> ResourceType?) {
		self.url = url
		self.parse = { data in
			let json = try? NSJSONSerialization.JSONObjectWithData(data, options: [])
			return json.flatMap(parseJSON)
		}
	}
}