//: [Previous](@previous)

import Foundation

/*
 You get an array of numbers, return the sum of all of the positives ones.

 Example [1,-4,7,12] => 1 + 7 + 12 = 20

 Note: if there is nothing to sum, the sum is default to 0.
 */

func positiveSum(values: [Int?]) -> Int {
    var sum = 0;
    for value in values {
        sum += value ?? 0 > 0 ? value ?? 0 : 0;
    }
        
    return sum
}

print(positiveSum(values: [1,-4,7,12]))
print(positiveSum(values: [1,-4,-7,-12]))

//: [Next](@next)
