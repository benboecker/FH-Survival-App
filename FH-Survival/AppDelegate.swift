//
//  AppDelegate.swift
//  FH-Survival
//
//  Created by Benni on 14.04.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow? = UIWindow(frame: UIScreen.mainScreen().bounds)

	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

		Appearance.setAppearance()

		let tabBarController = UITabBarController()
		tabBarController.viewControllers = [
			ViewControllerProvider.introductionNavigationController,
			ViewControllerProvider.organisationNavigationController,
			ViewControllerProvider.searchNavigationController,
			ViewControllerProvider.hintsNavigationController,
			ViewControllerProvider.contactsNavigationController
		]

		self.window?.rootViewController = tabBarController
		self.window?.makeKeyAndVisible()

		return true
	}
}

