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

    // Update the equality check to compare references only
    public static func == (lhs: Node<Value>, rhs: Node<Value>) -> Bool {
        return lhs === rhs
    }
}

extension Node: CustomStringConvertible {

    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}
