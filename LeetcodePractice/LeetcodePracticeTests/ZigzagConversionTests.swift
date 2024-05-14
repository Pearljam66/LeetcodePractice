//
//  ZigzagConversionTests.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/14/24.
//

/*
 The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

 P   A   H   N
 A P L S I I G
 Y   I   R
 And then read line by line: "PAHNAPLSIIGYIR"

 Write the code that will take a string and make this conversion given a number of rows:

 string convert(string s, int numRows);


 Example 1:

 Input: s = "PAYPALISHIRING", numRows = 3
 Output: "PAHNAPLSIIGYIR"
 
 Example 2:
 Input: s = "PAYPALISHIRING", numRows = 4
 Output: "PINALSIGYAHRPI"
 Explanation:
 P     I    N
 A   L S  I G
 Y A   H R
 P     I
 
 Example 3:
 Input: s = "A", numRows = 1
 Output: "A"

 Constraints:

 1 <= s.length <= 1000
 s consists of English letters (lower-case and upper-case), ',' and '.'.
 1 <= numRows <= 1000

 */

import XCTest

final class ZigzagConversionTests: XCTestCase {

    class Solution {

        func convert(_ s: String, _ numRows: Int) -> String {
            if numRows <= 1 {
                return s
            }

            let numActualRows = min(numRows, s.count)
            var rows = Array(repeating: "", count: numActualRows)
            var currentRow = 0
            var goingDown = false

            for char in s {
                rows[currentRow] += String(char)
                if currentRow == 0 || currentRow == numRows - 1 {
                    goingDown = !goingDown
                }
                currentRow += goingDown ? 1 : -1
            }

            return rows.joined()
        }
    }

    func testExample1() {
        let solution = Solution()
        let s = "PAYPALISHIRING"
        let numRows = 3
        let convertedString = "PAHNAPLSIIGYIR"

        XCTAssertEqual(solution.convert(s, numRows), convertedString)

    }

    func testExample2() {
        let solution = Solution()
        let s = "PAYPALISHIRING"
        let numRows = 4
        let convertedString = "PINALSIGYAHRPI"

        XCTAssertEqual(solution.convert(s, numRows), convertedString)
    }

    func testExample3() {
        let solution = Solution()
        let s = "A"
        let numRows = 1
        let convertedString = "A"

        XCTAssertEqual(solution.convert(s, numRows), convertedString)
    }

    func testExample4() {
        let solution = Solution()
        let s = "AB"
        let numRows = 1
        let convertedString = "AB"

        XCTAssertEqual(solution.convert(s, numRows), convertedString)
    }

}
