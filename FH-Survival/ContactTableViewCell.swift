//
//  ContactTableViewCell.swift
//  FH-Survival
//
//  Created by Benjamin Böcker on 19.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var locationLabel: UILabel!
	@IBOutlet weak var bodyTextLabel: UILabel!

	override func updateStyle() {
		super.updateStyle()

		self.titleLabel.textColor = ColorScheme.Primary
		self.locationLabel.textColor = ColorScheme.LightText
		self.bodyTextLabel.textColor = ColorScheme.DarkText

		self.titleLabel.font = UIFont(textStyle: .Title1)
		self.locationLabel.font = UIFont(textStyle: .Subheadline)
		self.bodyTextLabel.font = UIFont(textStyle: .Body)
	}

	
}
