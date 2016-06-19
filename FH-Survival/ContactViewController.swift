//
//  ContactViewController.swift
//  FH-Survival
//
//  Created by Benjamin Böcker on 19.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

class ContactViewController: UITableViewController {

	var contact: Contact?

	override func viewDidLoad() {
		super.viewDidLoad()

		self.tableView.estimatedRowHeight = 44
		self.tableView.rowHeight = UITableViewAutomaticDimension
	}

	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		guard let contact = self.contact else { return 0 }

		var numberOfSections = 1

		if (contact.phone != "") {
			numberOfSections += 1
		}

		if (contact.urls.count > 0) {
			numberOfSections += 1
		}

		return numberOfSections
	}

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		switch section {
		case 0:
			return 1
		case 1:
			return 1
		case 2:
			return self.contact?.urls.count ?? 0
		default:
			return 1
		}
	}

	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		switch indexPath.section {
		case 0:
			guard
				let cell = tableView.dequeueReusableCellWithIdentifier("contactCell", forIndexPath: indexPath) as? ContactTableViewCell,
				let contact = self.contact
				else { return UITableViewCell() }

			cell.titleLabel.text = contact.title
			cell.bodyTextLabel.text = contact.text
			cell.locationLabel.text = contact.location

			return cell
		case 1:
			guard
				let cell = tableView.dequeueReusableCellWithIdentifier("imageCell", forIndexPath: indexPath) as? ImageTableViewCell,
				let contact = self.contact
				else { return UITableViewCell() }

			cell.label.text = contact.phone
			cell.setTintedImage(UIImage.Phone)

			return cell
		case 2:
			guard
				let cell = tableView.dequeueReusableCellWithIdentifier("imageCell", forIndexPath: indexPath) as? ImageTableViewCell,
				let contact = self.contact
				else { return UITableViewCell() }

			let url = contact.urls[indexPath.row]
			cell.label.text = url.url.absoluteString

			switch url.type {
			case .Mail:
				cell.setTintedImage(UIImage.Mail)
			case .Web:
				cell.setTintedImage(UIImage.Web)
			}

			return cell
		default:
			return UITableViewCell()
		}
	}
}