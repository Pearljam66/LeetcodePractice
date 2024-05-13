//
//  LengthOfLastWordTests.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/13/24.
//

/*
 Given a string s consisting of words and spaces, return the length of the last word in the string.

 A word is a maximal
 substring
 consisting of non-space characters only.

 Example 1:

 Input: s = "Hello World"
 Output: 5
 Explanation: The last word is "World" with length 5.
 Example 2:

 Input: s = "   fly me   to   the moon  "
 Output: 4
 Explanation: The last word is "moon" with length 4.
 Example 3:

 Input: s = "luffy is still joyboy"
 Output: 6
 Explanation: The last word is "joyboy" with length 6.


 Constraints:

 1 <= s.length <= 104
 s consists of only English letters and spaces ' '.
 There will be at least one word in s.

 */

import XCTest

final class LengthOfLastWordTests: XCTestCase {

    class Solution {
        func lengthOfLastWord(_ s: String) -> Int {
            var lastWordLength = 0
            var isCounting = false

            for char in s.reversed() {
                if char == " " && isCounting {
                    break
                } else if char != " " {
                    isCounting = true
                    lastWordLength += 1
                }
            }

            return lastWordLength
        }
    }

    func testExample1() {
        let solution = Solution()
        let s = "Hello World"
        let lastWordLength = 5

        XCTAssertEqual(solution.lengthOfLastWord(s), lastWordLength)
    }

    func testExample2() {
        let solution = Solution()
        let s = "   fly me   to   the moon  "
        let lastWordLength = 4

        XCTAssertEqual(solution.lengthOfLastWord(s), lastWordLength)
    }

    func testExample3() {
        let solution = Solution()
        let s = "luffy is still joyboy"
        let lastWordLength = 6

        XCTAssertEqual(solution.lengthOfLastWord(s), lastWordLength)
    }

}
