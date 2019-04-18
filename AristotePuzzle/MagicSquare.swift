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
    
    struct State {
        var board: [Int] = []
        var remaining: [Int] = []
        var rejected: [Int] = []
    }
    
    private func evaluate(_ board: [Int]) -> Bool {
        for i in 0...(eqMatrix.count - 1) {
            var ignore = false
            var sum = 0
            for j in 0...(eqMatrix[i].count - 1) {
                if eqMatrix[i][j] == 1 {
                    if j < board.count {
                        sum += board[j]
                    } else {
                        ignore = true
                    }
                }
            }
            if !ignore && sum != expectedSum {
                return false
            }
        }
        return true
    }
    
    private func displayString(_ board: [Int]) -> String {
        let alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i"]
        var layout =  "a.b.c\nd.e.f\ng.h.i"
        for i in 0..<9 {
            let el = i < board.count ? "\(board[i])" : "*"
            layout = layout.replacingOccurrences(of: alphabet[i], with: el)
        }
        return layout
    }
    
    private func next(_ state: State) -> State {
        var remaining = state.remaining + state.rejected
        let board = state.board + [remaining.remove(at: 0)]
        return State(board: board, remaining: remaining, rejected: [])
    }
    
    private func swap(_ state: State) -> State {
        var board = state.board
        var remaining = state.remaining
        let toAdd = remaining.remove(at: 0)
        var rejected = state.rejected
        
        if !board.isEmpty {
            let toReject = board.removeLast()
            rejected.append(toReject)
        }
        
        board.append(toAdd)
        return State(board: board, remaining: remaining, rejected: rejected)
    }
    
    func run() {
        print("Solving Magic square...")
        
        var state = State(board: [], remaining: [1, 2, 3, 4, 5, 6, 7, 8, 9], rejected: [])
        var stack: [State] = []
        var iterations = 0
        var done = false
        
        while !done {
            iterations += 1
            let valid = evaluate(state.board)
            print("\(displayString(state.board))\ni:\(iterations) valid:\(valid) remaining:\(state.remaining) rejected:\(state.rejected)\n")
            if (valid) {
                if state.remaining.isEmpty && state.rejected.isEmpty {
                    done = true
                } else {
                    stack.append(state)
                    state = next(state)
                }
            } else {
                var swapped = false
                while !swapped {
                    if !state.remaining.isEmpty {
                        state = swap(state)
                        swapped = true
                    } else {
                        state = stack.removeLast()
                    }
                }
            }
        }
    }
}
