
import UIKit

// MARK: - generic class
// Реализуйте дженерик-класс для структуры данных Stack, Deque или Queue.

class QueueDoublyStackBased<Element>: Queue {
    private var leftStack: [Element] = []
    private var rightStack: [Element] = []
    
    func enqueue(_ element: Element) {
        rightStack.append(element)
    }
    
    func dequeue() -> Element? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        return leftStack.popLast()
    }
    
    var isEmpty: Bool {
        get {
            leftStack.isEmpty && rightStack.isEmpty
        }
    }
    var peek: Element? {
        get {
            !leftStack.isEmpty ? leftStack.last : rightStack.first
        }
    }
}

// MARK: - methods
// Класс должен содержать дженерик-методы согласно выбранному типу структуры данных.

public protocol Queue {
    associatedtype Element
    func enqueue(_ element: Element)
    func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}

// MARK: - tests
// В Playground основном пространстве напишите пример с использованием созданного класса

extension QueueDoublyStackBased: CustomStringConvertible {
    var description: String {
        let list = leftStack + rightStack.reversed()
        return list.description
    }
}

var citiesQueue = QueueDoublyStackBased<String>()
citiesQueue.enqueue("Moscow")
citiesQueue.enqueue("London")
citiesQueue.enqueue("New York")
citiesQueue.dequeue()
citiesQueue
citiesQueue.peek

citiesQueue.enqueue("Monaco")
citiesQueue.dequeue()
citiesQueue
citiesQueue.peek


var queue = QueueDoublyStackBased<Int>()
for index in 1...5 {
    queue.enqueue(index)
}
queue.dequeue()
queue.dequeue()
queue
queue.peek
