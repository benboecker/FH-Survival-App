//
//  Diagnose.swift
//  FH-Survival
//
//  Created by Benni on 10.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import Foundation

func diagnose(file: String = #file, line: Int = #line) -> Bool {
	print("Testing \(file): \(line)")
	return true
}