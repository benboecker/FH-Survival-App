//
//  ImageHeadlineTableViewCell.swift
//  FH-Survival
//
//  Created by Benni on 16.08.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

class ImageHeadlineTableViewCell: UITableViewCell, ReusableTableViewCell {

	typealias Type = Information

	@IBOutlet weak var bodyLabel: UILabel!
	@IBOutlet weak var headlineLabel: UILabel!
	@IBOutlet weak var overlayView: UIView!
	@IBOutlet weak var headlineImageView: UIImageView!

	var configure: (Type) -> () = { _ in }
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)

		self.configure = { information in
			self.headlineLabel?.text = information.title
			self.bodyLabel?.text = information.text

			if let imageName = information.images.first{
				self.headlineImageView?.image = UIImage(named: imageName)
				self.headlineImageView.hidden = false
				self.overlayView.hidden = false
			} else {
				self.headlineImageView.hidden = true
				self.overlayView.hidden = true
			}

			self.updateStyle()
		}
	}

	override func setSelected(selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		//self.overlayView.backgroundColor = AppColor.background
		//print("setSelected: \(selected) animated: \(animated)")
	}

	override func setHighlighted(highlighted: Bool, animated: Bool) {
		super.setHighlighted(highlighted, animated: animated)
		//self.overlayView.backgroundColor = AppColor.background
		//print("setHighlighted: \(selected) animated: \(animated)")
	}


	override func updateStyle() {
		super.updateStyle()

		self.overlayView.backgroundColor = AppColor.background
		self.backgroundColor = AppColor.background

		self.bodyLabel?.textColor = AppColor.secondaryText
		self.bodyLabel?.font = UIFont(textStyle: .Body)

		self.headlineLabel?.textColor = AppColor.primaryText
		self.headlineLabel?.font = UIFont(textStyle: .Headline)

		self.headlineImageView.contentMode = .ScaleAspectFill
	}
}





