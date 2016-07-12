//
//  UIViewController.swift
//  FH-Survival
//
//  Created by Benni on 04.07.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit
import SafariServices
import MessageUI

extension UIViewController: MFMailComposeViewControllerDelegate {
	func openURL(url: URL) {

		switch url.type {
		case .Web:
			let safariViewController = SFSafariViewController(URL: url.url)
			safariViewController.view.tintColor = ColorScheme.Primary
			self.presentViewController(safariViewController, animated: true, completion: nil)
		case .Mail:
			let mailController = MFMailComposeViewController()
			mailController.setToRecipients([url.url.absoluteString])
			mailController.mailComposeDelegate = self
			self.presentViewController(mailController, animated: true, completion: nil)
		case .Phone:
			guard let phoneURL = NSURL(string: "tel://" + url.url.absoluteString) else { return }

			UIApplication.sharedApplication().openURL(phoneURL)
			break
		}
	}

	public func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
		self.dismissViewControllerAnimated(true, completion: nil)
	}
}