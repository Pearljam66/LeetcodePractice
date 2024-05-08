//
//  RingBuffer.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/8/24.
//

struct RingBuffer<T> {
    private var array: [T?]
    private var readIndex = 0
    private var writeIndex = 0

    public init(count: Int) {
        array = Array<T?>(repeating: nil, count: count)
    }

    public var first: T? {
        array[readIndex]
    }

    public var isEmpty: Bool {
        availableSpaceForReading == 0
    }

    public var isFull: Bool {
        availableSpaceForWriting == 0
    }

    private var availableSpaceForWriting: Int {
        array.count - availableSpaceForReading
    }

    private var availableSpaceForReading: Int {
        writeIndex - readIndex
    }

    public mutating func write(_ element: T) -> Bool {
        if !isFull {
            array[writeIndex % array.count] = element
            writeIndex += 1
            return true
        } else {
            return false
        }
    }

    public mutating func read() -> T? {
        if !isEmpty {
            let element = array[readIndex % array.count]
            readIndex += 1
            return element
        } else {
            return nil
        }
    }

}

extension RingBuffer: CustomStringConvertible {
    public var description: String {
        let values = (0..<availableSpaceForReading).map {
            String(describing: array[($0 + readIndex) % array.count])
        }
        return "[" + values.joined(separator: ", ") + "]"
    }
}
