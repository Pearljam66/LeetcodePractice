//
//  InsertDeleteGetRandomO(1)Tests.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/10/24.
//

/*
 Implement the RandomizedSet class:

 RandomizedSet() Initializes the RandomizedSet object.
 bool insert(int val) Inserts an item val into the set if not present. Returns true if the item was not present, false otherwise.
 bool remove(int val) Removes an item val from the set if present. Returns true if the item was present, false otherwise.
 int getRandom() Returns a random element from the current set of elements (it's guaranteed that at least one element exists when this method is called). Each element must have the same probability of being returned.
 You must implement the functions of the class such that each function works in average O(1) time complexity.



 Example 1:

 Input
 ["RandomizedSet", "insert", "remove", "insert", "getRandom", "remove", "insert", "getRandom"]
 [[], [1], [2], [2], [], [1], [2], []]
 Output
 [null, true, false, true, 2, true, false, 2]

 Explanation
 RandomizedSet randomizedSet = new RandomizedSet();
 randomizedSet.insert(1); // Inserts 1 to the set. Returns true as 1 was inserted successfully.
 randomizedSet.remove(2); // Returns false as 2 does not exist in the set.
 randomizedSet.insert(2); // Inserts 2 to the set, returns true. Set now contains [1,2].
 randomizedSet.getRandom(); // getRandom() should return either 1 or 2 randomly.
 randomizedSet.remove(1); // Removes 1 from the set, returns true. Set now contains [2].
 randomizedSet.insert(2); // 2 was already in the set, so return false.
 randomizedSet.getRandom(); // Since 2 is the only number in the set, getRandom() will always return 2.


 Constraints:

 -231 <= val <= 231 - 1
 At most 2 * 105 calls will be made to insert, remove, and getRandom.
 There will be at least one element in the data structure when getRandom is called.
 */

import XCTest

final class InsertDeleteGetRandomO_1_Tests: XCTestCase {

    class Solution {
        private var set: Set<Int>
        private var array: [Int]

        init() {
            set = Set<Int>()
            array = [Int]()
        }

        @discardableResult
        func insert(_ val: Int) -> Bool {
            if set.contains(val) {
                return false
            }
            set.insert(val)
            array.append(val)
            return true
        }

        func remove(_ val: Int) -> Bool {
            if !set.contains(val) {
                return false
            }
            set.remove(val)
            if let index = array.firstIndex(of: val) {
                array.remove(at: index)
            }
            return true
        }

        func getRandom() -> Int {
            return array.randomElement()!
        }
    }

    func testInsert() {
        let solution = Solution()
        XCTAssertTrue(solution.insert(1))
        XCTAssertFalse(solution.insert(1))
        XCTAssertTrue(solution.insert(2))
    }

    func testRemove() {
        let solution = Solution()
        solution.insert(1)
        XCTAssertTrue(solution.remove(1))
        XCTAssertFalse(solution.remove(2))
    }

    func testGetRandom() {
        let solution = Solution()
        solution.insert(1)
        solution.insert(2)
        let result = solution.getRandom()
        XCTAssertTrue(result == 1 || result == 2)
    }

}
