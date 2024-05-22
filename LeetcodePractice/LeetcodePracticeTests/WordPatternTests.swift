//
//  WordPatternTests.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/22/24.
//

/*
 Given a pattern and a string s, find if s follows the same pattern.

 Here follow means a full match, such that there is a bijection between a letter in pattern and a non-empty word in s.

 Example 1:

 Input: pattern = "abba", s = "dog cat cat dog"
 Output: true

 Example 2:
 Input: pattern = "abba", s = "dog cat cat fish"
 Output: false

 Example 3:
 Input: pattern = "aaaa", s = "dog cat cat dog"
 Output: false


 Constraints:

 1 <= pattern.length <= 300
 pattern contains only lower-case English letters.
 1 <= s.length <= 3000
 s contains only lowercase English letters and spaces ' '.
 s does not contain any leading or trailing spaces.
 All the words in s are separated by a single space.

 */

import XCTest

final class WordPatternTests: XCTestCase {

    class Solution {
        func wordPattern(_ pattern: String, _ s: String) -> Bool {
            let words = s.split(separator: " ").map { String($0) }

            // Check if pattern length matches the number of words
            if pattern.count != words.count {
                return false
            }

            var charToWord: [Character: String] = [:]
            var wordToChar: [String: Character] = [:]

            let patternChars = Array(pattern)

            for (char, word) in zip(patternChars, words) {
                if let mappedWord = charToWord[char] {
                    if mappedWord != word {
                        return false
                    }
                } else {
                    charToWord[char] = word
                }

                if let mappedChar = wordToChar[word] {
                    if mappedChar != char {
                        return false
                    }
                } else {
                    wordToChar[word] = char
                }
            }

            return true
        }
    }

    func testExample1() {
        let solution = Solution()
        let pattern = "abba"
        let s = "dog cat cat dog"

        XCTAssertTrue(solution.wordPattern(pattern, s))
    }

    func testExample2() {
        let solution = Solution()
        let pattern = "abba"
        let s = "dog cat cat fish"

        XCTAssertFalse(solution.wordPattern(pattern, s))
    }

    func testExample3() {
        let solution = Solution()
        let pattern = "aaaa"
        let s = "dog cat cat dog"

        XCTAssertFalse(solution.wordPattern(pattern, s))
    }

}
