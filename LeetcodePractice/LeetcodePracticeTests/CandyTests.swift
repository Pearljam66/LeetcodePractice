//
//  CandyTests.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/13/24.
//

/*
 There are n children standing in a line. Each child is assigned a rating value given in the integer array ratings.

 You are giving candies to these children subjected to the following requirements:

 Each child must have at least one candy.
 Children with a higher rating get more candies than their neighbors.
 Return the minimum number of candies you need to have to distribute the candies to the children.


 Example 1:

 Input: ratings = [1,0,2]
 Output: 5
 Explanation: You can allocate to the first, second and third child with 2, 1, 2 candies respectively.
 Example 2:

 Input: ratings = [1,2,2]
 Output: 4
 Explanation: You can allocate to the first, second and third child with 1, 2, 1 candies respectively.
 The third child gets 1 candy because it satisfies the above two conditions.


 Constraints:

 n == ratings.length
 1 <= n <= 2 * 104
 0 <= ratings[i] <= 2 * 104


 */

import XCTest

final class CandyTests: XCTestCase {

    class Solution {
        func candy(_ ratings: [Int]) -> Int {
            // Number of children standing in a line, this is equal to the number of ratings.
            let n = ratings.count
            var candies = Array(repeating: 1, count: n)

            // Each child must have at least one candy
            // Children with a higher rating get more candies than their neighbors.

            // Forward pass: Give candies to children with higher ratings than their left neighbors.
            for i in 1..<n {
                if ratings[i] > ratings[i - 1] {
                    candies[i] = candies[i - 1] + 1
                }
            }

            // Backward pass: Give candies to children with higher ratings than their right neighbors.
            for i in (0..<n-1).reversed() {
                if ratings[i] > ratings[i + 1] {
                    candies[i] = max(candies[i], candies[i + 1] + 1)
                }
            }

            // Return the minimum number of candies you need by adding all of the elements in the candy array.
            return candies.reduce(0, +)
        }
    }

    func testExample1() {
        let solution = Solution()
        let ratings = [1,0,2]
        let output = 5

        XCTAssertEqual(solution.candy(ratings), output)
    }

    func testExample2() {
        let solution = Solution()
        let ratings = [1,2,2]
        let output = 4

        XCTAssertEqual(solution.candy(ratings), output)
    }


}
