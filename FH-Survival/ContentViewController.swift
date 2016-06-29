//
//  ContentListViewController.swift
//  FH-Survival
//
//  Created by Benjamin Böcker on 15.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

protocol ContentViewController: ErrorViewController {
	var content: Content { get }
}

extension ContentViewController {
	var content: Content {
		return Content.sharedInstance
	}
}

extension ContentViewController where Self: UITableViewController {
	func loadContent() {
		self.content.loadContent { (result) in
			switch result {
			case .Success(_):				
				self.tableView.reloadData()
			case let .Failure(error):
				self.showAlertViewWithError(error)
				break
			}
		}
		
	}
}