//
//  ContentListViewController.swift
//  FH-Survival
//
//  Created by Benjamin Böcker on 15.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

protocol ContentListViewController {
	var content: Content? { get set }
}

extension ContentListViewController where Self: UITableViewController {
	func loadContent() {
		guard let content = self.content else { return }
		
		content.loadContent { (result) in
			switch result {
			case .Success(_):
				self.tableView.reloadData()
			case let .Failure(error):
				print(error.message)
				break
			}
		}
		
	}
}