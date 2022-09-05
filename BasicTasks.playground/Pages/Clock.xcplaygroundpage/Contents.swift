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
let MSECONDS_IN_SECOND = 1000
let SECONDS_IN_MINUTE = 60
let MINUTES_IN_HOUR = 60

func clockTime(_ h: Int?, _ m: Int?, _ s: Int?) -> Int? {
    guard let h = h, let m = m, let s = s else {
        return nil;
    }
    
    return (h * MINUTES_IN_HOUR * SECONDS_IN_MINUTE * MSECONDS_IN_SECOND) +
            (m * SECONDS_IN_MINUTE * MSECONDS_IN_SECOND) +
            (s * MSECONDS_IN_SECOND)
}

print(clockTime(0, nil, 1) as Any)
print(clockTime(1, 1, 1) as Any)
print(clockTime(0, 1, 1) as Any)
//: [Next](@next)

