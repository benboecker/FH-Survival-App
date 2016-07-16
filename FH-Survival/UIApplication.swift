//
//  UIApplication.swift
//  FH-Survival
//
//  Created by Benni on 14.07.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

extension UIApplication {
	var documentsDirectory: String? {
		return NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first
	}
}