//
//  StacksTests.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/1/24.
//

import XCTest

// Chapter 4: Stacks
// Last in, First out

public struct Stack<Element> {
    private var storage: [Element] = []

    public init() {}

    // Add an item to the top of the stack.
    public mutating func push(_ element: Element) {
        storage.append(element)
    }

    // Removes the top item from the stack.
    public mutating func pop() -> Element? {
        storage.popLast()
    }

    // Returns the top item in the stack.
    public func peek() -> Element? {
        storage.last
    }

    public var isEmpty: Bool {
        storage.isEmpty
    }

}

final class StackTests: XCTestCase {

    func testPushPop() throws {
        var stack = Stack<Int>()
        stack.push(1)
        print(stack)
        stack.push(2)
        print(stack)

        XCTAssertEqual(stack.pop(), 2)
        print(stack)
        XCTAssertEqual(stack.pop(), 1)
        print(stack)
    }

    func testPeek() throws {
        var stack = Stack<Int>()

        stack.push(3)
        stack.push(4)
        stack.push(74)
        print(stack)
        stack.pop()
        print(stack)

        XCTAssertEqual(stack.peek(), 4)
    }

    func testIsEmpty() throws {
        var stack = Stack<Int>()

        XCTAssertEqual(stack.isEmpty, true)

        stack.push(69)
        stack.push(12)

        XCTAssertFalse(stack.isEmpty)

        stack.pop()
        stack.pop()

        XCTAssertTrue(stack.isEmpty)
    }

}
