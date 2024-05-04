//
//  LinkedList.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/4/24.
//

// Chapter 6 & 7: Linked Lists
// A linked list is a collection of values arranged in a linear, unidirectional sequence.
// A linked list has the concept of a head and a tail, which refers to the first and last nodes of the list, respectively.

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

    public mutating func pop() -> Value? {
        copyNodes()
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }

    public mutating func removeLast() -> Value? {
        guard let head = head else { return nil }
        guard head.next != nil else { return nil }

        var prev = head
        var current = head

        while let next = current.next {
            prev = current
            current = next
        }

        prev.next = nil
        tail = prev
        return current.value
    }

    private mutating func copyNodes() {
        guard !isKnownUniquelyReferenced(&head) else {
            return
        }
        guard var oldNode = head else {
            return
        }

        head = Node(value: oldNode.value)
        var newNode = head

        while let nextOldNode = oldNode.next {
            newNode!.next = Node(value: nextOldNode.value)
            newNode = newNode!.next
            oldNode = nextOldNode
        }

        tail = newNode
    }

    private mutating func copyNodes(returningCopyOf node: Node<Value>?) -> Node<Value>? {
        guard !isKnownUniquelyReferenced(&head) else {
            return nil
        }
        guard var oldNode = head else {
            return nil
        }

        head = Node(value: oldNode.value)
        var newNode = head
        var nodeCopy: Node<Value>?

        while let nextOldNode = oldNode.next {
            if oldNode === node {
                nodeCopy = newNode
            }
            newNode!.next = Node(value: nextOldNode.value)
            newNode = newNode!.next
            oldNode = nextOldNode
        }

        return nodeCopy
    }

    public func printList() {
        var currentNode = head
        print("...Printing list...")
        while let node = currentNode {
            print(node.value, terminator: " ")
            currentNode = node.next
        }
        print()
        print("...Done printing list...")
    }
}
