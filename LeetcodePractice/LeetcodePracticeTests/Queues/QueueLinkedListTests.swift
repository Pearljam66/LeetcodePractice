//
//  QueueLinkedListTests.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/8/24.
//

import XCTest

final class QueueLinkedListTests: XCTestCase {

    func testIsEmpty() throws {
        let queue = QueueLinkedList<Int>()
        XCTAssertTrue(queue.isEmpty)
        queue.enqueue(5)
        XCTAssertFalse(queue.isEmpty)
    }

    func testPeek() throws {
        let queue = QueueLinkedList<String>()
        XCTAssertNil(queue.peek)
        queue.enqueue("Hello")
        XCTAssertEqual(queue.peek, "Hello")
    }

    func testEnqueue() throws {
        let queue = QueueLinkedList<Double>()
        XCTAssertTrue(queue.enqueue(3.14))
        XCTAssertEqual(queue.peek, 3.14)
        XCTAssertTrue(queue.enqueue(2.71))
        XCTAssertEqual(queue.peek, 3.14)
    }

    func testDequeue() throws {
        var queue = QueueLinkedList<Character>()
        XCTAssertNil(queue.dequeue())
        queue.enqueue("a")
        queue.enqueue("b")
        XCTAssertEqual(queue.dequeue(), "a")
        XCTAssertEqual(queue.dequeue(), "b")
        XCTAssertNil(queue.dequeue())
    }

    func testDescription() throws {
        let queue = QueueLinkedList<String>()
        XCTAssertEqual(queue.description, "end")
        queue.enqueue("apple")
        queue.enqueue("banana")
        XCTAssertEqual(queue.description, "apple -> banana -> end")
    }
}

