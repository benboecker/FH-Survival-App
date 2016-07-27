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
		UITabBar.appearance().tintColor = AppColor.primary

		UINavigationBar.appearance().barTintColor = AppColor.primary
		UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:AppColor.white]
		UIBarButtonItem.appearance().tintColor = AppColor.white
		UINavigationBar.appearance().tintColor = AppColor.white

		UIToolbar.appearance().barTintColor = AppColor.primary
		UIToolbar.appearance().tintColor = AppColor.primary

		UINavigationBar.appearance().barStyle = .Black
	}

}