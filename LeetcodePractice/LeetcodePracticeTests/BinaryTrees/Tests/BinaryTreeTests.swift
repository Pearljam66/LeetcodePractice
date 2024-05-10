//
//  BinaryTreeTests.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/10/24.
//

import XCTest

final class BinaryTreeTests: XCTestCase {

    var tree: BinaryNode<Int> = {
        let zero = BinaryNode(value: 0)
        let one = BinaryNode(value: 1)
        let five = BinaryNode(value: 5)
        let seven = BinaryNode(value: 7)
        let eight = BinaryNode(value: 8)
        let nine = BinaryNode(value: 9)

        seven.leftChild = one
        one.leftChild = zero
        one.rightChild = five
        seven.rightChild = nine
        nine.leftChild = eight

        return seven
    }()

    // Challenge 1
    func height<T>(of node: BinaryNode<T>?) -> Int {
        guard let node = node else {
            return -1
        }

        let leftHeight = height(of: node.leftChild)
        let rightHeight = height(of: node.rightChild)

        return 1 + max(leftHeight, rightHeight)
    }

    func testBinaryNodeDescriptionSingleNode() {
        // Create a single node binary tree
        let rootNode = BinaryNode(value: 10)

        // Expected tree structure
        let expectedDescription = "10\n"

        XCTAssertEqual(rootNode.description, expectedDescription)
    }

    func testTraverseInOrder() {
        var result = [Int]()
        tree.traverseInOrder { value in
            result.append(value)
        }

        XCTAssertEqual(result, [0, 1, 5, 7, 8, 9])
    }

    func testTraversePreOrder() {
        var result = [Int]()
        tree.traversePreOrder { value in
            result.append(value)
        }

        XCTAssertEqual(result, [7, 1, 0, 5, 9, 8])
    }

    func testTraversePostOrder() {
        var result = [Int]()
        tree.traversePostOrder { value in
            result.append(value)
        }

        XCTAssertEqual(result, [0, 5, 1, 8, 9, 7])
    }

    func testHeight() {
        XCTAssertEqual(height(of: tree), 2)
    }

}
