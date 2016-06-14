//
//  Result.swift
//  FH-Survival
//
//  Created by Benni on 14.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import Foundation


enum Result<T> {
	case Success(T)
	case Failure(Error)
}