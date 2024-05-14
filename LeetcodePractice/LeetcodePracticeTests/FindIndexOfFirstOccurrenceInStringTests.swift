//
//  FindIndexOfFirstOccurrenceInStringTests.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/14/24.
//

/*
 Given two strings needle and haystack, return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

 Example 1:

 Input: haystack = "sadbutsad", needle = "sad"
 Output: 0
 Explanation: "sad" occurs at index 0 and 6.
 The first occurrence is at index 0, so we return 0.
 
 Example 2:
 Input: haystack = "leetcode", needle = "leeto"
 Output: -1
 Explanation: "leeto" did not occur in "leetcode", so we return -1.

 Constraints:

 1 <= haystack.length, needle.length <= 104
 haystack and needle consist of only lowercase English characters.

 */

import XCTest

final class FindIndexOfFirstOccurrenceInStringTests: XCTestCase {

    class Solution {
        func strStr(_ haystack: String, _ needle: String) -> Int {
            var firstOccurrenceIndex = 0

            if haystack.contains(needle) {
                if let range = haystack.range(of: needle) {
                    firstOccurrenceIndex = haystack.distance(from: haystack.startIndex, to: range.lowerBound)
                }
            } else {
                return -1
            }

            return firstOccurrenceIndex
        }

    }

    func testExample1() {
        let solution = Solution()
        let haystack = "sadbutsad"
        let needle = "sad"
        let firstOccurrenceIndex = 0

        XCTAssertEqual(solution.strStr(haystack, needle), firstOccurrenceIndex)
    }

    func testExample2() {
        let solution = Solution()
        let haystack = "leetcode"
        let needle = "leeto"
        let firstOccurrenceIndex = -1

        XCTAssertEqual(solution.strStr(haystack, needle), firstOccurrenceIndex)
    }

}
