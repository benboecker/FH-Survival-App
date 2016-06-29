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

		self.loadContent()

	}


	override func viewWillAppear(animated: Bool) {
		self.searchController.searchBar.becomeFirstResponder()
		//self.searchController.searchBar.tintColor = ColorScheme.Primary.Dark
	}

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.searchResults.count

	}

	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCellWithIdentifier("headlineCell", forIndexPath: indexPath) as? HeadlineTableViewCell
			else { return UITableViewCell() }

		let info = self.searchResults[indexPath.row]
		cell.headlineLabel.text = info.title
		cell.bodyLabel.text = info.text

		return cell
	}

	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

		if (self.searchResults[indexPath.row] is Information) {
			self.performSegueWithIdentifier("showHint", sender: self)
		}


	}

	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		guard let identifier = segue.identifier else { return }

		switch identifier {
		case "showHint":
			guard
				let hintViewController = segue.destinationViewController as? HintViewController,
				let indexPath = self.tableView.indexPathForSelectedRow,
				let hint = self.searchResults[indexPath.row] as? Information
				else { return }

			hintViewController.hint = hint
		case "showContact":
			guard
				let contactViewController = segue.destinationViewController as? ContactViewController,
				let indexPath = self.tableView.indexPathForSelectedRow,
				let contact = self.searchResults[indexPath.row] as? Information
				else { return }

			contactViewController.contact = contact
		default: break

		}
		
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
