//
//  Node.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/4/24.
//

public class Node<T> {
    public var value: T
    public var next: Node<T>?
    public var previous: Node<T>?

    public init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }

}

extension Node: CustomStringConvertible {

    public var description: String {
        String(describing: value)
    }
}
