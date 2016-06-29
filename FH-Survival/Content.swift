//
//  Content.swift
//  FH-Survival
//
//  Created by Benni on 10.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

typealias CompletionHandler = (Result<Content> -> ())

enum SortOption {
	case Title, Location
}

final class Content {
	static let sharedInstance = Content()
	private init() {}

	private let webService: WebService = WebService()
	private var information: [Information] = []

	private var isLoading: Bool = false {
		didSet {
			if !isLoading { self.completionHandlers = [] }
		}
	}

	private var completionHandlers: [CompletionHandler] = []
}

extension Content {
	func loadContent(completion: CompletionHandler) {
		func loadCompleted(result: Result<Content>) {
			for completionHandler in self.completionHandlers {
				completionHandler(result)
			}
			self.isLoading = false
		}

		self.completionHandlers.append(completion)
		
		if (self.isLoading) {
			return
		}
		
		self.isLoading = true

		self.webService.load(Information.all) { (data) in
			if let information = data {
				self.information = information
				loadCompleted(.Success(self))
			} else {
				loadCompleted(.Failure(.JSONParsingError))
			}
		}
	}

	func getInformation(withTags: [Tag], sortOption: SortOption = .Title) -> [Information] {
		var information: [Information] = []
		let tagSet: Set<Tag> = Set(withTags)

		for info in self.information where tagSet.intersect(info.tags).count > 0 {
			information.append(info)
		}

		switch sortOption {
		case .Title:
			return information.sort({ $0.title < $1.title })
		case .Location:
			return information.sort({ $0.location < $1.location })
		}
	}

	func searchInformation(searchString: String) -> [Information] {
		var information: [Information] = []

		for info in self.information where info.text.containsString(searchString) || info.title.containsString(searchString) {
			information.append(info)
		}

		return information.sort({ $0.title < $1.title })
	}
}
