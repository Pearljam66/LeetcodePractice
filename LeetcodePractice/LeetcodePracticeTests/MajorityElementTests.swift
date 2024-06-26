//
//  MajorityElementTests.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/6/24.
//

/*
 Given an array nums of size n, return the majority element.

 The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.



 Example 1:

 Input: nums = [3,2,3]
 Output: 3
 Example 2:

 Input: nums = [2,2,1,1,1,2,2]
 Output: 2


 Constraints:

 n == nums.length
 1 <= n <= 5 * 104
 -109 <= nums[i] <= 109

 */

import XCTest

final class MajorityElementTests: XCTestCase {

    class Solution {

        func majorityElement(_ nums: [Int]) -> Int {
            // use a variation of Boyer-Moore Majority vote algorithm
            var candidate: Int? = nil
            var count = 0

            for num in nums {
                if count == 0 {
                    candidate = num
                }

                count += (num == candidate) ? 1 : -1
            }
            return candidate!
        }

    }

    func testExample1() throws {
        let solution = Solution()
        let nums = [3,2,3]

        let k = solution.majorityElement(nums)

        XCTAssertEqual(k, 3)
    }

    func testExample2() throws {
        let solution = Solution()
        let nums = [2,2,1,1,1,2,2]

        let k = solution.majorityElement(nums)

        XCTAssertEqual(k, 2)
    }

}
