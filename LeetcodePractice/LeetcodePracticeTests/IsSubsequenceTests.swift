//
//  IsSubsequenceTests.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/18/24.
//

/*
 Given two strings s and t, return true if s is a subsequence of t, or false otherwise.

 A subsequence of a string is a new string that is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (i.e., "ace" is a subsequence of "abcde" while "aec" is not).

 Example 1:
 Input: s = "abc", t = "ahbgdc"
 Output: true
 
 Example 2:
 Input: s = "axc", t = "ahbgdc"
 Output: false

 Constraints:

 0 <= s.length <= 100
 0 <= t.length <= 104
 s and t consist only of lowercase English letters.


 Follow up: Suppose there are lots of incoming s, say s1, s2, ..., sk where k >= 109, and you want to check one by one to see if t has its subsequence. In this scenario, how would you change your code?

 */

import XCTest

final class IsSubsequenceTests: XCTestCase {

    class Solution {
        func isSubsequence(_ s: String, _ t: String) -> Bool {
            // Convert strings to arrays of characters for easier indexing.
            let sArray = Array(s)
            let tArray = Array(t)

            // Initialize two pointers for s and t.
            var pointerS = 0
            var pointerT = 0

            // Loop through tArray while there are characters in both arrays.
            while (pointerS < sArray.count) && (pointerT < tArray.count) {
                if sArray[pointerS] == tArray[pointerT] {
                    pointerS += 1
                }
                pointerT += 1
            }

            // If pointerS has moved through all characters in sArray, then s is a subsequence of t.
            return pointerS == sArray.count
        }
    }

    func testExample3() {
        let solution = Solution()
        let s = "abc"
        let t = "ahbgdc"
        let output = true

        XCTAssertEqual(solution.isSubsequence(s, t), output)
    }

    func testExample2() {
        let solution = Solution()
        let s = "axc"
        let t = "ahbgdc"
        let output = false

        XCTAssertEqual(solution.isSubsequence(s, t), output)
    }

}
