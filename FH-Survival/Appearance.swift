//
//  Appearance.swift
//  FH-Survival
//
//  Created by Benni on 14.07.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

enum Appearance {

	static func setAppearance() {
		UITabBar.appearance().tintColor = ColorScheme.Primary

		UINavigationBar.appearance().barTintColor = ColorScheme.Primary
		UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
		UIBarButtonItem.appearance().tintColor = UIColor.whiteColor()
		UINavigationBar.appearance().tintColor = UIColor.whiteColor()

		UIToolbar.appearance().barTintColor = ColorScheme.Primary
		UIToolbar.appearance().tintColor = ColorScheme.Secondary

		UINavigationBar.appearance().barStyle = .Black
	}

}