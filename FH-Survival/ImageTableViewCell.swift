//
//  ContactTableViewCell.swift
//  FH-Survival
//
//  Created by Benjamin Böcker on 19.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell, Reuseable {

	@IBOutlet weak var label: UILabel!
	@IBOutlet weak var tintedImageView: UIImageView!

	override func updateStyle() {
		if let image = self.tintedImageView.image {
			self.tintedImageView.image = image.imageWithRenderingMode(.AlwaysTemplate)
		}

		self.tintedImageView.tintColor = ColorScheme.Primary
		self.label.textColor = ColorScheme.DarkText
		self.label.font = UIFont(textStyle: .Body)
	}

	func setTintedImage(image: UIImage) {
		self.tintedImageView.image = image.imageWithRenderingMode(.AlwaysTemplate)
		self.tintedImageView.tintColor = ColorScheme.Primary
	}
}
