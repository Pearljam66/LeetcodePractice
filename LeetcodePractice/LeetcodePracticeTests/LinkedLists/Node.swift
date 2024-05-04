//
//  Node.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/4/24.
//

public class Node<Value> {
    public var value: Value
    public var next: Node?

    public init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}
