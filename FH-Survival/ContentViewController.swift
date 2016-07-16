//
//  ContentListViewController.swift
//  FH-Survival
//
//  Created by Benjamin Böcker on 15.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

/**
This protocol provides a content object and the method to load new content data.
*/
protocol ContentViewController: ErrorViewController, Loading {
	/// The content object that holds the Information data
	var content: Content { get }
}

extension ContentViewController {
	/// The content variable simply returns the instance of the Content Singleton.
	var content: Content {
		return Content.sharedInstance
	}
}

extension ContentViewController where Self: UITableViewController {
	/**
	This method loads new content data via the `loadContent()` method of the Content Singleton. A loading indicator is shown and removed when the process finishes. If the loading process fails, an `UIAlertView` is shown via the `ErrorViewController` protocol.
	*/
	internal func loadContent() {
		self.showLoadingViewController()

		self.content.loadContent { [weak self] result in
			self?.hideLoadingViewController()

			switch result {
			case .Success(_):				
				self?.tableView?.reloadData()
			case let .Failure(error):
				print(error)
			}
		}
		
	}
}