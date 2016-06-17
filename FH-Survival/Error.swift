//
//  Error.swift
//  FH-Survival
//
//  Created by Benni on 10.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit


protocol ErrorDescription {
	var title: String { get }
	var message: String { get }
}

enum Error: ErrorDescription {
	case JSONParsingError
}

extension Error {
	var title: String {
		return ""
	}
	var message: String {
		switch self {
		case .JSONParsingError:
			return "Error parsing JSON"
		}
	}
}