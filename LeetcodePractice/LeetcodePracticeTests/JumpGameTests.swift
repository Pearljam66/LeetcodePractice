//
//  JumpGameTests.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/7/24.
//

/*
You are given an integer array nums. You are initially positioned at the array's first index, and each element in the array represents your maximum jump length at that position.

Return true if you can reach the last index, or false otherwise.


Example 1:

Input: nums = [2,3,1,1,4]
Output: true
Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.
Example 2:

Input: nums = [3,2,1,0,4]
Output: false
Explanation: You will always arrive at index 3 no matter what. Its maximum jump length is 0, which makes it impossible to reach the last index.


Constraints:

1 <= nums.length <= 104
0 <= nums[i] <= 105
 */

import XCTest

final class JumpGameTests: XCTestCase {

    class Solution {
        func canJump(_ nums: [Int]) -> Bool {
            var furthestIndex = 0
            let lastIndex = nums.count - 1

            for i in 0..<nums.count {
                if i > furthestIndex {
                    return false
                }
                furthestIndex = max(furthestIndex, i + nums[i])

                if furthestIndex >= lastIndex {
                    return true
                }
            }
            return false
        }

    }

    func testExample1() throws {
        let solution = Solution()
        let nums = [2,3,1,1,4]

        XCTAssertTrue(solution.canJump(nums))
    }

    func testExample2() throws {
        let solution = Solution()
        let nums = [3,2,1,0,4]

        XCTAssertFalse(solution.canJump(nums))
    }


}
