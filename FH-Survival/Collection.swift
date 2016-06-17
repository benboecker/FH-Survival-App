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


protocol Container {
	associatedtype CollectionItem
	
	mutating func append(item: CollectionItem)
	var count: Int { get }
	subscript(index: Int) -> CollectionItem { get }
}

struct Collection: Container {
	private var items: [CollectionItem] = []
	
	var count: Int {
		return self.items.count
	}
	
	var allItems: [CollectionItem] {
		return self.items
	}
	
	subscript(index: Int) -> CollectionItem {
		get {
			return self.items[index]
		}
	}
	
	mutating func append(item: CollectionItem) {
		guard let _ = self.getItemByID(item.id) else {
			self.items.append(item)
			return
		}
	}
	
	func getItemByID(id: Int) -> CollectionItem? {
		return self.items.filter { (item) -> Bool in
			return (item.id == id)
		}.first
	}
}


