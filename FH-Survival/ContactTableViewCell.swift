//
//  ContactTableViewCell.swift
//  FH-Survival
//
//  Created by Benni on 14.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var locationLabel: UILabel!
	
	func configureWithContact(contact: Contact) {
		self.titleLabel.text = contact.title
		self.locationLabel.text = contact.location
	}
}