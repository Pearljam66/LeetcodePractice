//
//  LinkedListTests.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/1/24.
//

// Chapter 6 & 7: Linked Lists
// A linked list is a collection of values arranged in a linear, unidirectional sequence.
// A linked list has the concept of a head and a tail, which refers to the first and last nodes of the list, respectively.

public class Node<Value> {
    public var value: Value
    public var next: Node?

    public init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

public struct LinkedList<Value> {
    public var head: Node<Value>?
    public var tail: Node<Value>?

    public init() { }

    public var isEmpty: Bool {
        head == nil
    }

    // Adding a value at the front of the list is known as a push operation.
    // AKA head-first insertion
    public mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }

    // Adds a value at the end of the list.
    // AKA tail-end insertion
    public mutating func appendToTail(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }

        tail!.next = Node(value: value)
        tail = tail!.next
    }

    public func node(at index: Int) -> Node<Value>? {
        var currentNode = head
        var currentIndex = 0

        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        return currentNode
    }

    public mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
        guard tail !== node else {
            appendToTail(value)
            return tail!
        }

        node.next = Node(value: value, next: node.next)
        return node.next!
    }

    public func printList() {
        var currentNode = head

        while let node = currentNode {
            print(node.value, terminator: " ")
            currentNode = node.next
        }
        print()
    }
}

import XCTest

final class LinkedListTests: XCTestCase {


    func testPush() throws {
        var list = LinkedList<Int>()
        list.push(1)
        list.push(2)
        list.push(3)

        list.printList()

        XCTAssertEqual(list.head?.value, 3)
        XCTAssertEqual(list.head?.next?.value, 2)
        XCTAssertEqual(list.tail?.value, 1)
    }


}
