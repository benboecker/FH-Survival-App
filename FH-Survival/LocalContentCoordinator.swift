//
//  LocalContentCoordinator.swift
//  FH-Survival
//
//  Created by Benni on 14.07.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

struct LocalContentCoordinator {
	var localContentAvailable: Bool {
		let fileManager = NSFileManager()
		return fileManager.fileExistsAtPath(Asset.File.LocalContent)
	}

	func saveContent(information: [Information]) {

	}

	func loadContent() -> [Information] {
		let localData = NSData(contentsOfFile: Asset.File.LocalContent)
		let resource = Information.all

		if let result = localData.flatMap(resource.parse) {
			return result
		} else {
			return []
		}
	}

}




