//
//  QueueStack.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/8/24.
//

public struct QueueStack<T>: Queue {
    private var leftStack: [T] = []
    private var rightStack: [T] = []
    public init() { }

    public var isEmpty: Bool {
        leftStack.isEmpty && rightStack.isEmpty
    }

    // Returns the element at the top.
    public var peek: T? {
        !leftStack.isEmpty ? leftStack.last : rightStack.first
    }

    public mutating func enqueue(_ element: T) -> Bool {
        rightStack.append(element)
        return true
    }

    public mutating func dequeue() -> T? {
        // Check to see if the stack is empty.
        if leftStack.isEmpty {
            // If the left stack is empty set it to the reverse of the right stack.
            leftStack = rightStack.reversed()
            // Invalidate your right stack. Since you have transferred everything to the left, just clear the right stack.
            rightStack.removeAll()
        }
        // Remove the last element from the left stack.
        return leftStack.popLast()
    }

}
