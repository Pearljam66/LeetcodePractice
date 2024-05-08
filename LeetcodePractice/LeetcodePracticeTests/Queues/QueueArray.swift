//
//  QueueArray.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/8/24.
//

import Foundation

public struct QueueArray<T>: Queue {

    private var array: [T] = []
    public init() { }

    // Check if the queue is empty.
    public var isEmpty: Bool {
        array.isEmpty
    }

    // Return the element in the front of the queue.
    public var peek: T? {
        array.first
    }

    // Insert an element at the back of the queue. Returns true if the operation was successful.
    public mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }

    // Remove the element at the front of the queue and return it.
    public mutating func dequeue() -> T? {
        isEmpty ? nil : array.removeFirst()
    }
}

extension QueueArray: CustomStringConvertible {

    public var description: String {
            String(describing: array)
        }

}
