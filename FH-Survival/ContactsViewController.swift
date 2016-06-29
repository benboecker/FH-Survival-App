//
//  WoIstWasViewController.swift
//  FH-Survival
//
//  Created by Benni on 14.04.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

class ContactsViewController: UITableViewController, ContentViewController {

	private var sortOption: SortOption = .Title {
		didSet {
			self.tableView.reloadData()
		}
	}
	
	private var contacts: [Information] {
		return self.content.getInformation([.Contact], sortOption: self.sortOption)
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.tableView.estimatedRowHeight = 60
		self.tableView.rowHeight = UITableViewAutomaticDimension

		self.loadContent()

		self.title = "Wo ist was?"
		self.navigationItem.titleView = UIView()
	}

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.contacts.count
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCellWithIdentifier("headlineCell", forIndexPath: indexPath) as? HeadlineTableViewCell
			else { return UITableViewCell() }
		
		cell.configureWithContact(self.contacts[indexPath.row])
		
		return cell
	}
	
	@IBAction func segmentedControlTapped(sender: UISegmentedControl) {
		if (sender.selectedSegmentIndex == 0) {
			self.sortOption = .Title
		} else {
			self.sortOption = .Location
		}
		
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		guard let identifier = segue.identifier else { return }

		switch identifier {
		case "showContact":
			guard
				let contactViewController = segue.destinationViewController as? ContactViewController,
				let indexPath = self.tableView.indexPathForSelectedRow
				else { return }

			contactViewController.contact = self.contacts[indexPath.row]
		default: break

		}

	}


}
