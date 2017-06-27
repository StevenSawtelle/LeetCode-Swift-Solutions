/*

1. Two Sum

Given an array of integers, return indices of the two numbers such that they add up to a specific target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

Beats 51.25% of submissions on submit - 6/15/17

Source: https://leetcode.com/problems/two-sum

*/

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // Dictionary maps target to index
        var targetToIndex = [Int: Int]()
        
        for currentIndex in 0..<nums.count{
            // Return both indices if target is met
            if let foundIndex = targetToIndex[nums[currentIndex]]{
                return [foundIndex, currentIndex]
            }
            // Otherwise map the target to the result of the value to index
            targetToIndex[target - nums[currentIndex]] = currentIndex
        }
        // Default return (even though the assumption is there will always be something)
        return [-1,-1]
    }
}
