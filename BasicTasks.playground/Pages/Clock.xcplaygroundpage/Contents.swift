//: [Previous](@previous)

import Foundation

/*
 Clock shows h hours, m minutes and s seconds after midnight.

 Your task is to write a function which returns the time since midnight in milliseconds.

 h = 0
 m = 1
 s = 1

 result = 61000

 if some of parameter nil - return nil
 */

func clockTime(_ h: Int?, _ m: Int?, _ s: Int?) -> Int? {
    guard let h = h, let m = m, let s = s else {
        return nil;
    }
    
    return (h * 60 * 60 * 1000) + (m * 60 * 1000) + (s * 1000)
}

print(clockTime(0, nil, 1) as Any)
print(clockTime(1, 1, 1) as Any)
print(clockTime(0, 1, 1) as Any)
//: [Next](@next)

