//
//  main.swift
//  AristotePuzzle
//
//  Created by Hugues Stéphano TELOLAHY on 4/9/19.
//  Copyright © 2019 Hugues Stéphano TELOLAHY. All rights reserved.
//

import Foundation

let startTime = CFAbsoluteTimeGetCurrent()

//MagicSquare().run(with: [1, 2, 3, 4, 5, 6, 7, 8, 9])
MagicHexagon().run(with: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19])

let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
print("Time elapsed: \(timeElapsed) s")
