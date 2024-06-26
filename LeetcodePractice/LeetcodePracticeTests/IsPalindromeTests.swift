//
//  IsPalindromeTests.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/14/24.
//

/*

 A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

 Given a string s, return true if it is a palindrome, or false otherwise.

 Example 1:

 Input: s = "A man, a plan, a canal: Panama"
 Output: true
 Explanation: "amanaplanacanalpanama" is a palindrome.
 
 Example 2:
 Input: s = "race a car"
 Output: false
 Explanation: "raceacar" is not a palindrome.

 Example 3:
 Input: s = " "
 Output: true
 Explanation: s is an empty string "" after removing non-alphanumeric characters.
 Since an empty string reads the same forward and backward, it is a palindrome.

 Constraints:

 1 <= s.length <= 2 * 105
 s consists only of printable ASCII characters.
 */

import XCTest

final class IsPalindromeTests: XCTestCase {

    class Solution {

        func isPalindrome(_ s: String) -> Bool {
            let cleanedString = s.lowercased().filter { $0.isLetter || $0.isNumber }
            return cleanedString == String(cleanedString.reversed())
        }
    }

    func testExample1() {
        let solution = Solution()
        let s = "A man, a plan, a canal: Panama"
        let isPalindrome = true

        XCTAssertEqual(solution.isPalindrome(s), isPalindrome)
    }

    func testExample2() {
        let solution = Solution()
        let s = "race a car"
        let isPalindrome = false

        XCTAssertEqual(solution.isPalindrome(s), isPalindrome)
    }

    func testExample3() {
        let solution = Solution()
        let s = " "
        let isPalindrome = true

        XCTAssertEqual(solution.isPalindrome(s), isPalindrome)
    }

}
