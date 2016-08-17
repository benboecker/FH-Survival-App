//
//  SearchViewController.swift
//  FH-Survival
//
//  Created by Benni on 14.04.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController, ContentViewController, UISearchBarDelegate, UISearchResultsUpdating {

	let searchController = UISearchController(searchResultsController: nil)

	var searchControllerActive: Bool {
		return self.searchController.active && self.searchController.searchBar.text != ""
	}

	var searchResults: [Information] = []

    override func viewDidLoad() {
        super.viewDidLoad()

		self.searchController.searchResultsUpdater = self
		self.searchController.searchBar.delegate = self
		self.searchController.dimsBackgroundDuringPresentation = false
		self.searchController.hidesNavigationBarDuringPresentation = false
		self.definesPresentationContext = true

		self.navigationItem.titleView = self.searchController.searchBar

		self.tableView.estimatedRowHeight = 60
		self.tableView.rowHeight = UITableViewAutomaticDimension

		self.tableView.registerReuseableCell(HeadlineTableViewCell.self)

		self.loadContent()

	}

	override func viewWillAppear(animated: Bool) {
		self.searchController.searchBar.becomeFirstResponder()
		self.searchController.searchBar.tintColor = AppColor.primary
	}

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.searchResults.count
	}

	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReuseableCell(indexPath: indexPath) as HeadlineTableViewCell
		cell.configureCell(self.searchResults[indexPath.row])
		return cell
	}

	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		let detailViewController = InformationDetailViewController(information: self.searchResults[indexPath.row])
		self.navigationController?.pushViewController(detailViewController, animated: true)
	}

	func searchBarTextDidEndEditing(searchBar: UISearchBar) {
		self.tableView.reloadData()
	}

	func searchBarSearchButtonClicked(searchBar: UISearchBar) {
		self.performSearch()
	}

	private func performSearch() {
		guard let searchText = self.searchController.searchBar.text where searchText.characters.count >= 1 else {
			self.searchResults = []
			self.tableView.reloadData()

			return
		}

		self.searchResults = self.content.searchInformation(searchText)
		self.tableView.reloadData()
	}

	func updateSearchResultsForSearchController(searchController: UISearchController) {
		self.performSearch()
	}
}
