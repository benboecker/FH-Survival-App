//
//  UIFont.swift
//  FH-Survival
//
//  Created by Benjamin Böcker on 20.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

/**
This enum represents a text style used by UIFont.
*/
enum UIFontTextStyle: CustomStringConvertible {
	/// The enum value for UIFontTextStyleTitle1
	case Title1
	/// The enum value for UIFontTextStyleTitle2
	case Title2
	/// The enum value for UIFontTextStyleTitle3
	case Title3
	/// The enum value for UIFontTextStyleHeadline
	case Headline
	/// The enum value for UIFontTextStyleSubheadline
	case Subheadline
	/// The enum value for UIFontTextStyleBody
	case Body
	/// The enum value for UIFontTextStyleFootnote
	case Footnote
	/// The enum value for UIFontTextStyleCaption1
	case Caption1
	/// The enum value for UIFontTextStyleCaption2
	case Caption2
	/// The enum value for UIFontTextStyleCallout
	case Callout

	/// The String representation of the enum value.
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



	/**
	This initializer takes a `UIFontTextStyle` enum value and creates a `UIFont` in the correct style.

	- Parameter textStyle: The text style that the new font object will represent..
	*/
	convenience init(textStyle: UIFontTextStyle = .Body) {
		let fontDescriptor = UIFontDescriptor.preferredFontDescriptorWithTextStyle("\(textStyle)")
		self.init(descriptor: fontDescriptor, size: fontDescriptor.pointSize)
	}
}




