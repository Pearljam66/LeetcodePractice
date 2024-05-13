//
//  BinarySearchTreeTests.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/13/24.
//

import XCTest

final class BinarySearchTreeTests: XCTestCase {

    func testInsert() {
        var bst = BinarySearchTree<Int>()
        bst.insert(5)
        bst.insert(3)
        bst.insert(7)
        bst.insert(1)
        bst.insert(4)
        bst.insert(6)
        bst.insert(8)

        XCTAssertEqual(bst.description, """
     ┌──8
    ┌──7
    │ └──6
    5
    │ ┌──4
    └──3
     └──1\n
    """)
    }

    func testTraverseInOrder() {
        var bst = BinarySearchTree<Int>()
        bst.insert(5)
        bst.insert(3)
        bst.insert(7)
        bst.insert(1)
        bst.insert(4)
        bst.insert(6)
        bst.insert(8)

        var elementsInOrder = [Int]()
        bst.root?.traverseInOrder { elementsInOrder.append($0) }

        XCTAssertEqual(elementsInOrder, [1, 3, 4, 5, 6, 7, 8])
    }

    func testTraversePreOrder() {
        var bst = BinarySearchTree<Int>()
        bst.insert(5)
        bst.insert(3)
        bst.insert(7)
        bst.insert(1)
        bst.insert(4)
        bst.insert(6)
        bst.insert(8)

        var elementsPreOrder = [Int]()
        bst.root?.traversePreOrder { elementsPreOrder.append($0) }

        XCTAssertEqual(elementsPreOrder, [5, 3, 1, 4, 7, 6, 8])
    }

    func testTraversePostOrder() {
        var bst = BinarySearchTree<Int>()
        bst.insert(5)
        bst.insert(3)
        bst.insert(7)
        bst.insert(1)
        bst.insert(4)
        bst.insert(6)
        bst.insert(8)

        var elementsPostOrder = [Int]()
        bst.root?.traversePostOrder { elementsPostOrder.append($0) }

        XCTAssertEqual(elementsPostOrder, [1, 4, 3, 6, 8, 7, 5])
    }

    func testContains() {
        var bst = BinarySearchTree<Int>()
        bst.insert(5)
        bst.insert(3)
        bst.insert(7)
        bst.insert(1)
        bst.insert(4)
        bst.insert(6)
        bst.insert(8)

        XCTAssertTrue(bst.contains(8))
        XCTAssertFalse(bst.contains(74))
        XCTAssertTrue(bst.contains(1))
    }
}

