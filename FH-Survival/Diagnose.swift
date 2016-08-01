//
//  Diagnose.swift
//  FH-Survival
//
//  Created by Benni on 10.06.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import Foundation

/**
Global function to diagnose multiple guard conditions in case of failure.

```
guard let foo = bar where diagnose(),
      let rick = roll where diagnose(),
      let 😃 = 😳 where diagnose()
else { return }
```

Without the diagnose function it is impossible to tell which of the guard conditions failed. The diagnose function prints every condition up to the failing one with the filename and line number. The statement on the last printed line is the one that failed.
*/
func diagnose(file: String = #file, line: Int = #line) -> Bool {
	print("Testing \(file): \(line)")
	return true
}