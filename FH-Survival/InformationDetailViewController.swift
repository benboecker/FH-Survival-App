//
//  InformationDetailViewControllerTableViewController.swift
//  FH-Survival
//
//  Created by Benni on 30.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

class InformationDetailViewController: UITableViewController {

	var information: Information

	init(information: Information) {
		self.information = information

		super.init(style: .Grouped)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}


    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.tableView.estimatedRowHeight = 44
		self.tableView.rowHeight = UITableViewAutomaticDimension

		self.tableView.registerReuseableCell(ContentTableViewCell.self)
		self.tableView.registerReuseableCell(ImageTableViewCell.self)
	}

    // MARK: - Table view data source

	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		var numberOfSections = 1

		if (self.information.urls.count > 0) {
			numberOfSections += 1
		}

		return numberOfSections
	}

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		switch section {
		case 0:
			return 1
		case 1:
			return self.information.urls.count
		default:
			return 1
		}
	}

	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		switch indexPath.section {
		case 0:
			let cell = tableView.dequeueReuseableCell(indexPath: indexPath) as ContentTableViewCell
			cell.configureWithInformation(self.information)

			return cell
		case 1:
			let cell = tableView.dequeueReuseableCell(indexPath: indexPath) as ImageTableViewCell

			let url = self.information.urls[indexPath.row]
			cell.label.text = url.url.absoluteString

			switch url.type {
			case .Mail:
				cell.setTintedImage(Asset.Icon.Mail)
			case .Web:
				cell.setTintedImage(Asset.Icon.Web)
			case .Phone:
				cell.setTintedImage(Asset.Icon.Phone)
			}

			return cell
		default:
			return UITableViewCell()
		}
	}

	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		tableView.deselectRowAtIndexPath(indexPath, animated: true)

		switch indexPath.section {
		case 1: self.openURL(self.information.urls[indexPath.row])
		default: break
		}
	}
}
