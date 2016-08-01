//
//  InformationListViewController.swift
//  FH-Survival
//
//  Created by Benjamin Böcker on 30.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit


class InformationListViewController: UITableViewController, ContentViewController {

	private let tags: [Tag]

	private var information: [Information] {
		return self.content.getInformation(self.tags)
	}

	var showInformationDetail: (Information) -> () = {_ in}

	init(tags: [Tag]) {
		self.tags = tags

		super.init(style: .Plain)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		self.tableView.estimatedRowHeight = 60
		self.tableView.rowHeight = UITableViewAutomaticDimension

		self.tableView.registerReuseableCell(HeadlineTableViewCell.self) // This will register using the class without using a UINib

		let bucketIcon = UIBarButtonItem(image: Asset.Icon.Bucket, style: .Plain, target: self, action: #selector(didTapBucket(_:)))
		self.navigationItem.leftBarButtonItem = bucketIcon

		self.loadContent()
	}

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.information.count
	}

	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReuseableCell(indexPath: indexPath) as HeadlineTableViewCell
		cell.configureWithInformation(self.information[indexPath.row])

		return cell
	}

	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//		self.showInformationDetail(self.information[indexPath.row])

//		let detailViewController = InformationDetailViewController(information: self.information[indexPath.row])
//		self.navigationController?.pushViewController(detailViewController, animated: true)

		let detailViewController = ImageGalleryViewController()
		self.navigationController?.pushViewController(detailViewController, animated: true)
	}

	func didTapBucket(sender: UIBarButtonItem) {
		let colorSchemeViewController = ColorSchemeViewController(collectionViewLayout: UICollectionViewFlowLayout())
		colorSchemeViewController.delegate = self
		let colorNavigationController = UINavigationController(rootViewController: colorSchemeViewController)
		self.presentViewController(colorNavigationController, animated: true, completion: nil)
	}
}

extension InformationListViewController: ColorSchemeSelectionDelegate {
	func didPressCancel() {
		self.dismissViewControllerAnimated(true, completion: nil)
	}

	func selectedColorScheme(colorScheme: ColorScheme) {
		self.dismissViewControllerAnimated(true, completion: nil)
		self.tableView.reloadData()
	}
}


