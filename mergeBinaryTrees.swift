/*

617. Merge Two Binary Trees

Given two binary trees and imagine that when you put one of them to cover the other,
some nodes of the two trees are overlapped while the others are not.

You need to merge them into a new binary tree. The merge rule is that if two nodes overlap,
then sum node values up as the new value of the merged node. Otherwise, the NOT null node
will be used as the node of new tree.

Example 1:
Input: 
	Tree 1                     Tree 2                  
          1                         2                             
         / \                       / \                            
        3   2                     1   3                        
       /                           \   \                      
      5                             4   7                  
Output: 
Merged tree:
	     3
	    / \
	   4   5
	  / \   \ 
	 5   4   7
Note: The merging process must start from the root nodes of both trees.

Beats 94.25% of submissions on submit - 7/10/17

Source: https://leetcode.com/problems/merge-two-binary-trees/

*/

/*
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
    
        // Handle double nil case
        if(t1 == nil && t2 == nil){
            return nil;
        }
        
        // Create initial node with valid sums
        let currentSum = (t1==nil ? 0 : t1!.val) + (t2==nil ? 0 : t2!.val);
        var returnNode: TreeNode!;
        returnNode = TreeNode(currentSum);
        
        // Add left and right nodes recursively
        returnNode.left = mergeTrees(t1==nil ? nil : t1!.left, t2==nil ? nil : t2!.left);
        returnNode.right = mergeTrees(t1==nil ? nil : t1!.right, t2==nil ? nil : t2!.right);
        return returnNode;
    }
}
