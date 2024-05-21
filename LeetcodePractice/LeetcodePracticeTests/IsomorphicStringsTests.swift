//
//  IsomorphicStringsTests.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/21/24.
//

/*
 Given two strings s and t, determine if they are isomorphic.
 Two strings s and t are isomorphic if the characters in s can be replaced to get t.
 All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character, but a character may map to itself.

 Example 1:
 Input: s = "egg", t = "add"
 Output: true
 
 Example 2:
 Input: s = "foo", t = "bar"
 Output: false
 
 Example 3:
 Input: s = "paper", t = "title"
 Output: true

 Constraints:

 1 <= s.length <= 5 * 104
 t.length == s.length
 s and t consist of any valid ascii character.

 */

import XCTest

final class IsomorphicStringsTests: XCTestCase {

    class Solution {

        func isIsomorphic(_ s: String, _ t: String) -> Bool {
            guard s.count == t.count else { return false }

            var sMap = [Character: Character]()
            var tMap = [Character: Character]()

            for (sChar, tChar) in zip(s, t) {
                if let mappedSChar = sMap[sChar], let mappedTChar = tMap[tChar] {
                    if mappedSChar != tChar || mappedTChar != sChar {
                        return false
                    }
                } else if sMap[sChar] == nil && tMap[tChar] == nil {
                    sMap[sChar] = tChar
                    tMap[tChar] = sChar
                } else {
                    return false
                }
            }
            return true
        }

    }

    func testExample1() {
        let solution = Solution()
        let s = "egg"
        let t = "add"

        XCTAssertTrue(solution.isIsomorphic(s, t))
    }

    func testExample2() {
        let solution = Solution()
        let s = "foo"
        let t = "bar"

        XCTAssertFalse(solution.isIsomorphic(s, t))
    }


    func testExample3() {
        let solution = Solution()
        let s = "paper"
        let t = "title"

        XCTAssertTrue(solution.isIsomorphic(s, t))
    }

}
