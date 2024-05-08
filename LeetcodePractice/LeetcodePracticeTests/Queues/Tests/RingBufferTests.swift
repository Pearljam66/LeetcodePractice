//
//  RingBufferTests.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/8/24.
//

import XCTest

final class RingBufferTests: XCTestCase {

    func testInitialization() {
        let buffer = RingBuffer<Int>(count: 5)
        XCTAssertTrue(buffer.isEmpty)
        XCTAssertFalse(buffer.isFull)
    }

    func testWriteAndRead() {
        var buffer = RingBuffer<Int>(count: 3)
        XCTAssertTrue(buffer.write(1))
        XCTAssertTrue(buffer.write(2))
        XCTAssertTrue(buffer.write(3))
        XCTAssertFalse(buffer.write(4)) // Buffer is full

        XCTAssertEqual(buffer.read(), 1)
        XCTAssertEqual(buffer.read(), 2)
        XCTAssertEqual(buffer.read(), 3)
        XCTAssertNil(buffer.read()) // Buffer is empty
    }

    func testFullBuffer() {
        var buffer = RingBuffer<Int>(count: 2)
        XCTAssertTrue(buffer.write(1))
        XCTAssertTrue(buffer.write(2))
        XCTAssertTrue(buffer.isFull)
        XCTAssertFalse(buffer.write(3)) // Buffer is full
    }

    func testEmptyBuffer() {
        var buffer = RingBuffer<Int>(count: 3)
        XCTAssertNil(buffer.read())
        XCTAssertTrue(buffer.isEmpty)
    }

    func testDescription() {
        var buffer = RingBuffer<Int>(count: 5)
        XCTAssertTrue(buffer.write(1))
        XCTAssertTrue(buffer.write(2))
        XCTAssertTrue(buffer.write(3))
        XCTAssertEqual(buffer.description, "[Optional(1), Optional(2), Optional(3)]")
    }
}

