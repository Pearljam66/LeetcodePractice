//
//  RansomNoteTests.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/20/24.
//

/*
 Given two strings ransomNote and magazine, return true if ransomNote can be constructed by using the letters from magazine and false otherwise.

 Each letter in magazine can only be used once in ransomNote.

 Example 1:

 Input: ransomNote = "a", magazine = "b"
 Output: false


 Example 2:
 Input: ransomNote = "aa", magazine = "ab"
 Output: false
 Example 3:

 Input: ransomNote = "aa", magazine = "aab"
 Output: true

 Constraints:

 1 <= ransomNote.length, magazine.length <= 105
 ransomNote and magazine consist of lowercase English letters.
 */

import XCTest

final class RansomNoteTests: XCTestCase {

    class Solution {
        func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
            // Create a dictionary to count the occurrences of each character in the magazine
            var magazineCount: [Character : Int] = [:]

            // Populate the dictionary with counts from the magazine.
            for char in magazine {
                magazineCount[char, default: 0] += 1
            }

            // Check if the random note can be constructed from the magazine.
            for char in ransomNote {
                if let count = magazineCount[char], count > 0 {
                    magazineCount[char]! -= 1
                } else {
                    return false
                }
            }
            return true
        }
    }

    func testExample1() {
        let solution = Solution()
        let ransomNote = "a"
        let magazine = "b"
        let output = false

        XCTAssertEqual(solution.canConstruct(ransomNote, magazine), output)
    }

    func testExample2() {
        let solution = Solution()
        let ransomNote = "aa"
        let magazine = "ab"
        let output = false

        XCTAssertEqual(solution.canConstruct(ransomNote, magazine), output)
    }

    func testExample3() {
        let solution = Solution()
        let ransomNote = "aa"
        let magazine = "aab"
        let output = true

        XCTAssertEqual(solution.canConstruct(ransomNote, magazine), output)
    }


}
