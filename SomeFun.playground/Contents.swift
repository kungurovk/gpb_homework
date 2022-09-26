// Написать несколько функций

import UIKit

let getRandomNumber = { Int32.random(in: Int32.min...Int32.max) }

// MARK: - 1/4
// функция складывает две целочисленных переменных - отдает на выходе сумму.

func sum(firstNumber: Int32, secondNumber : Int32) -> Int64 {
    Int64(firstNumber) + Int64(secondNumber)
}

let firstRandomNumber = getRandomNumber()
let secondRandomNumber = getRandomNumber()
print("First random number: \(firstRandomNumber)")
print("Second random number: \(secondRandomNumber)")
print("Two numbers sum: \(sum(firstNumber: firstRandomNumber, secondNumber: secondRandomNumber))")
print("-----------------------------")

// MARK: - 2/4
// функция принимает кортеж из числа и строки приводит число к строке и ввыводит в консоль резуультат.

extension Int32 {
    func toString() -> String {
        String(self)
    }
}

func tupleToString(_ tuple: (String, Int32)) {
    print(tuple.0, tuple.1.toString())
}

tupleToString(("value: ", getRandomNumber()))
print("-----------------------------")

// MARK: - 3/4
// функция принимает на вход опциональное замыкание и целое число, выполняет замыкание только. в случае если число больше 0.

func positiveClosureExec(with number: Int32, closure: (Int32) -> ()) {
    guard number > 0 else {
        print(number.toString(), "is negative number.")
        return
    }
    
    closure(number)
}

positiveClosureExec(with: getRandomNumber(), closure: { (number: Int32) -> () in print(number.toString(), "is positive number.") } )
print("-----------------------------")

// MARK: - 4/4
// функция принимает число на вход (год), проверить високосный ли он.

let g_everyFewYears: UInt = 4

func isLeap(test year: UInt) -> Bool {
    year % g_everyFewYears == 0
}

var year = UInt.random(in: 1...2033)
print("Is \(year) a leap year?")
print(isLeap(test: year))