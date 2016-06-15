//
//  JSONResource.swift
//  FH-Survival
//
//  Created by Benni on 10.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//


import Foundation


/**
A *protocol* representing a JSON resource. It inherits from `LocalResource`, so it can be loaded from a location on disk in the bundle.
*/
protocol JSONResource: LocalResource {

}

/**
An extension for implementing the JSONResource and providing additional methods.
*/
extension JSONResource {
	
	/// Optional Dictionary which holds the parsed, but not processed JSON
	var jsonValue: [String : AnyObject]? {
		do {
			if let data = self.data, result = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as? [String : AnyObject] {
				return result
			}
		} catch {
			
		}
		return nil
	}
	
	/// Subscript for accessing a json value directly. returns nil if the value wasn't found.
	subscript(index: String) -> AnyObject? {
		get {
			return self.jsonValue?[index]
		}
	}
}