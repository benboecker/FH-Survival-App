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
	let parse: (NSData) -> (ResourceType?)
}

extension Resource {
	/**
	Initializer to parse JSON Data into `ResourceType` objects / structs.
	- Parameter url: The URL of which to load data from
	- Parameter parseJSON: A function that takes `AnyObject`, parses it and returns a `ResourceType` if it can parse it, otherwise it returns nil.
	*/
	init (url: NSURL, parseJSON: AnyObject -> ResourceType?) {
		self.url = url
		self.parse = { data in
			let json = try? NSJSONSerialization.JSONObjectWithData(data, options: [])
			return json.flatMap(parseJSON)
		}
	}
}