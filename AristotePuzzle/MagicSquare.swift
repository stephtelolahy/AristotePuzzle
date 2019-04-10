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
    
    private let eqMatrix = [
        [1, 1, 1, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 1, 1, 1, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 1, 1, 1],
        [1, 0, 0, 1, 0, 0, 1, 0, 0],
        [0, 1, 0, 0, 1, 0, 0, 1, 0],
        [0, 0, 1, 0, 0, 1, 0, 0, 1],
        [1, 0, 0, 0, 1, 0, 0, 0, 1],
        [0, 0, 1, 0, 1, 0, 1, 0, 0]
    ]
    private let expectedSum = 15
    
    private func evaluate(_ board: [Int]) -> Int {
        var score = 0
        for i in 0...(eqMatrix.count - 1) {
            var sum = 0
            for j in 0...(board.count - 1) {
                sum += eqMatrix[i][j] * board[j]
            }
            score += abs(expectedSum - sum)
        }
        return score
    }
    
    private func neighbour(of board: [Int]) -> [Int] {
        let i = Int.random(in: 0 ... (board.count - 1))
        var j = 0
        repeat {
            j = Int.random(in: 0 ... (board.count - 1))
        } while i == j
        var newBoard = board
        newBoard.swapAt(i, j)
        return newBoard
    }
    
    private func displayString(_ board: [Int]) -> String {
        return  "\(board[0]) \(board[1]) \(board[2])\n\(board[3]) \(board[4]) \(board[5])\n\(board[6]) \(board[7]) \(board[8])"
    }
    
    func run() {
        print("Solving Magic square...")
        var board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        var score = evaluate(board)
        var iterations = 0
        while score > 0 && iterations < 100000 {
            iterations += 1
            let newBoard = neighbour(of: board)
            let newScore = evaluate(newBoard)
            print("\n\(displayString(newBoard)) \ni: \(iterations) score: \(newScore) best: \(score)")
            board = newBoard
            score = newScore
        }
    }
}
