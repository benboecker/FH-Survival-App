//
//  InformationListViewController.swift
//  FH-Survival
//
//  Created by Benjamin Böcker on 30.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit


class InformationListViewController<Cell: UITableViewCell where Cell: ReusableTableViewCell>: UITableViewController, ContentViewController {

	private let tags: [Tag]

	private var information: [Information] {
		return self.content.getInformation(self.tags)
	}

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
		self.tableView.registerReuseableCell(Cell.self)

		let bucketIcon = UIBarButtonItem(image: Asset.Icon.Bucket, style: .Plain, target: self, action: #selector(didTapBucket(_:)))
		self.navigationItem.leftBarButtonItem = bucketIcon

		self.loadContent()
	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)

		self.tableView.reloadData()
	}

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.information.count
	}

	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReuseableCell(indexPath: indexPath) as Cell
		let information: Information = self.information[indexPath.row]

		cell.configureCell(information)
		return cell
	}

	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		let info = self.information[indexPath.row]
		let detailViewController = InformationDetailViewController(information: info)
		self.navigationController?.pushViewController(detailViewController, animated: true)
	}

	func didTapBucket(sender: UIBarButtonItem) {
		let colorSchemeViewController = ViewControllerProvider.colorSchemeViewController
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


