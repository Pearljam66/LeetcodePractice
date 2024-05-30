//
//  HappyNumberTests.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/30/24.
//

/*
 Write an algorithm to determine if a number n is happy.

 A happy number is a number defined by the following process:

 Starting with any positive integer, replace the number by the sum of the squares of its digits.
 Repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1.
 Those numbers for which this process ends in 1 are happy.
 Return true if n is a happy number, and false if not.

 Example 1:
 Input: n = 19
 Output: true
 Explanation:
 12 + 92 = 82
 82 + 22 = 68
 62 + 82 = 100
 12 + 02 + 02 = 1

 Example 2:
 Input: n = 2
 Output: false

 Constraints:

 1 <= n <= 231 - 1

 */

import XCTest

final class HappyNumberTests: XCTestCase {

    class Solution {

        func isHappy(_ n: Int) -> Bool {
            var seenNumbers = Set<Int>()
            var number = n

            while number != 1 && !seenNumbers.contains(number) {
                seenNumbers.insert(number)
                number = sumOfSquaresOfDigits(number)
            }

            return number == 1
        }

        private func sumOfSquaresOfDigits(_ n: Int) -> Int {
            var sum = 0
            var number = n

            while number > 0 {
                let digit = number % 10
                sum += digit * digit
                number /= 10
            }

            return sum
        }

    }

    func testExample1() {
        let solution = Solution()
        let n = 19

        XCTAssertTrue(solution.isHappy(19))
    }

    func testExample2() {
        let solution = Solution()
        let n = 2

        XCTAssertFalse(solution.isHappy(2))
    }

}
