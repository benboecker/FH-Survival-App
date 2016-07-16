//
//  ContactTableViewCell.swift
//  FH-Survival
//
//  Created by Benjamin Böcker on 19.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

class ContentTableViewCell: UITableViewCell, Reuseable {

	@IBOutlet weak var headlineLabel: UILabel!
	@IBOutlet weak var subheadlineLabel: UILabel!
	@IBOutlet weak var contentLabel: UILabel!

	func configureWithInformation(information: Information) {
		self.headlineLabel?.text = information.title
		self.contentLabel?.text = information.text
		self.subheadlineLabel?.text = information.location
	}

	override func updateStyle() {
		super.updateStyle()

		self.headlineLabel.textColor = ColorScheme.Primary
		self.subheadlineLabel.textColor = ColorScheme.LightText
		self.contentLabel.textColor = ColorScheme.DarkText

		self.headlineLabel.font = UIFont(textStyle: .Title1)
		self.subheadlineLabel.font = UIFont(textStyle: .Subheadline)
		self.contentLabel.font = UIFont(textStyle: .Body)
	}	
}
