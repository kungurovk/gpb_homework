
import UIKit
import Security

//MARK: - callback func
// Функция, принимающая функцию как параметр

func loggingPrint(description: (code: Int, text: String)) {
    print("Logging. code: \(description.code), text: \(description.text)")
    //save into file ...
}

func loggingSave(description: (code: Int, text: String)) { //e.g.
    //save into file...
}

func someUse( code: Int, callback: ((code: Int, text: String)) -> () ) {
    //... some action
    switch code {
    case -1:
        callback((-1, "Some small error!"))
    case -2:
        callback((-2, "Slightly more error!"))
    default:
        callback((0, "All right!"))
    }
}

someUse(code: -1, callback: loggingPrint)
someUse(code: -2, callback: loggingPrint)
someUse(code: 0, callback: loggingPrint)
print("--------------------------------------")

//MARK: - with some closures func
// Функция с несколькими замыканиями

let firstValue = 1
let secondValue = 2

func withSomeClosures(mainOperation: @escaping (Int, Int) -> (Int), secondaryOperation: @escaping (Int, Int) -> (Int)) {
    print("Result of main operation: \(mainOperation(firstValue, secondValue))")
    print("Result of secondary operation: \(secondaryOperation(firstValue, secondValue))")
}

withSomeClosures(mainOperation: {(first, second) in first * second}, secondaryOperation: { $0 - $1 })
print("--------------------------------------")

//MARK: - autoclosure func
// Функция с autoclosure

struct CitiesData {
    let citiesBirthdays: [(name: String, day: UInt8, month: UInt8)] =
    [("Moscow", 10, 9), ("St. Petersburg", 27, 5), ("Nizhny Novgorod", 20, 8)]
    
    var about: String {
        var text: String = ""
        for city in citiesBirthdays {
            text += ("Day of the city of " + city.name + ": " + String(city.day) + "." + String(city.month) + "\n")
        }
        return text
    }
}

let isPrintCitiesBirthday = true

func printLog(message: @autoclosure () -> String) {
    if(isPrintCitiesBirthday) {
        print(message())
    }
}

let cities = CitiesData()
printLog(message: cities.about)
print("--------------------------------------")

//MARK: - nested func
// Использование внутренних функций

enum Weather: String {
    case sun = "☀️"
    case rain = "🌧"
    case cold = "❄️"
}

func clothesForToday(weather: Weather) -> () -> String {
    func warmClothes() -> String {
        "\(weather.rawValue) mittens, felt boots, furcoat"
    }
    
    func waterproofClothes() -> String {
        "\(weather.rawValue) umbrella, rubber boots, raincoat"
    }
    
    func freeClothes() -> String {
        "\(weather.rawValue) glasses, beach slippers, shorts"
    }
    
    switch weather {
    case Weather.rain:
        return waterproofClothes
    case Weather.cold:
        return warmClothes
    default:
        return freeClothes
    }
}

var dressToday = clothesForToday(weather: Weather.rain)
print(dressToday())

dressToday = clothesForToday(weather: Weather.cold)
print(dressToday())
print("--------------------------------------")

//MARK: - generic func
// Дженерик-функция с условием

var numbers: [Int] = [1, 2, 3, 4]

func uniqueElement<T: Hashable>(from array: inout [T], element: T) -> T {
    guard let index = array.firstIndex(of: element) else {
        array.append(element)
        return array.last!
    }
    return array[index]
}

print(numbers)
uniqueElement(from: &numbers, element: 5)
print(numbers)
uniqueElement(from: &numbers, element: 5)
print(numbers)
uniqueElement(from: &numbers, element: 4)
print(numbers)
