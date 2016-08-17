//
//  ContactTableViewCell.swift
//  FH-Survival
//
//  Created by Benni on 14.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

class HeadlineTableViewCell: UITableViewCell, ReusableTableViewCell {
	typealias Type = Information

	@IBOutlet weak var headlineLabel: UILabel!
	@IBOutlet weak var bodyLabel: UILabel!

	var configure: (Type) -> () = { _ in }

	override func awakeFromNib() {
		super.awakeFromNib()

		self.configure = { information in
			self.headlineLabel?.text = information.title
			self.bodyLabel?.text = information.text

			self.updateStyle()
		}
	}

	override func updateStyle() {
		super.updateStyle()

		self.headlineLabel?.textColor = AppColor.primaryText
		self.bodyLabel?.textColor = AppColor.secondaryText

		self.backgroundColor = AppColor.background

		self.headlineLabel?.font = UIFont(textStyle: .Headline)
		self.bodyLabel?.font = UIFont(textStyle: .Body)
	}
}