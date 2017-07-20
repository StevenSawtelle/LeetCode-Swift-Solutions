/*

206. Reverse Linked List

Reverse a singly linked list.

Example Input: 1 -> 2 -> 3

Example Output: 3 -> 2 -> 1

Beats 98.67% of submissions on submit - 7/19/17

Source: https://leetcode.com/problems/reverse-linked-list/

*/

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        // head is a constant, reassign as variable
        var currentNode = head
        // Will be the running constructor of our reversed list
        var previousNode: ListNode?
        // i.e. "for the entirety of the linked list"
        while (currentNode != nil){
            // Hold onto next pointer before reassigning
            var holdNode = currentNode?.next
            // Set next to the previous position
            currentNode?.next = previousNode
            // Previous position moves forward to current position
            previousNode = currentNode
            // Current position moves forward to what was previously the next position
            currentNode = holdNode
        }
        // return fully constructed reversed list
        return previousNode
    }
}
