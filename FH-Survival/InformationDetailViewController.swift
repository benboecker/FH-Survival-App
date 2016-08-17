//
//  InformationDetailViewControllerTableViewController.swift
//  FH-Survival
//
//  Created by Benni on 30.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

class InformationDetailViewController: UITableViewController {

	private var imageGalleryHeight: CGFloat {
		return self.information.images.count == 0 ? 0 : 200.0
	}

	var imageGalleryView: ImageGalleryView!
	var information: Information

	init(information: Information) {
		self.information = information

		super.init(style: .Grouped)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}


    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.tableView.estimatedRowHeight = 44
		self.tableView.rowHeight = UITableViewAutomaticDimension

		self.tableView.registerReuseableCell(ContentTableViewCell.self)
		self.tableView.registerReuseableCell(ImageTableViewCell.self)

		let galleryFrame = CGRectMake(0, 0, 320, imageGalleryHeight)
		self.imageGalleryView = ImageGalleryView(frame: galleryFrame)
		self.imageGalleryView.delegate = self

		self.tableView.tableHeaderView = nil
		self.tableView.addSubview(self.imageGalleryView)

		self.tableView.contentInset = UIEdgeInsets(top: imageGalleryHeight, left: 0.0, bottom: 0.0, right: 0.0)
		self.tableView.contentOffset = CGPointMake(0.0, imageGalleryHeight)
	}

    // MARK: - Table view data source

	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		var numberOfSections = 1

		if (self.information.urls.count > 0) {
			numberOfSections += 1
		}

		return numberOfSections
	}

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		switch section {
		case 0:
			return 1
		case 1:
			return self.information.urls.count
		default:
			return 1
		}
	}

	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		switch indexPath.section {
		case 0:
			let cell = tableView.dequeueReuseableCell(indexPath: indexPath) as ContentTableViewCell
			cell.configureWith(self.information)

			return cell
		case 1:
			let cell = tableView.dequeueReuseableCell(indexPath: indexPath) as ImageTableViewCell

			let url = self.information.urls[indexPath.row]
			cell.label.text = url.url.absoluteString

			switch url.type {
			case .Mail:
				cell.setTintedImage(Asset.Icon.Mail)
			case .Web:
				cell.setTintedImage(Asset.Icon.Web)
			case .Phone:
				cell.setTintedImage(Asset.Icon.Phone)
			}

			return cell
		default:
			return UITableViewCell()
		}
	}

	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		tableView.deselectRowAtIndexPath(indexPath, animated: true)

		switch indexPath.section {
		case 1: self.openURL(self.information.urls[indexPath.row])
		default: break
		}
	}

	private func updateHeaderViewFrame() {
		var headerRect = CGRectMake(0.0, -imageGalleryHeight, self.tableView.bounds.size.width, imageGalleryHeight)

		if (self.tableView.contentOffset.y < -imageGalleryHeight) {
			headerRect.origin.y = self.tableView.contentOffset.y
			headerRect.size.height = -self.tableView.contentOffset.y
		}

		self.imageGalleryView.frame = headerRect
		self.tableView.bringSubviewToFront(self.imageGalleryView)
	}
}

extension InformationDetailViewController: ImageGalleryDelegate {
	func numberOfImages(inImageGalleryView galleryView: ImageGalleryView) -> Int {
		return self.information.images.count
	}

	func imageGalleryView(galleryView: ImageGalleryView, imageCallback callback: ImageCallback, forImageAtIndex index: Int) {
		if let image = UIImage(named: self.information.images[index]) {
			callback(image: image)
		}
	}
}

extension InformationDetailViewController {
	override func scrollViewDidScroll(scrollView: UIScrollView) {
		self.updateHeaderViewFrame()
	}
}


