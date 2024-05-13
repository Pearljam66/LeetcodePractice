//
//  BinarySearchTree.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/13/24.
//

public struct BinarySearchTree<Element: Comparable> {

    public private(set) var root: BinaryNodeTwo<Element>?

    public init() {}
}

extension BinarySearchTree: CustomStringConvertible {

    public var description: String {
        guard let root = root else { return "empty tree" }
        return String(describing: root)
    }

}

extension BinarySearchTree {

    public mutating func insert(_ value: Element) {
        root = insert(from: root, value: value)
    }

    private func insert(from node: BinaryNodeTwo<Element>?, value: Element) -> BinaryNodeTwo<Element> {

        guard let node = node else {
            return BinaryNodeTwo(value: value)
        }

        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }

        return node
    }
}

extension BinarySearchTree {

    public func contains(_ value: Element) -> Bool {
        var current = root

        while let node = current {
            if node.value == value {
                return true
            }

            if value < node.value {
                current = node.leftChild
            } else {
                current = node.rightChild
            }
        }
        return false
    }

}
