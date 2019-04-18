//
//  MagicFigureResolver.swift
//  AristotePuzzle
//
//  Created by Hugues Stéphano TELOLAHY on 4/18/19.
//  Copyright © 2019 Hugues Stéphano TELOLAHY. All rights reserved.
//

private struct State {
    var board: [Int] = []
    var remaining: [Int] = []
    var rejected: [Int] = []
}

private extension State {
    
    func next() -> State {
        var remaining = self.remaining + self.rejected
        let board = self.board + [remaining.remove(at: 0)]
        return State(board: board, remaining: remaining, rejected: [])
    }
    
    mutating func swap() {
        if !board.isEmpty {
            let toReject = board.removeLast()
            rejected.append(toReject)
        }
        let toAdd = remaining.remove(at: 0)
        board.append(toAdd)
    }
}

class MagicFigureResolver {
    
    var eqMatrix: [[Int]] = []
    var expectedSum: Int = 0
    var displayString: (([Int]) -> String)?
    
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
    
    func run(elements: [Int]) {
        print("Solving Magic figure...")
        
        var state = State(board: [], remaining: elements, rejected: [])
        var stack: [State] = []
        var iterations = 0
        var done = false
        
        while !done {
            iterations += 1
            let valid = evaluate(state.board)
            if (valid) {
                print("\(displayString?(state.board) ?? "")\ni:\(iterations) remaining:\(state.remaining) rejected:\(state.rejected)\n")
                if state.remaining.isEmpty && state.rejected.isEmpty {
                    done = true
                } else {
                    stack.append(state)
                    state = state.next()
                }
            } else {
                var swapped = false
                while !swapped {
                    if !state.remaining.isEmpty {
                        state.swap()
                        swapped = true
                    } else {
                        state = stack.removeLast()
                    }
                }
            }
        }
        
        print("done")
    }
}
