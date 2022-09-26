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



print("-----------------------------")

// MARK: - 4/4
// функция принимает число на вход (год), проверить високосный ли он.

