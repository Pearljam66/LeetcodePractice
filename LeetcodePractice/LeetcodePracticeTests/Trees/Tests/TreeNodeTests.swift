//
//  TreeNodeTests.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/8/24.
//

import XCTest

final class TreeNodeTests: XCTestCase {

    func testAddChild() {
        let node = TreeNode(value: 1)
        XCTAssertEqual(node.children.count, 0)

        let childNode = TreeNode(value: 2)
        node.add(childNode)

        XCTAssertEqual(node.children.count, 1)
        XCTAssertEqual(node.children.first?.value, 2)
    }

    func testForEachDepthFirst() {
        let root = TreeNode(value: 1)
        let child1 = TreeNode(value: 2)
        let child2 = TreeNode(value: 3)
        let child3 = TreeNode(value: 4)

        root.add(child1)
        root.add(child2)
        child1.add(child3)

        var result = [Int]()
        root.forEachDepthFirst { node in
            result.append(node.value)
        }

        XCTAssertEqual(result, [1, 2, 4, 3])
    }
}

