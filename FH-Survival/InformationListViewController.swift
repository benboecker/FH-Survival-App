//
//  InformationListViewController.swift
//  FH-Survival
//
//  Created by Benjamin Böcker on 30.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit


class InformationListViewController: UITableViewController, ContentViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		self.tableView.estimatedRowHeight = 60
		self.tableView.rowHeight = UITableViewAutomaticDimension


		

		self.loadContent()
	}



}