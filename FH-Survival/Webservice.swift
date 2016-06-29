//
//  Webservice.swift
//  FH-Survival
//
//  Created by Benjamin Böcker on 29.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import Foundation


final class WebService {
	static let url = NSURL(string: "http://www.ben-boecker.de/content.json")!

	func load<ResourceType>(resource: Resource<ResourceType>, completion: ResourceType? -> ()) {
		NSURLSession.sharedSession().dataTaskWithURL(resource.url) { (data, _, error) in
			dispatch_async(dispatch_get_main_queue()) {
				let result = data.flatMap(resource.parse)
				completion(result)
			}
		}.resume()
	}
}