//
//  MagicSquare.swift
//  AristotePuzzle
//
//  Created by Hugues Stéphano TELOLAHY on 4/10/19.
//  Copyright © 2019 Hugues Stéphano TELOLAHY. All rights reserved.
//

/**
 * Solve Magic square 3x3
 * https://en.wikipedia.org/wiki/Magic_square
 **/
class MagicSquare {
    
    func run(with elements: [Int]) {
        let resolver = MagicFigureResolver()
        resolver.eqMatrix = [
            [1, 1, 1, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 1, 1, 1, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 1, 1, 1],
            [1, 0, 0, 1, 0, 0, 1, 0, 0],
            [0, 1, 0, 0, 1, 0, 0, 1, 0],
            [0, 0, 1, 0, 0, 1, 0, 0, 1],
            [1, 0, 0, 0, 1, 0, 0, 0, 1],
            [0, 0, 1, 0, 1, 0, 1, 0, 0]
        ]
        resolver.expectedSum = 15
        resolver.displayString = { board in
            let alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i"]
            var layout = """
                     a.b.c
                     d.e.f
                     g.h.i
                     """
            for i in 0..<alphabet.count {
                let el = i < board.count ? "\(board[i])" : "*"
                layout = layout.replacingOccurrences(of: alphabet[i], with: el)
            }
            return layout
        }
        
        resolver.run(elements: elements)
    }
}
