//
//  Content.swift
//  FH-Survival
//
//  Created by Benni on 10.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

typealias CompletionHandler = (Result<Content> -> ())

class Content {
	static let sharedInstance = Content()

	private var tagCollection: Collection = Collection()
	private var hintCollection: Collection = Collection()
	private var contactsCollection: Collection = Collection()
	
	private var isLoading: Bool = false {
		didSet {
			if !isLoading { self.completionHandlers = [] }
		}
	}

	private var completionHandlers: [CompletionHandler] = []

	private init() {}

	func loadContent(completion: CompletionHandler) {
		func loadCompleted(result: Result<Content>) {
			dispatch_async(dispatch_get_main_queue()) {
				for completionHandler in self.completionHandlers {
					completionHandler(result)
				}
				self.isLoading = false
			}
		}

		self.completionHandlers.append(completion)
		
		if (self.isLoading) {
			return
		}
		
		self.isLoading = true

		self.tagCollection = Collection()
		self.hintCollection = Collection()
		self.contactsCollection = Collection()

		dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
			let jsonFile = JSONFile()
			
			guard
				let jsonInformation = jsonFile["information"] as? [[String: AnyObject]],
				let jsonTags = jsonFile["tags"] as? [[String: AnyObject]],
				let jsonContacts = jsonFile["contacts"] as? [[String: AnyObject]]
				else {
					loadCompleted(.Failure(.JSONParsingError))
					return
			}
			
			for jsonTag in jsonTags {
				guard let tag = Tag(json: jsonTag) else {
					loadCompleted(.Failure(.JSONParsingError))

					return
				}
				
				self.tagCollection.append(tag)
			}
			
			for jsonInfo in jsonInformation {
				guard let info = Hint(json: jsonInfo, tags: self.tagCollection) else {
					loadCompleted(.Failure(.JSONParsingError))

					return
				}
				
				self.hintCollection.append(info)
			}
			
			for jsonContact in jsonContacts {
				let contact = Contact(json: jsonContact, tags: self.tagCollection)
				self.contactsCollection.append(contact)
			}
			
			loadCompleted(.Success(self))
		}
	}
	
	func getAllContacts(sortedBy: ContactSortOption = .Title) -> [Contact] {
		var contacts: [Contact] = []

		for item in self.contactsCollection.allItems {
			if let contact = item as? Contact {
				contacts.append(contact)
			}
		}
		
		switch sortedBy {
		case .Title:
			return contacts.sort({ $0.title < $1.title })
		case .Location:
			return contacts.sort({ $0.location < $1.location })
		}
	}

	func getAllHints(withTag: Tag? = nil) -> [Hint] {
		var hints: [Hint] = []
		
		for hint in self.hintCollection.allItems {
			if let hint = hint as? Hint {
				hints.append(hint)
			}
		}

		return hints
	}
}
