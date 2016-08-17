//
//  UIView.swift
//  FH-Survival
//
//  Created by Benjamin Böcker on 19.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit


extension UIView: Styled {
	public override func awakeFromNib() {
		super.awakeFromNib()

		self.updateStyle()
	}

	func updateStyle() {
		self.tintColor = AppColor.accent
	}
}