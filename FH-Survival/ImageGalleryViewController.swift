//
//  ImageGalleryViewController.swift
//  FH-Survival
//
//  Created by Benni on 25.07.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

class ImageGalleryViewController: UIViewController, ImageGalleryDelegate {

	var imageGalleryView: ImageGalleryView!

	override func viewDidLoad() {
		super.viewDidLoad()

		self.view.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
		self.imageGalleryView = ImageGalleryView(frame: CGRectMake(30, 100, 200, 200))
		self.imageGalleryView.delegate = self
		self.view.addSubview(self.imageGalleryView)
	}

	func numberOfImages(inImageGalleryView galleryView: ImageGalleryView) -> Int {
		return 4
	}

	func imageGalleryView(galleryView: ImageGalleryView, imageAtIndex index: Int) -> UIImage {
		return UIImage(named: "test\(index + 1)")!
	}

	func imageGalleryView(galleryView: ImageGalleryView, didTapImageAtIndex index: Int) {
		print(index)
	}


}