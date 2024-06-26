//
//  BinaryNodeTwo.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/13/24.
//

public class BinaryNodeTwo<Element> {

    public var value: Element
    public var leftChild: BinaryNodeTwo?
    public var rightChild: BinaryNodeTwo?

    public init(value: Element) {
        self.value = value
    }
}

extension BinaryNodeTwo: CustomStringConvertible {

    public var description: String {
        diagram(for: self)
    }

    private func diagram(for node: BinaryNodeTwo?, _ top: String = "", _ root: String = "", _ bottom: String = "") -> String {
        guard let node = node else {
            return root + "nil\n"
        }

        if node.leftChild == nil && node.rightChild == nil {
            return root + "\(node.value)\n"
        }

        return diagram(for: node.rightChild, top + " ", top + "┌──", top + "│ ")
        + root + "\(node.value)\n"
        + diagram(for: node.leftChild, bottom + "│ ", bottom + "└──", bottom + " ")
    }
}

extension BinaryNodeTwo {

    public func traverseInOrder(visit: (Element) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }

    public func traversePreOrder(visit: (Element) -> Void) {
        visit(value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
    }

    public func traversePostOrder(visit: (Element) -> Void) {
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }
}
