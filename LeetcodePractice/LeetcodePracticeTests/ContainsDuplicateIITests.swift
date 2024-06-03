//
//  ContainsDuplicateIITests.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 6/3/24.
//

/*
 Given an integer array nums and an integer k, return true if there are two distinct indices i and j in the array such that nums[i] == nums[j] and abs(i - j) <= k.

 Example 1:
 Input: nums = [1,2,3,1], k = 3
 Output: true
 
 Example 2:
 Input: nums = [1,0,1,1], k = 1
 Output: true

 Example 3:
 Input: nums = [1,2,3,1,2,3], k = 2
 Output: false


 Constraints:

 1 <= nums.length <= 105
 -109 <= nums[i] <= 109
 0 <= k <= 105

 */

import XCTest

final class ContainsDuplicateIITests: XCTestCase {

    class Solution {

        func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
            var indexDict = [Int: Int]()

            for (index, num) in nums.enumerated() {
                if let lastIndex = indexDict[num] {
                    if index - lastIndex <= k {
                        return true
                    }
                }
                indexDict[num] = index
            }

            return false
        }
    }

    func testExample1() {
        let solution = Solution()
        let nums = [1,2,3,1]
        let k = 3

        XCTAssertTrue(solution.containsNearbyDuplicate(nums, k))
    }

    func testExample2() {
        let solution = Solution()
        let nums = [1,0,1,1]
        let k = 1

        XCTAssertTrue(solution.containsNearbyDuplicate(nums, k))
    }

    func testExample3() {
        let solution = Solution()
        let nums = [1,2,3,1,2,3]
        let k = 2

        XCTAssertFalse(solution.containsNearbyDuplicate(nums, k))
    }

}
