//
//  UITableView.swift
//  FH-Survival
//
//  Created by Benni on 13.07.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.

import UIKit

internal extension UITableView {
	func registerReuseableCell<Cell: UITableViewCell where Cell: Reusable>(cellType: Cell.Type) {
		if let nib = Cell.nib {
			self.registerNib(nib, forCellReuseIdentifier: Cell.reuseIdentifier)
		} else {
			self.registerClass(Cell.self, forCellReuseIdentifier: Cell.reuseIdentifier)
		}
	}

	func dequeueReuseableCell<Cell: UITableViewCell where Cell: Reusable>(indexPath indexPath: NSIndexPath) -> Cell {
		return self.dequeueReusableCellWithIdentifier(Cell.reuseIdentifier, forIndexPath: indexPath) as! Cell
	}
}





