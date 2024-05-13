//
//  AVLTreeTests.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/13/24.
//

import XCTest

final class AVLTreeTests: XCTestCase {

    func testInsertion() {
        var tree = AVLTree<Int>()
        tree.insert(10)
        tree.insert(5)
        tree.insert(20)
        tree.insert(8)
        tree.insert(3)

        XCTAssertTrue(tree.contains(10))
        XCTAssertTrue(tree.contains(5))
        XCTAssertTrue(tree.contains(20))
        XCTAssertTrue(tree.contains(8))
        XCTAssertTrue(tree.contains(3))
    }

    func testRemoval() {
        var tree = AVLTree<Int>()
        tree.insert(10)
        tree.insert(5)
        tree.insert(20)
        tree.insert(8)
        tree.insert(3)

        tree.remove(5)
        XCTAssertFalse(tree.contains(5))

        tree.remove(10)
        XCTAssertFalse(tree.contains(10))
        XCTAssertTrue(tree.contains(20))
        XCTAssertTrue(tree.contains(8))
        XCTAssertTrue(tree.contains(3))
    }

    func testContains() {
        var tree = AVLTree<Int>()
        tree.insert(10)
        tree.insert(5)
        tree.insert(20)
        tree.insert(8)
        tree.insert(3)

        XCTAssertTrue(tree.contains(10))
        XCTAssertTrue(tree.contains(5))
        XCTAssertTrue(tree.contains(20))
        XCTAssertTrue(tree.contains(8))
        XCTAssertTrue(tree.contains(3))

        XCTAssertFalse(tree.contains(15))
    }

    func testDescription() {
        var tree = AVLTree<Int>()
        tree.insert(10)
        tree.insert(5)
        tree.insert(20)
        tree.insert(8)
        tree.insert(3)

        let description = tree.description
        XCTAssertFalse(description.isEmpty)
    }

}
