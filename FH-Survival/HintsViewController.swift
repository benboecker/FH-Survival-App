//
//  HintsViewController.swift
//  FH-Survival
//
//  Created by Benni on 14.04.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

class HintsViewController: UITableViewController, ContentListViewController {

	var content: Content?
	var hints: [Hint] {
		guard let content = self.content else { return [] }
		return content.getAllHints()
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
		guard let cell = tableView.dequeueReusableCellWithIdentifier("contactCell", forIndexPath: indexPath) as? HeadlineTableViewCell
			else { return UITableViewCell() }
		
		cell.configureWithHint(self.hints[indexPath.row])
		
		return cell
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
