//
//  ColorSelectionCollectionViewCell.swift
//  FH-Survival
//
//  Created by Benni on 18.07.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

class ColorSelectionCollectionViewCell: UICollectionViewCell, Reuseable {
	@IBOutlet weak var primaryColorView: UIView!
	@IBOutlet weak var secondaryColorView: UIView!
	@IBOutlet weak var accentColorView: UIView!
	@IBOutlet weak var primaryTextColorView: UIView!
	@IBOutlet weak var secondaryTextColorView: UIView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var containerView: UIView!

	override func awakeFromNib() {
		super.awakeFromNib()
		self.backgroundView = nil

//		let selectedView = UIView(frame: self.bounds)
//		selectedView.backgroundColor = UIColor.redColor()
//		self.selectedBackgroundView = selectedView
	}

	func configureCell(colorScheme: ColorScheme) {
		self.nameLabel.text = colorScheme.name
		self.primaryColorView.backgroundColor = colorScheme.primary
		self.secondaryColorView.backgroundColor = colorScheme.secondary
		self.accentColorView.backgroundColor = colorScheme.accent
		self.primaryTextColorView.backgroundColor = colorScheme.primaryText
		self.secondaryTextColorView.backgroundColor = colorScheme.secondaryText


		self.contentView.backgroundColor = self.selected ? UIColor.greenColor() : UIColor.redColor()
	}

	override func updateStyle() {
		self.containerView.layer.cornerRadius = 5.0
//		self.containerView.layer.borderColor = UIColor(white: 0.7, alpha: 1).CGColor
//		self.containerView.layer.borderWidth = 1.0

		self.nameLabel.textColor = AppColor.primaryText

		self.contentView.layer.cornerRadius = 10.0
		self.contentView.layer.borderColor = UIColor(white: 0.7, alpha: 1.0).CGColor
		self.contentView.layer.borderWidth = 1.0

		self.backgroundColor = UIColor.clearColor()
	}


}
