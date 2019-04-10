//
//  main.swift
//  AristotePuzzle
//
//  Created by Hugues Stéphano TELOLAHY on 4/9/19.
//  Copyright © 2019 Hugues Stéphano TELOLAHY. All rights reserved.
//

import Foundation

func combine2(from elements: [Int]) -> [[Int]] {
    var result: [[Int]] = []
    for i in elements {
        for j in elements {
            if i != j {
                result.append([i, j])
            }
        }
    }
    return result
}

func combine(n: Int, from elements: [Int]) -> [[Int]] {
    if n == 2 {
        return combine2(from: elements)
    }
    
    var result: [[Int]] = []
    for array in combine(n: n - 1, from: elements) {
        for el in elements.filter({ !array.contains($0) }) {
            result.append(array + [el])
        }
    }
    print("done: \(n)/\(elements.count)\tresults: \(result.count)")
    return result
}

func shuffle(_ array: [Int]) -> [[Int]] {
    return combine(n: array.count, from: array)
}

func printArray(_ array: [[Int]]) {
    for item in array {
        print(item)
    }
    print("total: \(array.count)")
}

//printArray(shuffle([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]))
MagicSquare().run()
