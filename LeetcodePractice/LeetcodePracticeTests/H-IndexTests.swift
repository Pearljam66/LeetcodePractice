//
//  H-IndexTests.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/10/24.
//

/*
 Given an array of integers citations where citations[i] is the number of citations a researcher received for their ith paper, return the researcher's h-index.

 According to the definition of h-index on Wikipedia: The h-index is defined as the maximum value of h such that the given researcher has published at least h papers that have each been cited at least h times.



 Example 1:

 Input: citations = [3,0,6,1,5]
 Output: 3
 Explanation: [3,0,6,1,5] means the researcher has 5 papers in total and each of them had received 3, 0, 6, 1, 5 citations respectively.
 Since the researcher has 3 papers with at least 3 citations each and the remaining two with no more than 3 citations each, their h-index is 3.
 Example 2:

 Input: citations = [1,3,1]
 Output: 1


 Constraints:

 n == citations.length
 1 <= n <= 5000
 0 <= citations[i] <= 1000

 */

import XCTest

final class H_IndexTests: XCTestCase {

    class Solution {

        func hIndex(_ citations: [Int]) -> Int {
            let totalNumberOfPapers = citations.count
            var citationsList = citations

            // Sort the citations array in non-decreasing order.
            citationsList.sort(by: { $0 > $1 })

            // Now, starting from the paper with the highest number of citations, you count how many papers have
            // at least that many citations.
            for (index, citationCount) in citationsList.enumerated() {
                if citationCount < index + 1 {
                    return index
                }
            }

            // If all papers have at least as many citations as the total number of papers,
            // the h-index is equal to the total number of papers.
            return totalNumberOfPapers
        }
    }

    func testExample1() {
        let solution = Solution()
        let citations = [3,0,6,1,5]
        let output = 3

        XCTAssertEqual(output, solution.hIndex(citations))
    }

    func testExample2() {
        let solution = Solution()
        let citations = [1,3,1]
        let output = 1

        XCTAssertEqual(output, solution.hIndex(citations))

    }

}
