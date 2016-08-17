//
//  Webservice.swift
//  FH-Survival
//
//  Created by Benjamin Böcker on 29.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import Foundation


final class WebService {
	/// The URL of the json file to download and parse.
	static let url = NSURL(string: "http://www.ben-boecker.de/content.json")!

	/**
	This method loads a `Resource` from the web via `NSURLSession`, parses the returned data into the associated generic `ResourceType` and returns the result in a completion function.

	- Parameter resource: A `Resource` struct with the associated generic `ResourceType`.
	- Parameter completion: A function that gets called when the loading process finishes. Gets the loaded and parsed data of type `ResourceType` as a parameter.
	*/
	func load<ResourceType>(resource: Resource<ResourceType>, completion: ResourceType? -> ()) {
		NSURLSession.sharedSession().dataTaskWithURL(resource.url) { (data, _, error) in
			dispatch_async(dispatch_get_main_queue()) {
				let result = data.flatMap(resource.parse)
				completion(result)
			}
		}.resume()
	}
}