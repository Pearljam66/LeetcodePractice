//
//  LongestCommonPrefixTests.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/13/24.
//

/*
 Write a function to find the longest common prefix string amongst an array of strings.

 If there is no common prefix, return an empty string "".

 Example 1:
 Input: strs = ["flower","flow","flight"]
 Output: "fl"
 
 Example 2:
 Input: strs = ["dog","racecar","car"]
 Output: ""
 Explanation: There is no common prefix among the input strings.


 Constraints:

 1 <= strs.length <= 200
 0 <= strs[i].length <= 200
 strs[i] consists of only lowercase English letters.

 */

import XCTest

final class LongestCommonPrefixTests: XCTestCase {

    class Solution {

        func longestCommonPrefix(_ strs: [String]) -> String {
            guard let firstString = strs.first else {
                return ""
            }

            var longestCommonPrefixString = ""

            for (index, char) in firstString.enumerated() {
                for str in strs {
                    if index >= str.count || str[str.index(str.startIndex, offsetBy: index)] != char {
                        return longestCommonPrefixString
                    }
                }
                longestCommonPrefixString.append(char)
            }

            return longestCommonPrefixString
        }
    }

    func testExample1() {
        let solution = Solution()
        let strs = ["flower","flow","flight"]
        let longestCommonPrefixString = "fl"

        XCTAssertEqual(solution.longestCommonPrefix(strs), longestCommonPrefixString)
    }

    func testExample2() {
        let solution = Solution()
        let strs = ["dog","racecar","car"]
        let longestCommonPrefixString = ""

        XCTAssertEqual(solution.longestCommonPrefix(strs), longestCommonPrefixString)
    }

}
