//: [Previous](@previous)

import Foundation

/*
 Write a program that finds the summation of every number from 1 to num. The number will always be a positive integer greater than 0.

 For example:

 summation(2) -> 3
 1 + 2

 summation(8) -> 36
 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8

 */

func summation(_ n: Int) -> Int {
    guard n > 0 else {
        return 0
    }
    return n + summation(n-1)
}

print(summation(0))
print(summation(8))
print(summation(10))

//: [Next](@next)
