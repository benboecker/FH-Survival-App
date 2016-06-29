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
	@IBOutlet weak var subheadlineLabel: UILabel!
	
	func configureWithContact(contact: Information) {
		self.headlineLabel?.text = contact.title
		self.bodyLabel?.text = contact.location
		self.subheadlineLabel?.text = ""
	}

	func configureWithHint(hint: Information) {
		self.headlineLabel?.text = hint.title
		self.bodyLabel?.text = hint.text


		let dateFormatter = NSDateFormatter()
		dateFormatter.dateStyle = .FullStyle
		dateFormatter.timeStyle = .NoStyle

		self.subheadlineLabel?.text = dateFormatter.stringFromDate(hint.date)
	}

	override func updateStyle() {
		super.updateStyle()

		self.headlineLabel?.textColor = ColorScheme.Primary
		self.subheadlineLabel?.textColor = ColorScheme.LightText
		self.bodyLabel?.textColor = ColorScheme.DarkText

		self.headlineLabel?.font = UIFont(textStyle: .Title3)
		self.subheadlineLabel?.font = UIFont(textStyle: .Subheadline)
		self.bodyLabel?.font = UIFont(textStyle: .Body)
	}
}