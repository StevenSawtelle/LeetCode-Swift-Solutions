/*

2. Add Two Numbers

You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
Output: 7 -> 0 -> 8

Source: https://leetcode.com/problems/add-two-numbers
*/

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        // Vars to track node values and carryover
        var sum = 0
        var rem = 0
        var carry = 0
        var RunNode = ListNode(-1)
        var ReturnNode = RunNode
        // Given params are lets, replace with vars for running
        var newl1 = l1
        var newl2 = l2
        // Run until both lists are empty and carry not 0
        while((newl1 != nil || newl2 != nil) || carry != 0){
            // Get sum from all available sources and update other values accordingly
            sum = (newl1 != nil ? newl1!.val : 0) + (newl2 != nil ? newl2!.val : 0) + carry
            carry = sum / 10
            rem = sum % 10
            // Move linked list nodes forward with new values as needed
            RunNode.next = ListNode(rem)
            RunNode = RunNode.next!
            if newl1 != nil { newl1 = newl1!.next }
            if newl2 != nil { newl2 = newl2!.next }
        }
        // Return original pointer (moved forward one (away from -1))
        return ReturnNode.next
    }
}
