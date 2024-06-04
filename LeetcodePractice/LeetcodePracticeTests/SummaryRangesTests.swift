//
//  SummaryRangesTests.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 6/4/24.
//

/*
 You are given a sorted unique integer array nums.

 A range [a,b] is the set of all integers from a to b (inclusive).

 Return the smallest sorted list of ranges that cover all the numbers in the array exactly. That is, each element of nums is covered by exactly one of the ranges, and there is no integer x such that x is in one of the ranges but not in nums.

 Each range [a,b] in the list should be output as:

 "a->b" if a != b
 "a" if a == b


 Example 1:
 Input: nums = [0,1,2,4,5,7]
 Output: ["0->2","4->5","7"]
 Explanation: The ranges are:
 [0,2] --> "0->2"
 [4,5] --> "4->5"
 [7,7] --> "7"
 
 Example 2:
 Input: nums = [0,2,3,4,6,8,9]
 Output: ["0","2->4","6","8->9"]
 Explanation: The ranges are:
 [0,0] --> "0"
 [2,4] --> "2->4"
 [6,6] --> "6"
 [8,9] --> "8->9"

 */

import XCTest

final class SummaryRangesTests: XCTestCase {

    class Solution {

        func summaryRanges(_ nums: [Int]) -> [String] {
            var result = [String]()
            var i = 0
            let n = nums.count

            while i < n {
                let start = nums[i]
                while i + 1 < n && nums[i + 1] == nums[i] + 1 {
                    i += 1
                }
                let end = nums[i]

                if start == end {
                    result.append("\(start)")
                } else {
                    result.append("\(start)->\(end)")
                }

                i += 1
            }

            return result
        }
    }

    func testExample1() {
        let solution = Solution()
        let nums = [0,1,2,4,5,7]
        let output = ["0->2","4->5","7"]

        XCTAssertEqual(solution.summaryRanges(nums), output)
    }

    func testExample2() {
        let solution = Solution()
        let nums = [0,2,3,4,6,8,9]
        let output = ["0","2->4","6","8->9"]

        XCTAssertEqual(solution.summaryRanges(nums), output)
    }

}
