//
//  QueueRingBuffer.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/8/24.
//

public struct QueueRingBuffer<T>: Queue {
    private var ringBuffer: RingBuffer<T>

    public init(count: Int) {
        ringBuffer = RingBuffer<T>(count: count)
    }

    // Check if the queue is empty.
    public var isEmpty: Bool {
        ringBuffer.isEmpty
    }

    // Return the element at the front of the queue without removing it.
    public var peek: T? {
        ringBuffer.first
    }

    // Insert an element at the back of the queue. Returns true if the operation was successful.
    public mutating func enqueue(_ element: T) -> Bool {
        ringBuffer.write(element)
    }

    // Remove the element at the front of the queue and return it.
    public mutating func dequeue() -> T? {
        ringBuffer.read()
    }
}

extension QueueRingBuffer: CustomStringConvertible {
    public var description: String {
        String(describing: ringBuffer)
    }
}
