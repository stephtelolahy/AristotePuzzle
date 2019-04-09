//
//  main.swift
//  AristotePuzzle
//
//  Created by Hugues Stéphano TELOLAHY on 4/9/19.
//  Copyright © 2019 Hugues Stéphano TELOLAHY. All rights reserved.
//

import Foundation

print("Hello, World!")

func generate3NumbersCombinations(sum: Int) {
    var k = 0
    for a in 1...17 {
        for b in (a+1)...18 {
            for c in (b+1)...19 {
                if (a + b + c == sum){
                    print("\(a)+\(b)+\(c) = \(sum)")
                    k += 1
                }
            }
        }
    }
    print("results: \(k)")
}

func generate4NumbersCombinations(sum: Int) {
    var k = 0
    for a in 1...16 {
        for b in (a+1)...17 {
            for c in (b+1)...18 {
                for d in (c+1)...19 {
                    if (a + b + c + d == sum){
                        print("\(a)+\(b)+\(c)+\(d) = \(sum)")
                        k += 1
                    }
                }
            }
        }
    }
    print("results: \(k)")
}

func generate5NumbersCombinations(sum: Int) {
    var k = 0
    for a in 1...15 {
        for b in (a+1)...16 {
            for c in (b+1)...17 {
                for d in (c+1)...18 {
                    for e in (d+1)...19 {
                        if (a + b + c + d  + e == sum){
                            print("\(a)+\(b)+\(c)+\(d)+\(e) = \(sum)")
                            k += 1
                        }
                    }
                }
            }
        }
    }
    print("results: \(k)")
}

//generate3NumbersCombinations(sum: 38)
//generate4NumbersCombinations(sum: 38)
//generate5NumbersCombinations(sum: 38)

////////////////////////////////////////////////////////////////////////////////

func combine2(from elements: [Int]) -> [[Int]] {
    var result: [[Int]] = []
    for i in 0...(elements.count - 1) {
        for j in 0...(elements.count - 1) {
            if i != j {
                result.append([elements[i], elements[j]])
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
    for arrayN_1 in combine(n: n - 1, from: elements) {
        let toAdd = elements.filter{ !arrayN_1.contains($0) }
        for el in toAdd {
            let arrayN = arrayN_1 + [el]
            result.append(arrayN)
        }
    }
    return result
}

func printArray(_ array: [[Int]]) {
    for item in array {
        print(item)
    }
    print("Total: \(array.count)")
}

printArray(combine2(from: [1, 2]))
printArray(combine(n: 3, from: [1, 2, 3]))
printArray(combine(n: 4, from: [1, 2, 3, 4]))
printArray(combine(n: 5, from: [1, 2, 3, 4, 5]))




