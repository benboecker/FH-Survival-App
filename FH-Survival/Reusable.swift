//
//  Reusable.swift
//  FH-Survival
//
//  Created by Benni on 18.07.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

protocol Reusable: class {
	static var reuseIdentifier: String { get }
	static var nib: UINib? { get }
}

extension Reusable {
	static var reuseIdentifier: String {
		return String(Self)
	}
	static var nib: UINib? {
		return UINib(nibName: String(Self), bundle: nil)
	}
}





