//
//  InformationListViewController.swift
//  FH-Survival
//
//  Created by Benjamin Böcker on 30.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit


class InformationListViewController: UITableViewController, ContentViewController {

	private let tags: [Tag]

	private var information: [Information] {
		return self.content.getInformation(self.tags)
	}

	init(tags: [Tag]) {
		self.tags = tags

		super.init(style: .Grouped)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		self.tableView.estimatedRowHeight = 60
		self.tableView.rowHeight = UITableViewAutomaticDimension

		let nib = UINib(nibName: "HeadlineTableViewCell", bundle: nil)
		self.tableView.registerNib(nib, forCellReuseIdentifier: "headlineCell")


		
		self.loadContent()
	}

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.information.count
	}

	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCellWithIdentifier("headlineCell", forIndexPath: indexPath) as? HeadlineTableViewCell
			else { return UITableViewCell() }

		cell.configureWithInformation(self.information[indexPath.row])

		return cell
	}

	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		let detailViewController = InformationDetailViewController(information: self.information[indexPath.row])
		self.navigationController?.pushViewController(detailViewController, animated: true)
	}
}




