//
//  LinkedListTests.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/1/24.
//

import XCTest

final class LinkedListTests: XCTestCase {

    func testPush() throws {
        var list = LinkedList<Int>()
        list.push(1)
        list.push(2)
        list.push(3)

        XCTAssertEqual(list.head?.value, 3)
        XCTAssertEqual(list.head?.next?.value, 2)
        XCTAssertEqual(list.tail?.value, 1)
    }

    func testAppend() throws {
        var list = LinkedList<Int>()
        list.append(1)
        list.append(2)
        list.append(3)

        XCTAssertEqual(list.head?.value, 1)
        XCTAssertEqual(list.head?.next?.value, 2)
        XCTAssertEqual(list.tail?.value, 3)
    }

    func testNodeAtIndex() throws {
        var list = LinkedList<Int>()
        list.push(1)
        list.push(2)
        list.push(3)

        XCTAssertEqual(list.node(at: 0)?.value, 3)
        XCTAssertEqual(list.node(at: 1)?.value, 2)
        XCTAssertEqual(list.node(at: 2)?.value, 1)
        XCTAssertNil(list.node(at: 3))
    }

    func testInsertAfterNode() throws {
        var list = LinkedList<Int>()
        list.push(1)
        list.push(2)
        list.push(3)

        var node = list.node(at: 1)!
        list.insert(10, after: node)
        node = list.node(at: 2)!
        list.insert(69, after: node)

        XCTAssertEqual(list.head?.value, 3)
        XCTAssertEqual(list.head?.next?.value, 2)
        XCTAssertEqual(list.head?.next?.next?.value, 10)
        XCTAssertEqual(list.head?.next?.next?.next?.value, 69)
        XCTAssertEqual(list.tail?.value, 1)
    }

    func testIsEmpty() throws {
        var list = LinkedList<Int>()
        XCTAssertTrue(list.isEmpty)

        list.push(66)
        XCTAssertFalse(list.isEmpty)

        list.pop()
        XCTAssertTrue(list.isEmpty)
    }

    func testPop() throws {
        var list = LinkedList<Int>()
        list.push(1)
        list.push(2)
        list.push(3)

        XCTAssertEqual(list.pop(), 3)
        XCTAssertEqual(list.pop(), 2)
        XCTAssertEqual(list.pop(), 1)
        XCTAssertNil(list.pop())

        XCTAssertTrue(list.isEmpty)
        XCTAssertNil(list.head)
        XCTAssertNil(list.tail)
    }

    func testRemoveLast() {
        var list = LinkedList<Int>()
        list.push(1)
        list.push(2)
        list.push(3)

        XCTAssertEqual(list.removeLast(), 1)
        XCTAssertEqual(list.head?.value, 3)
        XCTAssertEqual(list.tail?.value, 2)
        XCTAssertNil(list.tail?.next)
    }

    func testReverse() {
        var list = LinkedList<Int>()
        list.append(1)
        list.append(2)
        list.append(3)

        list.reverse()

        XCTAssertEqual(list.description, "3 -> 2 -> 1  ")
    }

}
