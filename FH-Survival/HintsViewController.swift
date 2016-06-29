//
//  HintsViewController.swift
//  FH-Survival
//
//  Created by Benni on 14.04.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

class HintsViewController: UITableViewController, ContentViewController {

	var hints: [Information] {
		return self.content.getInformation([.Hint, .Book])
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.tableView.estimatedRowHeight = 60
		self.tableView.rowHeight = UITableViewAutomaticDimension

		self.loadContent()
	}
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.hints.count
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCellWithIdentifier("headlineCell", forIndexPath: indexPath) as? HeadlineTableViewCell
			else { return UITableViewCell() }
		
		cell.configureWithHint(self.hints[indexPath.row])
		
		return cell
	}
	
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		guard let identifier = segue.identifier else { return }

		switch identifier {
		case "showHint":
			guard
				let hintViewController = segue.destinationViewController as? HintViewController,
				let indexPath = self.tableView.indexPathForSelectedRow
				else { return }

			hintViewController.hint = self.hints[indexPath.row]
		default: break

		}
		
	}

}
