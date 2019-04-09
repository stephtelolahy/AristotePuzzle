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


func shuffle(array: [Int]) {
    for result in combine3(from: array) {
        print(result)
    }
}

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

func combine3(from elements: [Int]) -> [[Int]] {
    var result: [[Int]] = []
    for array2 in combine2(from: elements) {
        let toAdd = elements.filter{ !array2.contains($0) }
        for el in toAdd {
            let array3 = array2 + [el]
            result.append(array3)
        }
    }
    return result
}

shuffle(array: [1, 2, 3, 4])




