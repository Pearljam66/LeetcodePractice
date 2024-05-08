//
//  QueueRingBufferTests.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/8/24.
//

import XCTest

final class QueueRingBufferTests: XCTestCase {

    func testInitialization() {
        let queue = QueueRingBuffer<Int>(count: 5)
        XCTAssertTrue(queue.isEmpty)
        XCTAssertNil(queue.peek)
    }

    func testEnqueueAndDequeue() {
        var queue = QueueRingBuffer<Int>(count: 3)
        XCTAssertTrue(queue.enqueue(1))
        XCTAssertTrue(queue.enqueue(2))
        XCTAssertTrue(queue.enqueue(3))
        XCTAssertFalse(queue.enqueue(4)) // Queue is full

        XCTAssertEqual(queue.dequeue(), 1)
        XCTAssertEqual(queue.dequeue(), 2)
        XCTAssertEqual(queue.dequeue(), 3)
        XCTAssertNil(queue.dequeue()) // Queue is empty
    }

    func testPeek() {
        var queue = QueueRingBuffer<Int>(count: 3)
        XCTAssertNil(queue.peek)

        XCTAssertTrue(queue.enqueue(1))
        XCTAssertEqual(queue.peek, 1)

        XCTAssertTrue(queue.enqueue(2))
        XCTAssertEqual(queue.peek, 1)

        XCTAssertTrue(queue.enqueue(3))
        XCTAssertEqual(queue.peek, 1)

        XCTAssertEqual(queue.dequeue(), 1)
        XCTAssertEqual(queue.peek, 2)
    }

    func testDescription() {
        var queue = QueueRingBuffer<Int>(count: 3)
        XCTAssertTrue(queue.enqueue(1))
        XCTAssertTrue(queue.enqueue(2))
        XCTAssertEqual(queue.description, "[Optional(1), Optional(2)]")
    }
}

