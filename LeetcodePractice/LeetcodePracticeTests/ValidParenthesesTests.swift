//
//  ValidParenthesesTests.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 6/5/24.
//

/*
 Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:

 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
 Every close bracket has a corresponding open bracket of the same type.

 Example 1:
 Input: s = "()"
 Output: true

 Example 2:
 Input: s = "()[]{}"
 Output: true

 Example 3:
 Input: s = "(]"
 Output: false

 Constraints:

 1 <= s.length <= 104
 s consists of parentheses only '()[]{}'.
 */

import XCTest

final class ValidParenthesesTests: XCTestCase {

    class Solution {
        func isValid(_ s: String) -> Bool {
            // Dictionary to hold matching pairs of brackets
            let bracketPairs: [Character: Character] = [")": "(", "}": "{", "]": "["]

            // Stack to hold opening brackets
            var stack = [Character]()

            // Iterate through each character in the string
            for char in s {
                // If the character is a closing bracket
                if let matchingOpenBracket = bracketPairs[char] {
                    // Check if the stack is empty or the top of the stack is not the matching opening bracket
                    if stack.isEmpty || stack.removeLast() != matchingOpenBracket {
                        return false
                    }
                } else {
                    // If the character is an opening bracket, push it onto the stack
                    stack.append(char)
                }
            }

            // If the stack is empty, all brackets were properly closed
            return stack.isEmpty
        }

    }

    func testExample1() {
        let solution = Solution()
        let s = "()"

        XCTAssertTrue(solution.isValid(s))
    }

    func testExample2() {
        let solution = Solution()
        let s = "()[]{}"

        XCTAssertTrue(solution.isValid(s))

    }

    func testExample3() {
        let solution = Solution()
        let s = "(]"

        XCTAssertFalse(solution.isValid(s))
    }

}
