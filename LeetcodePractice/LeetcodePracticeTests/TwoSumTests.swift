//
//  TwoSumTests.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/29/24.
//

/*
 Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

 You may assume that each input would have exactly one solution, and you may not use the same element twice.

 You can return the answer in any order.

 Example 1:
 Input: nums = [2,7,11,15], target = 9
 Output: [0,1]
 Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].

 Example 2:
 Input: nums = [3,2,4], target = 6
 Output: [1,2]

 Example 3:
 Input: nums = [3,3], target = 6
 Output: [0,1]


 Constraints:

 2 <= nums.length <= 104
 -109 <= nums[i] <= 109
 -109 <= target <= 109
 Only one valid answer exists.

 */

import XCTest

final class TwoSumTests: XCTestCase {

    class Solution {

        func twoSum(_ nums: [Int], _ target: Int) -> [Int] {

            var numToIndex = [Int: Int]()

            for (index, num) in nums.enumerated() {
                let complement = target - num
                if let complementIndex = numToIndex[complement] {
                    return [complementIndex, index]
                }
                numToIndex[num] = index
            }

            return []
        }

    }

    func testExample1() {
        let solution = Solution()
        let nums = [2,7,11,15]
        let target = 9
        let twoIndices = [0,1]

        XCTAssertEqual(solution.twoSum(nums, target), twoIndices)
    }

    func testExample2() {
        let solution = Solution()
        let nums = [3,2,4]
        let target = 6
        let twoIndices = [1,2]

        XCTAssertEqual(solution.twoSum(nums, target), twoIndices)
    }

    func testExample3() {
        let solution = Solution()
        let nums = [3,3]
        let target = 6
        let twoIndices = [0,1]

        XCTAssertEqual(solution.twoSum(nums, target), twoIndices)
    }

}
