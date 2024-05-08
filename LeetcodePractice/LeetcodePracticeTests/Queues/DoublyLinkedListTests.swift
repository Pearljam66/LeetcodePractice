//
//  DoublyLinkedListTests.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/8/24.
//

import XCTest

final class DoublyLinkedListTests: XCTestCase {

    func testIsEmpty() throws {
        let list = DoublyLinkedList<Int>()
        XCTAssertTrue(list.isEmpty)
        list.append(5)
        XCTAssertFalse(list.isEmpty)
    }

    func testAppend() throws {
        let list = DoublyLinkedList<String>()
        list.append("apple")
        XCTAssertEqual(list.first?.value, "apple")
        list.append("banana")
        XCTAssertEqual(list.first?.value, "apple")
        XCTAssertEqual(list.first?.next?.value, "banana")
    }

    func testRemove() throws {
        let list = DoublyLinkedList<Double>()
        list.append(3.14)
        list.append(2.71)
        XCTAssertEqual(list.remove(list.first!), 3.14)
        XCTAssertEqual(list.first?.value, 2.71)
        XCTAssertNil(list.first?.next)
    }

    func testDescription() throws {
        let list = DoublyLinkedList<Character>()
        XCTAssertEqual(list.description, "end")
        list.append("a")
        list.append("b")
        XCTAssertEqual(list.description, "a -> b -> end")
    }

    func testIteration() throws {
        let list = DoublyLinkedList<Int>()
        list.append(1)
        list.append(2)
        list.append(3)

        var values: [Int] = []
        for node in list {
            values.append(node.value)
        }

        XCTAssertEqual(values, [1, 2, 3])
    }
}

