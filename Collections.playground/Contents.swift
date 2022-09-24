//Работа с коллекциями

import UIKit

// MARK: - 1/3
// Есть произвольный массив чисел, найти максимальное и минимальное число и поменять их местами
let getArrayOfNumbers = {
    (amount: Int, startEnd: ClosedRange<Int>) -> [Int] in
    (1...amount).map( {_ in Int.random(in: startEnd) } )
}

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

var arrayOfNumbers = getArrayOfNumbers(10, -10...10)

print("Default array: \(arrayOfNumbers)")
swapNumbers(from: &arrayOfNumbers)
print("Changed array: \(arrayOfNumbers)")
print("-------------------------------")

// MARK: - 2/3
// Есть два массива символов - собрать результирующее множество из символов, что повторяются в 2х массивах

let charRange = UnicodeScalar("A").value...UnicodeScalar("Z").value
let getArrayOfCharacters = { (charRange).map( {_ in Character(UnicodeScalar(charRange.randomElement()!)!) } ) }

let firstArrayOfChars = getArrayOfCharacters()
let secondArrayOfChars = getArrayOfCharacters()

print("First array: \(firstArrayOfChars)")
print("Second array: \(secondArrayOfChars)")

func getSetIntersection(_ firstArray: [Character], _ secondArray: [Character]) -> Set<Character> {
    Set(firstArrayOfChars).intersection(secondArrayOfChars)
}

print("Intersection result: \(getSetIntersection(firstArrayOfChars, secondArrayOfChars))")
print("-------------------------------")

//MARK: - 3/3
// Создать словарь с соотношением имя (ключ) пользователя - пароль (значение), получить из словаря все имена, пароли которых длиннее 10 символов

var userMap: [String: String] = [:]

for _ in 1...10 {
    let userName = String(getArrayOfCharacters().dropLast(Int.random(in: 10...15)))
    let password = getArrayOfNumbers(Int.random(in: 5...15), 0...9).map{ String($0) }.joined()
    userMap[userName] = password
}

print("All users: \(userMap)")

func getLongPasswordUsers(from map: [String : String], maxLength: Int = 10) -> [String : String] {
    return map.filter({ $0.value.count > maxLength })
}

print("Users with long passwords: \(getLongPasswordUsers(from: userMap))")
