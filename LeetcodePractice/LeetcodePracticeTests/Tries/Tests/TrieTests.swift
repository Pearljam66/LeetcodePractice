//
//  TrieTests.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/13/24.
//

import XCTest

final class TrieTests: XCTestCase {

    func testInsertion() {
        let trie = Trie<String>()
        trie.insert("apple")
        trie.insert("app")
        trie.insert("banana")

        XCTAssertTrue(trie.contains("apple"))
        XCTAssertTrue(trie.contains("app"))
        XCTAssertTrue(trie.contains("banana"))
    }

    func testRemoval() {
        let trie = Trie<String>()
        trie.insert("apple")
        trie.insert("app")
        trie.insert("banana")

        trie.remove("apple")
        XCTAssertFalse(trie.contains("apple"))
        XCTAssertTrue(trie.contains("app"))
        XCTAssertTrue(trie.contains("banana"))

        trie.remove("app")
        XCTAssertFalse(trie.contains("app"))
        XCTAssertTrue(trie.contains("banana"))
    }

    func testCollectionsStartingWith() {
        let trie = Trie<String>()
        trie.insert("apple")
        trie.insert("app")
        trie.insert("banana")

        let startingWithApp = trie.collections(startingWith: "app")
        XCTAssertEqual(startingWithApp, ["app", "apple"])
        XCTAssertFalse(startingWithApp.isEmpty)
    }

    func testContains() {
        let trie = Trie<String>()
        trie.insert("apple")
        trie.insert("app")
        trie.insert("banana")

        XCTAssertTrue(trie.contains("apple"))
        XCTAssertTrue(trie.contains("app"))
        XCTAssertTrue(trie.contains("banana"))

        XCTAssertFalse(trie.contains("orange"))
        XCTAssertFalse(trie.contains("apricot"))
    }

}

