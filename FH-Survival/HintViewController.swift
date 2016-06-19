//
//  HintViewController.swift
//  FH-Survival
//
//  Created by Benjamin Böcker on 19.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

class HintViewController: UITableViewController {
	var hint: Hint?

	override func viewDidLoad() {
		super.viewDidLoad()

		self.tableView.estimatedRowHeight = 44
		self.tableView.rowHeight = UITableViewAutomaticDimension
	}

	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		guard let hint = self.hint else { return 0 }

		var numberOfSections = 1

		if (hint.urls.count > 0) {
			numberOfSections += 1
		}

		return numberOfSections
	}

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		switch section {
		case 0:
			return 1
		case 1:
			return self.hint?.urls.count ?? 0
		default:
			return 1
		}
	}

	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		switch indexPath.section {
		case 0:
			guard
				let cell = tableView.dequeueReusableCellWithIdentifier("headlineCell", forIndexPath: indexPath) as? HeadlineTableViewCell where diagnose(),
				let hint = self.hint where diagnose()
				else { return UITableViewCell() }

			cell.headlineLabel.text = hint.title
			cell.bodyLabel.text = hint.text

			return cell
		case 1:
			guard
				let cell = tableView.dequeueReusableCellWithIdentifier("imageCell", forIndexPath: indexPath) as? ImageTableViewCell,
				let hint = self.hint
				else { return UITableViewCell() }

			let url = hint.urls[indexPath.row]
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
