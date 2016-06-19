//
//  UIImage.swift
//  FH-Survival
//
//  Created by Benjamin Böcker on 19.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit


extension UIImage {
	static var Phone: UIImage {
		return UIImage(named: "phone")!
	}
	static var Web: UIImage {
		return UIImage(named: "web")!
	}
	static var Mail: UIImage {
		return UIImage(named: "mail")!
	}
}

extension UIImage {
	enum Icon {
		static let Phone = UIImage(named: "phone")!
		static let Web = UIImage(named: "web")!
		static let Mail = UIImage(named: "mail")!
	}
}