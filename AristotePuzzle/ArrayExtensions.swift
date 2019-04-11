//
//  ArrayExtensions.swift
//  AristotePuzzle
//
//  Created by Hugues Stéphano TELOLAHY on 4/10/19.
//  Copyright © 2019 Hugues Stéphano TELOLAHY. All rights reserved.
//

extension Array where Element == Int {
    
    func combine2() -> [[Int]] {
        var result: [[Int]] = []
        for i in self {
            for j in self {
                if i != j {
                    result.append([i, j])
                }
            }
        }
        return result
    }
    
    func combine(n: Int) -> [[Int]] {
        if n == 2 {
            return self.combine2()
        }
        
        var result: [[Int]] = []
        for array in self.combine(n: n - 1) {
            for el in self.filter({ !array.contains($0) }) {
                result.append(array + [el])
            }
        }
        return result
    }
    
    func allCombinations() -> [[Int]] {
        return self.combine(n: self.count)
    }
    
    mutating func neighbour() {
        let i = Int.random(in: 0 ... (self.count - 1))
        var j = 0
        repeat {
            j = Int.random(in: 0 ... (self.count - 1))
        } while i == j
        self.swapAt(i, j)
    }
}

extension Array where Element == [Int] {
    
    func displayString() -> String {
        var result = ""
        for item in self {
            result += "\n\(item)"
        }
        result += "\ntotal: \(self.count)"
        return result
    }
}

