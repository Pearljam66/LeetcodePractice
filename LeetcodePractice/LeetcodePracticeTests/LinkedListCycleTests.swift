//
//  LinkedListCycleTests.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 6/9/24.
//

/*
 Given head, the head of a linked list, determine if the linked list has a cycle in it.

 There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer. Internally, pos is used to denote the index of the node that tail's next pointer is connected to. Note that pos is not passed as a parameter.

 Return true if there is a cycle in the linked list. Otherwise, return false.

 Example 1:
 Input: head = [3,2,0,-4], pos = 1
 Output: true
 Explanation: There is a cycle in the linked list, where the tail connects to the 1st node (0-indexed).
 

 Example 2:
 Input: head = [1,2], pos = 0
 Output: true
 Explanation: There is a cycle in the linked list, where the tail connects to the 0th node.
 

 Example 3:
 Input: head = [1], pos = -1
 Output: false
 Explanation: There is no cycle in the linked list.

 Constraints:

 The number of the nodes in the list is in the range [0, 104].
 -105 <= Node.val <= 105
 pos is -1 or a valid index in the linked-list.

 Follow up: Can you solve it using O(1) (i.e. constant) memory?
 */

import XCTest

final class LinkedListCycleTests: XCTestCase {

    class Solution {
        func hasCycle(_ head: ListNode?) -> Bool {
            var slow = head
            var fast = head

            while let slowUnwrapped = slow, let fastUnwrapped = fast, let nextFast = fastUnwrapped.next {
                slow = slowUnwrapped.next
                fast = nextFast.next
                if slow === fast {
                    return true
                }
            }

            return false
        }
    }

    class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }

    func testExample1() {
        let solution = Solution()
        let head = ListNode(3)
        let node2 = ListNode(2)
        let node3 = ListNode(0)
        let node4 = ListNode(-4)

        head.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node2  // Creates a cycle

        XCTAssertTrue(solution.hasCycle(head))
    }

    func testExample2() {
        let solution = Solution()
        let head = ListNode(1)
        let node2 = ListNode(2)

        head.next = node2
        node2.next = head  // Creates a cycle

        XCTAssertTrue(solution.hasCycle(head))
    }

    func testExample3() {
        let solution = Solution()
        let head = ListNode(1)

        XCTAssertFalse(solution.hasCycle(head))
    }

}
