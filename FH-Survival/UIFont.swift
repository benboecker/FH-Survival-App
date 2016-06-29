//
//  UIFont.swift
//  FH-Survival
//
//  Created by Benjamin Böcker on 20.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

enum UIFontTextStyle: CustomStringConvertible {
	case Title1
	case Title2
	case Title3
	case Headline
	case Subheadline
	case Body
	case Footnote
	case Caption1
	case Caption2
	case Callout

	var description: String {
		switch self {
		case .Title1:
			return UIFontTextStyleTitle1
		case .Title2:
			return UIFontTextStyleTitle2
		case .Title3:
			return UIFontTextStyleTitle3
		case .Headline:
			return UIFontTextStyleHeadline
		case .Subheadline:
			return UIFontTextStyleSubheadline
		case .Body:
			return UIFontTextStyleBody
		case .Footnote:
			return UIFontTextStyleFootnote
		case .Caption1:
			return UIFontTextStyleCaption1
		case .Caption2:
			return UIFontTextStyleCaption2
		case .Callout:
			return UIFontTextStyleCallout
		}
	}
}

extension UIFont {


	convenience init(textStyle: UIFontTextStyle = .Body) {
		let fontDescriptor = UIFontDescriptor.preferredFontDescriptorWithTextStyle("\(textStyle)")
		self.init(descriptor: fontDescriptor, size: fontDescriptor.pointSize)
	}
}




