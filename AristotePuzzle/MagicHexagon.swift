//
//  MagicHexagon.swift
//  AristotePuzzle
//
//  Created by Hugues Stéphano TELOLAHY on 4/10/19.
//  Copyright © 2019 Hugues Stéphano TELOLAHY. All rights reserved.
//

/**
 * Solve Magic hexagon
 * https://en.wikipedia.org/wiki/Magic_hexagon
 **/
class MagicHexagon {
    
    private let eqMatrix = [
        [1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1],
        [1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0],
        [0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0],
        [0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0],
        [0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0],
        [1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1],
        [0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0],
        [0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0]
    ]
    private let expectedSum = 38
    
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
    
    private func displayString(_ board: [Int]) -> String {
        return  """
                ..\(board[0]).\(board[1]).\(board[2])..
                .\(board[3]).\(board[4]).\(board[5]).\(board[6]).
                \(board[7]).\(board[8]).\(board[9]).\(board[10]).\(board[11])
                .\(board[12]).\(board[13]).\(board[14]).\(board[15]).
                ..\(board[16]).\(board[17]).\(board[18])..
                """
    }
    func run() {
        print("Solving Magic hexagon...")
        var board = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
        let generator = BoardGenerator(board: board)
        var score = evaluate(board)
        var bestScore = score
        var iterations = 0
        let maxIterations = board.count.factorial()
        while score > 0 {
            iterations += 1
            board = generator.next()
            score = evaluate(board)
            if score < bestScore {
                bestScore = score
            }
            print("\n\(displayString(board)) \ni: \(iterations) \((iterations * 100)/maxIterations)% score: \(score) best: \(bestScore)")
        }
    }
    
}





