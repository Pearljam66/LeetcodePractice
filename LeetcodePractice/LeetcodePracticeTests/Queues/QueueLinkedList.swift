//
//  QueueLinkedList.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/8/24.
//

public class QueueLinkedList<T>: Queue {

    public var list = DoublyLinkedList<T>()
    public init() {}

    // Insert an element at the back of the queue. Returns true if the operation was successful.
    public func enqueue(_ element: T) -> Bool {
        list.append(element)
        return true
    }

    // Remove the element at the front of the queue and return it.
    public func dequeue() -> T? {
        guard !list.isEmpty, let element = list.first else {
            return nil
        }
        return list.remove(element)
    }

    // Check if the queue is empty.
    public var isEmpty: Bool {
        list.isEmpty
    }

    // Return the element at the front of the queue without removing it.
    public var peek: T? {
        list.first?.value
    }
}

extension QueueLinkedList: CustomStringConvertible {
    public var description: String {
        String(describing: list)
    }
}
