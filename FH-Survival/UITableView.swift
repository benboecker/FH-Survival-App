//
//  UITableView.swift
//  FH-Survival
//
//  Created by Benni on 13.07.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.

import UIKit

internal extension UITableView {
	func registerReuseableCell<T: UITableViewCell where T: Reuseable>(_: T.Type) {
		if let nib = T.nib {
			self.registerNib(nib, forCellReuseIdentifier: T.reuseIdentifier)
		} else {
			self.registerClass(T.self, forCellReuseIdentifier: T.reuseIdentifier)
		}
	}

	func dequeueReuseableCell<T: UITableViewCell where T: Reuseable>(indexPath indexPath: NSIndexPath) -> T {
		return self.dequeueReusableCellWithIdentifier(T.reuseIdentifier, forIndexPath: indexPath) as! T
	}
}

protocol Reuseable: class {
	static var reuseIdentifier: String { get }
	static var nib: UINib? { get }
}

extension Reuseable {
	static var reuseIdentifier: String {
		return String(Self)
	}
	static var nib: UINib? {
		return UINib(nibName: String(Self), bundle: nil)
	}
}





