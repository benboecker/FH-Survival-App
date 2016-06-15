//
//  Information.swift
//  FH-Survival
//
//  Created by Benni on 14.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import Foundation


protocol Information: CollectionItem {
	var title: String { get }
	var text: String { get }
}