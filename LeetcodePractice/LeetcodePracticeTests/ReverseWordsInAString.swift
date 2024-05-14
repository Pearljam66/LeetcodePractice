//
//  ReverseWordsInAString.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/13/24.
//

/*
 Given an input string s, reverse the order of the words.

 A word is defined as a sequence of non-space characters. The words in s will be separated by at least one space.

 Return a string of the words in reverse order concatenated by a single space.

 Note that s may contain leading or trailing spaces or multiple spaces between two words. The returned string should only have a single space separating the words. Do not include any extra spaces.



 Example 1:
 Input: s = "the sky is blue"
 Output: "blue is sky the"
 

 Example 2:
 Input: s = "  hello world  "
 Output: "world hello"
 Explanation: Your reversed string should not contain leading or trailing spaces.
 
 Example 3:
 Input: s = "a good   example"
 Output: "example good a"
 Explanation: You need to reduce multiple spaces between two words to a single space in the reversed string.


 Constraints:

 1 <= s.length <= 104
 s contains English letters (upper-case and lower-case), digits, and spaces ' '.
 There is at least one word in s.

 Follow-up: If the string data type is mutable in your language, can you solve it in-place with O(1) extra space?

 */

import XCTest

final class ReverseWordsInAString: XCTestCase {

    class Solution {

        /*func reverseWords(_ s: String) -> String {
            let trimmedString = s.trimmingCharacters(in: .whitespaces)
            let words = trimmedString.components(separatedBy:" ").filter { !$0.isEmpty }
            let reversedWords = words.reversed()
            print(reversedWords)

            let reversedString = reversedWords.joined(separator: " ")
            return reversedString
        }*/

        // Slightly more efficient solution
        func reverseWords(_ s: String) -> String {
            let words = s.split(separator: " ").filter { !$0.isEmpty }.reversed()
            return words.joined(separator: " ")
        }

    }

    func testExample1() {
        let solution = Solution()
        let s = "the sky is blue"
        let wordsReversed = "blue is sky the"

        XCTAssertEqual(solution.reverseWords(s), wordsReversed)
    }

    func testExample2() {
        let solution = Solution()
        let s = "  hello world  "
        let wordsReversed = "world hello"

        XCTAssertEqual(solution.reverseWords(s), wordsReversed)
    }

    func testExample3() {
        let solution = Solution()
        let s = "a good   example"
        let wordsReversed = "example good a"

        XCTAssertEqual(solution.reverseWords(s), wordsReversed)
    }

}
