//
//  ErrorViewController.swift
//  FH-Survival
//
//  Created by Benjamin Böcker on 18.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

protocol ErrorViewController {
	func showAlertViewWithError(error: Error)
}

extension ErrorViewController where Self: UIViewController {
	func showAlertViewWithError(error: Error) {
		let alert = UIAlertController(title: error.title, message: error.message, preferredStyle: .Alert)
		let firstAction = UIAlertAction(title: "OK", style: .Default) { (alert: UIAlertAction!) -> Void in }

		alert.addAction(firstAction)
		self.presentViewController(alert, animated: true, completion:nil)
	}
}