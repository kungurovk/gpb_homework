//Сгенерировать массив случайных чисел
//Описание/Пошаговая инструкция выполнения домашнего задания:
//Сгенерировать массив случайных чисел (например 200 чисел). Найти индекс первого повторяющегося числа в массиве. Если все числа разные - то -1.
//Пример : [3, 4, 5, 6, 8, 78, 67, 4, 88] - 4, индекс 1

import UIKit

let g_amountOfNumbers = 200

let getArrayOfNumbers = { (1...g_amountOfNumbers).map( {_ in Int.random(in: 1...g_amountOfNumbers)} ) }

func getFirstEntry(from numbers: [Int], startWith currentIndex: Int = 0) -> Int
{
    guard currentIndex < numbers.count else {
        return -1
    }
    
    for index in (currentIndex + 1)..<numbers.count {
        if(numbers[currentIndex] == numbers[index]) {
            return currentIndex
        }
    }
    
    return getFirstEntry(from: numbers, startWith: currentIndex + 1)
}

print("First found in [3, 4, 5, 6, 8, 78, 67, 4, 88]: \(getFirstEntry(from: [3, 4, 5, 6, 8, 78, 67, 4, 88]))")

var findedIndex: Int;
repeat {
    let arrayOfNumbers = getArrayOfNumbers()
    findedIndex = getFirstEntry(from: arrayOfNumbers)
    print("\nFirst found in \(arrayOfNumbers): \(findedIndex)")
} while findedIndex < 3

