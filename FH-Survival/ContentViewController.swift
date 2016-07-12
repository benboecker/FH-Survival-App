//
//  ContentListViewController.swift
//  FH-Survival
//
//  Created by Benjamin Böcker on 15.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

protocol ContentViewController: ErrorViewController, Loading {
	var content: Content { get }
}

extension ContentViewController {
	var content: Content {
		return Content.sharedInstance
	}
}

extension ContentViewController where Self: UITableViewController {
	func loadContent() {
		self.showLoadingViewController()

		self.content.loadContent { [weak self] result in
			self?.hideLoadingViewController()

			switch result {
			case .Success(_):				
				self?.tableView?.reloadData()
			case let .Failure(error):
				self?.showAlertViewWithError(error)
				break
			}
		}
		
	}
}