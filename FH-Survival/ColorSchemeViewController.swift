//
//  ColorSchemeViewController.swift
//  FH-Survival
//
//  Created by Benni on 15.07.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

protocol ColorSchemeSelectionDelegate: class{
	func didPressCancel()
	func selectedColorScheme(colorScheme: ColorScheme)
}

class ColorSchemeViewController: UICollectionViewController {

	var delegate: ColorSchemeSelectionDelegate?

	var items: [ColorScheme] {
		return ColorScheme.all
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		self.collectionView?.backgroundColor = UIColor(hex: 0xDAE0E6)
		self.collectionView?.registerReuseableCell(ColorSelectionCollectionViewCell.self)
		self.collectionView?.contentInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
		self.collectionView?.alwaysBounceVertical = true

		if let layout = self.collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
			layout.minimumLineSpacing = 20
			layout.minimumInteritemSpacing = 20
		}

		let cancelButton = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: #selector(cancelButtonTapped(_:)))
		self.navigationItem.leftBarButtonItem = cancelButton
	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)

		let selectedIndexPath = NSIndexPath(forItem: 0, inSection: 0)
		self.collectionView?.selectItemAtIndexPath(selectedIndexPath, animated: false, scrollPosition: .CenteredVertically)
	}

	override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.items.count
	}

	override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReuseableCell(indexPath: indexPath) as ColorSelectionCollectionViewCell
		cell.configureCell(self.items[indexPath.row])
		return cell
	}

	override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
		AppColor.setSelectedColorScheme(self.items[indexPath.row])

		self.delegate?.selectedColorScheme(self.items[indexPath.row])
	}

	func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
		let width = (CGRectGetWidth(self.view.bounds) / 2) - 30
		let height = width

		return CGSize(width: width, height: height)
	}

	func cancelButtonTapped(sender: AnyObject) {
		self.delegate?.didPressCancel()
	}
}




