//
//  InformationListViewController.swift
//  FH-Survival
//
//  Created by Benni on 14.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

class InformationListTableViewController<TableCell: UITableViewCell>: UITableViewController {
	
	var informationCollection: Collection<CollectionItem>!
	var tableCellIdentifier: String = ""
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.informationCollection.count
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCellWithIdentifier(self.tableCellIdentifier, forIndexPath: indexPath) as? TableCell else { return UITableViewCell() }
		
		//cell.configureWithContact(self.contacts[indexPath.row])
		
		return cell
	}
	
}