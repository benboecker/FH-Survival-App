//
//  WoIstWasViewController.swift
//  FH-Survival
//
//  Created by Benni on 14.04.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

class ContactsViewController: UITableViewController, ContentListViewController {

	var content: Content?
	
	private var sortOption: ContactSortOption = .Title {
		didSet {
			self.tableView.reloadData()
		}
	}
	
	private var contacts: [Contact] {
		guard let content = self.content else { return [] }
		return content.getAllContacts(self.sortOption)
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.tableView.estimatedRowHeight = 60
		self.tableView.rowHeight = UITableViewAutomaticDimension
		
		self.loadContent()
	}

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.contacts.count
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCellWithIdentifier("contactCell", forIndexPath: indexPath) as? HeadlineTableViewCell
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
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
