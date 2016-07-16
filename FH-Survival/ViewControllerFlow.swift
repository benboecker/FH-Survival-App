//
//  App.swift
//  FH-Survival
//
//  Created by Benni on 15.07.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

final class ViewControllerFlow {
	let tabBarController = UITabBarController()

	let introductionNavigationController = ViewControllerProvider.introductionNavigationController
	let organisationNavigationController = ViewControllerProvider.organisationNavigationController
	let searchNavigationController = ViewControllerProvider.searchNavigationController
	let hintsNavigationController = ViewControllerProvider.hintsNavigationController
	let contactsNavigationController = ViewControllerProvider.contactsNavigationController

	init() {
		self.tabBarController.viewControllers = [
			self.introductionNavigationController,
			self.organisationNavigationController,
			self.searchNavigationController,
			self.hintsNavigationController,
			self.contactsNavigationController
		]

		guard let
			introductionViewController = self.introductionNavigationController.viewControllers.first as? InformationListViewController,
			organisationViewController = self.organisationNavigationController.viewControllers.first as? InformationListViewController,
//			searchViewController = self.searchNavigationController.viewControllers.first as? SearchViewController,
			hintsViewController = self.hintsNavigationController.viewControllers.first as? InformationListViewController,
			contactsViewController = self.contactsNavigationController.viewControllers.first as? InformationListViewController
			else {
				return
		}

		introductionViewController.showInformationDetail = self.showInformationDetail
		organisationViewController.showInformationDetail = self.showInformationDetail
//		searchViewController.showInformationDetail = self.showInformationDetail
		hintsViewController.showInformationDetail = self.showInformationDetail
		contactsViewController.showInformationDetail = self.showInformationDetail
	}

	func showInformationDetail(information: Information) {
		introductionNavigationController
	}
}

