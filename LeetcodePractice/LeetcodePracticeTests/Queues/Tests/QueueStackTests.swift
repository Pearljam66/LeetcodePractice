//
//  QueueStackTests.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/8/24.
//

import XCTest

final class QueueStackTests: XCTestCase {

    func testEnqueueAndDequeue() {
        var queue = QueueStack<Int>()
        XCTAssertTrue(queue.isEmpty)

        queue.enqueue(1)
        XCTAssertFalse(queue.isEmpty)
        XCTAssertEqual(queue.peek, 1)

        queue.enqueue(2)
        XCTAssertFalse(queue.isEmpty)
        XCTAssertEqual(queue.peek, 1)

        XCTAssertEqual(queue.dequeue(), 1)
        XCTAssertFalse(queue.isEmpty)
        XCTAssertEqual(queue.peek, 2)

        XCTAssertEqual(queue.dequeue(), 2)
        XCTAssertTrue(queue.isEmpty)
        XCTAssertNil(queue.peek)
        XCTAssertNil(queue.dequeue())
    }

    func testPeek() {
        var queue = QueueStack<String>()
        XCTAssertNil(queue.peek)

        queue.enqueue("a")
        XCTAssertEqual(queue.peek, "a")

        queue.enqueue("b")
        XCTAssertEqual(queue.peek, "a")

        queue.dequeue()
        XCTAssertEqual(queue.peek, "b")

        queue.dequeue()
        XCTAssertNil(queue.peek)
    }

    func testIsEmpty() {
        var queue = QueueStack<Double>()
        XCTAssertTrue(queue.isEmpty)

        queue.enqueue(3.14)
        XCTAssertFalse(queue.isEmpty)

        queue.dequeue()
        XCTAssertTrue(queue.isEmpty)
    }
}
