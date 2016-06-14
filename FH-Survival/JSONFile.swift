//
//  JSONFile.swift
//  FH-Survival
//
//  Created by Benni on 14.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import Foundation

struct JSONFile: JSONResource {
	internal var filePath: NSURL? = NSBundle.mainBundle().URLForResource("content", withExtension: "json")
}
