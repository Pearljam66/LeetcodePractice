//
//  Queue.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/8/24.
//

public protocol Queue {

    associatedtype Element

    // Insert an element at the back of the queue. Returns true if the operation was successful.
    mutating func enqueue(_ element: Element) -> Bool

    // Remove the element at the front of the queue and return it.
    mutating func dequeue() -> Element?

    // Check if the queue is empty.
    var isEmpty: Bool { get }

    // Return the element at the front of the queue without removing it.
    var peek: Element? { get }
}
