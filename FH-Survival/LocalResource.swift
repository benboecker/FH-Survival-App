//
//  LocalResource.swift
//  FH-Survival
//
//  Created by Benni on 10.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import Foundation

protocol LocalResource: Resource {
	var filePath: NSURL? { get set }
}

extension LocalResource {
	var data: NSData? {
		return self.loadResource()
	}

	func loadResource() -> NSData? {
		if let filePath = filePath {
			return NSData(contentsOfURL: filePath)
		} else {
			return nil
		}
	}
}
