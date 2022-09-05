//: [Previous](@previous)

/*
Given an array of integers, find the pair of adjacent elements that has the largest product and return that product.

Example

For inputArray = [3, 6, -2, -5, 7, 3], the output should be
solution(inputArray) = 21
*/


import Foundation

let isFindedPair = { (values: [Int]) -> Bool in
    return !values.isEmpty && values.count >= 2
}

func solution(values: [Int]?) -> Int {
    guard var values = values, isFindedPair(values) else {
        return /*((values?.count ?? 0) == 1) ? (values?.first ?? 0) : */Int.min
    }

    let firstResult = values.removeFirst() * values[0]
    let lastResult = solution(values: values)

    return lastResult > firstResult ? lastResult : firstResult
}

//print(solution(values: nil))
//print(solution(values: []))
print(solution(values: [3, 6, -2, -5, 7, 3]))
print(solution(values: [0, 1, 2, 3, 4, 3]))
print(solution(values: [1, -2, 3, -4, 3]))
//print(solution(values: [1]))
//: [Next](@next)
