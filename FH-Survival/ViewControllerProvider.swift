//
//  ViewControllerProvider.swift
//  FH-Survival
//
//  Created by Benni on 30.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

enum ViewControllerProvider {
	static var contactsNavigationController: UINavigationController {
		return UINavigationController(rootViewController: ViewControllerProvider.contactsViewController)
	}

	static var hintsNavigationController: UINavigationController {
		return UINavigationController(rootViewController: ViewControllerProvider.hintsViewController)
	}

	static var searchNavigationController: UINavigationController {
		return UINavigationController(rootViewController: ViewControllerProvider.searchViewController)
	}

	static var organisationNavigationController: UINavigationController {
		return UINavigationController(rootViewController: ViewControllerProvider.organisationViewController)
	}

	static var introductionNavigationController: UINavigationController {
		return UINavigationController(rootViewController: ViewControllerProvider.introductionViewController)
	}

	private static var introductionViewController: InformationListViewController {
		let introductionViewController = InformationListViewController(tags: [.FirstSteps, .News])
		introductionViewController.tabBarItem = UITabBarItem(title: "\(Tag.News)", image: Asset.Icon.Home, selectedImage: nil)
		return introductionViewController
	}

	private static var organisationViewController: InformationListViewController {
		let organisationViewController = InformationListViewController(tags: [.Organisation, .General])
		organisationViewController.tabBarItem = UITabBarItem(title: "\(Tag.Organisation)", image: Asset.Icon.Organisation, selectedImage: nil)
		return organisationViewController
	}

	private static var contactsViewController: InformationListViewController {
		let contactListViewController = InformationListViewController(tags: [.Contact])
		contactListViewController.tabBarItem = UITabBarItem(title: "\(Tag.Contact)", image: Asset.Icon.Contacts, selectedImage: nil)
		return contactListViewController
	}

	private static var hintsViewController: InformationListViewController {
		let hintListViewController = InformationListViewController(tags: [.Hint, .Book])
		hintListViewController.tabBarItem = UITabBarItem(title: "\(Tag.Hint)", image: Asset.Icon.Hints, selectedImage: nil)
		return hintListViewController
	}

	private static var searchViewController: SearchViewController {
		let searchViewController = SearchViewController()
		searchViewController.tabBarItem = UITabBarItem(title: "Suche", image: Asset.Icon.Search, selectedImage: nil)
		return searchViewController
	}
}



