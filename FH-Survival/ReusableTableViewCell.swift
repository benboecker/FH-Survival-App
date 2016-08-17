//
//  ReusableTableViewCell.swift
//  FH-Survival
//
//  Created by Benni on 16.08.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

protocol ReusableTableViewCell: Reusable {
	associatedtype Type

	var configure: (Type) -> () { get }

	func configureCell(data: Any?)
}

extension ReusableTableViewCell where Self: UITableViewCell {

	func configureCell(data: Any?) {
		guard let data = data as? Type else { return }

		self.configure(data)
	}

}