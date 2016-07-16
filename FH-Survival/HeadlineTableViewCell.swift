//
//  ContactTableViewCell.swift
//  FH-Survival
//
//  Created by Benni on 14.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

class HeadlineTableViewCell: UITableViewCell, Reuseable {
	@IBOutlet weak var headlineLabel: UILabel!
	@IBOutlet weak var bodyLabel: UILabel!

	func configureWithInformation(information: Information) {
		self.headlineLabel?.text = information.title
		self.bodyLabel?.text = information.text

		
	}

	override func updateStyle() {
		super.updateStyle()

		self.headlineLabel?.textColor = ColorScheme.Primary
		self.bodyLabel?.textColor = ColorScheme.DarkText

		self.headlineLabel?.font = UIFont(textStyle: .Title3)
		self.bodyLabel?.font = UIFont(textStyle: .Body)
	}
}