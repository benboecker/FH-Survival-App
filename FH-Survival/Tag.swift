//
//  Tag.swift
//  FH-Survival
//
//  Created by Benjamin Böcker on 29.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import Foundation

enum Tag {
	case FirstSteps
	case Contact
	case Hint
	case General
	case Organisation
	case News
	case Book
}

extension Tag: CustomStringConvertible {
	var description: String {
		switch self {
		case .FirstSteps: return "Erste Schritte"
		case .Contact: return "Wo ist was?"
		case .Hint: return "Tipp"
		case .General: return "Allgemein"
		case .Organisation: return "Organisation"
		case .News: return "Neuigkeiten"
		case .Book: return "Buchtipp"
		}
	}

	init?(string: String) {
		switch string {
		case "Erste Schritte": self = .FirstSteps
		case "Wo ist was?": self = .Contact
		case "Tipp": self = .Hint
		case "Allgemein": self = .General
		case "Organisation": self = .Organisation
		case "Neuigkeiten": self = .News
		case "Buchtipp": self = .Book
		default: return nil
		}
	}
}