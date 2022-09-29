import UIKit

// MARK: - base class
// Реализуйте некоторый базовый класс из выбранной вами области описания (тематики).
class Person {
    private (set) var name: String
    private (set) var surname: String
    
    private var uid: UInt?
    
    private var dateOfBirth: (day: UInt8, month: UInt8, year: UInt16)?
    
    init(name: String, surname: String) {
        self.name = name
        self.surname = surname
        uid = UInt.random(in: 1...UInt.max)
    }
    
    public func getInfo() -> String {
        "I'm just Person. My name is \(name)"
    }
}

// MARK: - extension
// Добавьте в него свойства и методы, а также несколько инициализаторов. Класс должен содержать свойства и методы разной области видимости (private, fileprivate, internal или public)
extension Person {
    convenience init() {
        self.init(name: "anonymous", surname: "anonymous")
    }
    
    public func dateOfBirth(day: UInt8, month: UInt8, year: UInt16) {
        dateOfBirth = (day, month, year)
    }
    
    public func age() -> UInt16? {
        guard let dateOfBirth = dateOfBirth else {
            return nil
        }
        
        return UInt16(Calendar.current.component(.year, from: Date())) - dateOfBirth.year
    }
}

// MARK: - inheritance
// Создайте несколько классов-наследников. Переопределите при необходимости свойства и методы родителя. А также добавьте свои.
class Employee: Person {
    private var position: String
    private var room: UInt?
    private var cardId: UInt?
    
    init(name: String, surname: String, position: String) {
        self.position = position
        super.init(name: name, surname: surname)
    }
    
    public func setRoom(room: UInt) {
        self.room = room
    }
    
    override func getInfo() -> String {
        let greetings = "I'm Employee. My name is \(name)"
        let age = age() != nil ? "\nI'm \(String(age()!))" : ""
        let post = "\nMy position is \(position)"
        
        return greetings + age + post
    }
}

class Guest: Person {
    override func getInfo() -> String {
        "I'm Guest. My name is \(name)"
    }
}

// MARK: - test
// В основном пространстве Playground создайте функцию для демонстрации полиморфизма.
var persons: [Person] = []

persons.append(Employee(name: "Konstantin", surname: "Kungurov", position: "Developer"))
persons.last?.dateOfBirth(day: 29, month: 5, year: 1988)

persons.append(Guest())

func printInfo(persons: [Person]) {
    persons.forEach { person in
        print("----------------------------")
        print(person.getInfo())
    }
}

printInfo(persons: persons)
