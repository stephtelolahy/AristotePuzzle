//
//  BoardGenerator.swift
//  AristotePuzzle
//
//  Created by Hugues Stéphano TELOLAHY on 4/11/19.
//  Copyright © 2019 Hugues Stéphano TELOLAHY. All rights reserved.
//

class BoardGenerator {
    
    private let alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    
    private var board: [Int]
    private var size: Int
    private var oldBoards: [String] = []
    
    init(board: [Int]) {
        self.board = board
        size = board.count
        let letters = board.map{ alphabet[$0 - 1] }.joined()
        oldBoards.append(letters)
    }
    
    func next() -> [Int] {
        var newLetters = ""
        repeat {
            let i = Int.random(in: 0 ... (size - 1))
            let j = Int.random(in: 0 ... (size - 1))
            board.swapAt(i, j)
            newLetters = board.map{ alphabet[$0 - 1] }.joined()
        } while oldBoards.contains(newLetters)
        
        oldBoards.append(newLetters)
        return board
    }
}
