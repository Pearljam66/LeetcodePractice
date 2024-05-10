//
//  ProductOfArrayExceptSelfTests.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/10/24.
//

/*
 Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].

 The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

 You must write an algorithm that runs in O(n) time and without using the division operation.

 Example 1:

 Input: nums = [1,2,3,4]
 Output: [24,12,8,6]
 Example 2:

 Input: nums = [-1,1,0,-3,3]
 Output: [0,0,9,0,0]


 Constraints:

 2 <= nums.length <= 105
 -30 <= nums[i] <= 30
 The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

 */

import XCTest

final class ProductOfArrayExceptSelfTests: XCTestCase {

    class Solution {
        func productExceptSelf(_ nums: [Int]) -> [Int] {
            let numsCount = nums.count

            // Initialize the answer array of the same length as numsCount and fill it with 1.
            var answer = Array(repeating: 1, count: numsCount)

            // Calculate the prefix products directly in the answer array.
            // At each index i, update answer[i] to be the product of all elements to the left of nums[i], including nums[i] itself.
            for i in 1..<numsCount {
                answer[i] = answer[i - 1] * nums[i - 1]
            }

            // Initialize suffixProduct to a value of 1, this will store the product of all elements to the right of the current element.
            var suffixProduct = 1

            // Traverse the nums array from right to left.
            // At each index i update answer[i] by multiplying it with suffixProduct. Then update suffixProduct by multiplying it with nums[i].
            for i in (0..<numsCount).reversed() {
                answer[i] *= suffixProduct
                suffixProduct *= nums[i]
            }

            return answer
        }
    }

    func testExample1() {
        let solution = Solution()
        let nums = [1,2,3,4]
        let output = [24,12,8,6]

        XCTAssertEqual(output, solution.productExceptSelf(nums))
    }

    func testExample2() {
        let solution = Solution()
        let nums = [-1,1,0,-3,3]
        let output = [0,0,9,0,0]

        XCTAssertEqual(output, solution.productExceptSelf(nums))
    }

}
