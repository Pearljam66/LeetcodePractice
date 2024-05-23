//
//  ValidAnagramTests.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/23/24.
//

/*
 Given two strings s and t, return true if t is an anagram of s, and false otherwise.

 An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

 Example 1:
 Input: s = "anagram", t = "nagaram"
 Output: true
 
 Example 2:
 Input: s = "rat", t = "car"
 Output: false

 Constraints:

 1 <= s.length, t.length <= 5 * 104
 s and t consist of lowercase English letters.

 Follow up: What if the inputs contain Unicode characters? How would you adapt your solution to such a case?
 */

import XCTest

final class ValidAnagramTests: XCTestCase {

    class Solution {
        func isAnagram(_ s: String, _ t: String) -> Bool {
            if s.count != t.count {
                return false
            }

            let sortedS = s.sorted()
            let sortedT = t.sorted()

            return sortedS == sortedT
        }
    }

    func testExample1() {
        let solution = Solution()
        let s = "anagram"
        let t = "nagaram"

        XCTAssertTrue(solution.isAnagram(s, t))
    }

    func testExample2() {
        let solution = Solution()
        let s = "rat"
        let t = "car"

        XCTAssertFalse(solution.isAnagram(s, t))
    }

}
