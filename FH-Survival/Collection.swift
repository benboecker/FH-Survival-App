//
//  Collection.swift
//  FH-Survival
//
//  Created by Benni on 14.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import Foundation

protocol CollectionItem {
	var id: Int { get }
}


struct Collection<T: CollectionItem> {
	private var items: [T] = []
	
	var count: Int {
		return self.items.count
	}
	
	var allItems: [T] {
		return self.items
	}
	
	subscript(index: Int) -> T {
		get {
			return self.items[index]
		}
	}
	
	mutating func append(item: T) {
		guard let _ = self.getItemByID(item.id) else {
			self.items.append(item)
			return
		}
	}
	
	func getItemByID(id: Int) -> T? {
		return self.items.filter { (item) -> Bool in
			return (item.id == id)
		}.first
	}
}


