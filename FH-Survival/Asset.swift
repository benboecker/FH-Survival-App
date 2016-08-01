//
//  Resource.swift
//  FH-Survival
//
//  Created by Benjamin Böcker on 20.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

/**
The asset enum gives access to various assets needed by the application.
*/
enum Asset {
	/**
	Inner enum to access Icons as `UIImage`s.
	*/
	enum Icon {
		/// The contacts icon
		static let Contacts = UIImage(named: "contacts")!
		/// The hints icon
		static let Hints = UIImage(named: "hints")!
		/// The home icon
		static let Home = UIImage(named: "home")!
		/// The mail icon
		static let Mail = UIImage(named: "mail")!
		/// The organisation icon
		static let Organisation = UIImage(named: "organisation")!
		/// The phone icon
		static let Phone = UIImage(named: "phone")!
		/// The search icon
		static let Search = UIImage(named: "search")!
		/// The web icon
		static let Web = UIImage(named: "web")!
		/// The bucket icon
		static let Bucket = UIImage(named: "bucket")!
		/// The QR code icon
		static let QRCode = UIImage(named: "qrcode")!
	}

	/**
	Inner enum to access filepaths
	*/
	enum File {
		// The filepath to the default content json file.
		static let DefaultContent = NSBundle.mainBundle().pathForResource("content", ofType: "json")

		static var LocalContent: String {
			guard let documentsDirectory = UIApplication.sharedApplication().documentsDirectory else {
				return ""
			}

			return "\(documentsDirectory)/content.json"
		}
	}
}







