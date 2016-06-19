//
//  ContactTableViewCell.swift
//  FH-Survival
//
//  Created by Benni on 14.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

class HeadlineTableViewCell: UITableViewCell {
	@IBOutlet weak var headlineLabel: UILabel!
	@IBOutlet weak var bodyLabel: UILabel!
	
	func configureWithContact(contact: Contact) {
		self.headlineLabel.text = contact.title
		self.bodyLabel.text = contact.location
	}
	
	func configureWithHint(hint: Hint) {
		self.headlineLabel.text = hint.title
		self.bodyLabel.text = hint.text
	}

	override func updateStyle() {
		super.updateStyle()

		self.headlineLabel.textColor = ColorScheme.Primary
		self.bodyLabel.textColor = ColorScheme.DarkText
	}
	
}