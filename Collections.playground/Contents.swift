//Работа с коллекциями

import UIKit

// MARK: - 1/3
// Есть произвольный массив чисел, найти максимальное и минимальное число и поменять их местами

let g_amountOfNumbers = 10

let getArrayOfNumbers = { (1...g_amountOfNumbers).map( {_ in Int.random(in: 1...g_amountOfNumbers)} ) }

func swapNumbers(from arrayOfNumbers: inout [Int]) {
    guard !arrayOfNumbers.isEmpty else {
        return
    }
    
    var minIndex: Int = 0
    var maxIndex: Int = 0
    for currentIndex in 1..<arrayOfNumbers.count {
        minIndex = arrayOfNumbers[currentIndex] < arrayOfNumbers[minIndex] ? currentIndex : minIndex
        maxIndex = arrayOfNumbers[currentIndex] > arrayOfNumbers[maxIndex] ? currentIndex : maxIndex
    }

    print("minIndex: \(minIndex)", "maxIndex:\(maxIndex)")
    arrayOfNumbers.swapAt(minIndex, maxIndex)
}

var arrayOfNumbers = getArrayOfNumbers()

print(arrayOfNumbers)
swapNumbers(from: &arrayOfNumbers)
print(arrayOfNumbers)
print("-------------------------------")

// MARK: - 2/3
// Есть два массива символов - собрать результирующее множество из символов, что повторяются в 2х массивах

let charRange = UnicodeScalar("A").value...UnicodeScalar("Z").value
let getArrayOfCharacters = { (charRange).map( {_ in Character(UnicodeScalar(charRange.randomElement()!)!) } ) }

let firstArrayOfChars = getArrayOfCharacters()
let secondArrayOfChars = getArrayOfCharacters()

print(firstArrayOfChars)
print(secondArrayOfChars)

func getSetIntersection(_ firstArray: [Character], _ secondArray: [Character]) -> Set<Character> {
    Set(firstArrayOfChars).intersection(secondArrayOfChars)
}

print(getSetIntersection(firstArrayOfChars, secondArrayOfChars))

//MARK: - 3/3
// Создать словарь с соотношением имя (ключ) пользователя - пароль (значение), получить из словаря все имена, пароли которых длиннее 10 символов

