//
//  Content.swift
//  FH-Survival
//
//  Created by Benni on 10.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

typealias CompletionHandler = (Result<Content> -> ())

struct Content {
	private var tagCollection: Collection<Tag> = Collection()
	private var hintCollection: Collection<Hint> = Collection()
	private var contactsCollection: Collection<Contact> = Collection()
	
	static func loadContent(completion: CompletionHandler) {
		let jsonFile = JSONFile()
		var content = Content()
		
		guard
			let jsonInformation = jsonFile["information"] as? [[String: AnyObject]],
			let jsonTags = jsonFile["tags"] as? [[String: AnyObject]],
			let jsonContacts = jsonFile["contacts"] as? [[String: AnyObject]]
			else {
				completion(.Failure(.JSONParsingError))
				return
		}
		
		for jsonTag in jsonTags {
			guard let tag = Tag(json: jsonTag) else {
				completion(.Failure(.JSONParsingError))
				return
			}
			
			content.tagCollection.append(tag)
		}
		
		for jsonInfo in jsonInformation {
			guard let info = Hint(json: jsonInfo, tags: content.tagCollection) else {
				completion(.Failure(.JSONParsingError))
				return
			}
			
			content.hintCollection.append(info)
		}

		for jsonContact in jsonContacts {
			let contact = Contact(json: jsonContact, tags: content.tagCollection)
			content.contactsCollection.append(contact)
		}
		
		completion(.Success(content))
	}
	
	func getAllContacts(sortedBy: ContactSortOption = .Title) -> [Contact] {
		let contacts = self.contactsCollection.allItems
		
		switch sortedBy {
		case .Title:
			return contacts.sort({ $0.title < $1.title })
		case .Location:
			return contacts.sort({ $0.location < $1.location })
		}
	}
}
