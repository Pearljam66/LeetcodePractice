//
//  TrappingRainWaterTests.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/13/24.
//

/*
 Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining.

 Example 1:
 Input: height = [0,1,0,2,1,0,1,3,2,1,2,1]
 Output: 6
 Explanation: The above elevation map (black section) is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped.
 
 Example 2:
 Input: height = [4,2,0,3,2,5]
 Output: 9

 Constraints:

 n == height.length
 1 <= n <= 2 * 104
 0 <= height[i] <= 105

 */

import XCTest

final class TrappingRainWaterTests: XCTestCase {

    class Solution {

        func trap(_ height: [Int]) -> Int {
            var trappedWaterUnits = 0
            var left = 0
            var right = height.count - 1
            var leftMaxHeight = 0
            var rightMaxHeight = 0

            while left < right {
                if height[left] < height[right] {
                    leftMaxHeight = max(leftMaxHeight, height[left])
                    if height[left] < leftMaxHeight {
                        trappedWaterUnits += leftMaxHeight - height[left]
                    }
                    left += 1
                } else {
                    rightMaxHeight = max(rightMaxHeight, height[right])
                    if height[right] < rightMaxHeight {
                        trappedWaterUnits += rightMaxHeight - height[right]
                    }
                    right -= 1
                }
            }

            return trappedWaterUnits
        }

    }

    func testExample1() {
        let solution = Solution()
        let height = [0,1,0,2,1,0,1,3,2,1,2,1]
        let trappedWaterUnits = 6

        XCTAssertEqual(solution.trap(height), trappedWaterUnits)
    }

    func testExample2() {
        let solution = Solution()
        let height = [4,2,0,3,2,5]
        let trappedWaterUnits = 9

        XCTAssertEqual(solution.trap(height), trappedWaterUnits)
    }



}
