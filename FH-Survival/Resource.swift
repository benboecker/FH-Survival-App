//
//  Resource.swift
//  FH-Survival
//
//  Created by Benjamin Böcker on 29.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import Foundation

struct Resource<A> {
	let url: NSURL
	let parse: NSData -> A?
}

extension Resource {
	init (url: NSURL, parseJSON: AnyObject -> A?) {
		self.url = url
		self.parse = { data in
			let json = try? NSJSONSerialization.JSONObjectWithData(data, options: [])
			return json.flatMap(parseJSON)
		}
	}
}