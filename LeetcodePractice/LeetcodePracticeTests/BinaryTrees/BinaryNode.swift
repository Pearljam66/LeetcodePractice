//
//  BinaryNode.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/10/24.
//

public class BinaryNode<Element> {
    public var value: Element
    public var leftChild: BinaryNode?
    public var rightChild: BinaryNode?

    public init(value: Element) {
        self.value = value
    }
}

extension BinaryNode: CustomStringConvertible {

    public var description: String {
        diagram(for: self)
    }

    private func diagram(for node: BinaryNode?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
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

extension BinaryNode {

    // In-Order traversal visits the nodes of a binary tree in the following order, starting from the root node:
    // - If the current node has a left child, recursively visit this child first.
    // - Then, visit the node itself.
    // - If the current node has a right child, recursively visit this child.
    public func traverseInOrder(visit: (Element) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }

    // Pre-order traversal always visits the current node first, then recursively visits the left and right child.
    public func traversePreOrder(visit: (Element) -> Void) {
        visit(value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
    }

    // Post-order traversal only visits the current node after the left and right child have been visited recursively.
    public func traversePostOrder(visit: (Element) -> Void) {
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }
}
