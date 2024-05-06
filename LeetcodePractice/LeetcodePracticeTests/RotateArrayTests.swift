//
//  RotateArrayTests.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/6/24.
//

/*
 Given an integer array nums, rotate the array to the right by k steps, where k is non-negative.



 Example 1:

 Input: nums = [1,2,3,4,5,6,7], k = 3
 Output: [5,6,7,1,2,3,4]
 Explanation:
 rotate 1 steps to the right: [7,1,2,3,4,5,6]
 rotate 2 steps to the right: [6,7,1,2,3,4,5]
 rotate 3 steps to the right: [5,6,7,1,2,3,4]
 Example 2:

 Input: nums = [-1,-100,3,99], k = 2
 Output: [3,99,-1,-100]
 Explanation:
 rotate 1 steps to the right: [99,-1,-100,3]
 rotate 2 steps to the right: [3,99,-1,-100]


 Constraints:

 1 <= nums.length <= 105
 -231 <= nums[i] <= 231 - 1
 0 <= k <= 105

 */

import XCTest

final class RotateArrayTests: XCTestCase {

    class Solution {
        func rotate(_ nums: inout [Int], _ k: Int) {
            let n = nums.count
            let k = k % n

            reverse(&nums, start: 0, end: n - 1) // Reverse the entire array
            reverse(&nums, start: 0, end: k - 1) // Reverse the first k elements
            reverse(&nums, start: k, end: n - 1) // Reverse the remaining elements
        }

        private func reverse(_ nums: inout [Int], start: Int, end: Int) {
            var start = start
            var end = end

            while start < end {
                nums.swapAt(start, end)
                start += 1
                end -= 1
            }
        }

    }

    func testExample1() throws {
        let solution = Solution()
        var nums = [1,2,3,4,5,6,7]
        let steps = 3

        solution.rotate(&nums, steps)

        XCTAssertEqual(nums, [5,6,7,1,2,3,4])
    }

    func testExample2() throws {
        let solution = Solution()
        var nums = [-1,-100,3,99]
        let steps = 2

        solution.rotate(&nums, steps)

        XCTAssertEqual(nums, [3,99,-1,-100])
    }

}
