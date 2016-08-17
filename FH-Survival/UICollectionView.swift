//
//  UICollectionView.swift
//  FH-Survival
//
//  Created by Benni on 18.07.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

extension UICollectionView {
	func registerReuseableCell<T: UICollectionViewCell where T: Reusable>(_: T.Type) {
		if let nib = T.nib {
			self.registerNib(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
		} else {
			self.registerClass(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
		}
	}

	func dequeueReuseableCell<T: UICollectionViewCell where T: Reusable>(indexPath indexPath: NSIndexPath) -> T {
		return self.dequeueReusableCellWithReuseIdentifier(T.reuseIdentifier, forIndexPath: indexPath) as! T
	}
}