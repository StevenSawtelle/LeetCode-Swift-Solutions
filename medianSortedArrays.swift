/*

4. Median of Two Sorted Arrays

There are two sorted arrays nums1 and nums2 of size m and n respectively.

Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).

Example 1:
nums1 = [1, 3]
nums2 = [2]

The median is 2.0
Example 2:
nums1 = [1, 2]
nums2 = [3, 4]

The median is (2 + 3)/2 = 2.5

Source: https://leetcode.com/problems/median-of-two-sorted-arrays

Editor's Note: Again, surprised at the inefficiencies of Swift. Having all instances of n1size
and n2size in the below file as their original Array.count variant was enough for LeetCode to 
fail with Time Limit Exceeded, but with the substitutions it passed beating 96% of Swift solutions.
It definitely proves to be an interesting challenge to work aroud.

*/

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        // Swift needs these lines to not timeout because of language inefficiencies :(
        var n1size = nums1.count
        var n2size = nums2.count
        // Easiest way to handle empty lists is separate cases for each
        if nums1.isEmpty {
            // If non-empty list has 1 element return that
            if n2size == 1 {
                return Double(nums2[0])
            }
            // If non-even list return middle element
            if n2size % 2 != 0 {
                return Double(nums2[n2size/2])
            }
            // If even list return average of middle two elements
            // Double casting needed as Swift doesn't implicitly convert
            return Double((nums2[n2size/2 - 1] + nums2[n2size/2])) / 2.0
        }
        // Handling same way if second list is empty
        if nums2.isEmpty {
            if n1size == 1 {
                return Double(nums1[0])
            }
            if n1size % 2 != 0 {
                return Double(nums1[n1size/2])
            }
            return Double((nums1[n1size/2 - 1] + nums1[n1size/2])) / 2.0
        }
        
        // Now handle both lists filled
        // Strategy here is to step through, filling in a new array in order as
        // you get elements from originals. Then median can be got from this array
        // Means it will run with O(n+m) time and O(n+m) space
        var run1 = 0
        var run2 = 0
        var newnums: [Int] = []
        while run1 + run2 < n1size + n2size {
            // If all elements grabbed from first array
            if run1 == n1size {
                newnums.append(nums2[run2])
                run2+=1
            }
            // If all elements grabbed from second array
            else if run2 == n2size {
                newnums.append(nums1[run1])
                run1+=1
            }
            // If next element to come from first array
            else if nums1[run1] < nums2[run2] {
                newnums.append(nums1[run1])
                run1+=1
            }
            // If next element to come from second array
            else {
                newnums.append(nums2[run2])
                run2+=1
            }
        }
        // Again with the inefficiency of Array.count in Swift
        var newcount = newnums.count
        // If odd, return middle of new list
        if newcount % 2 != 0 {
            return Double(newnums[newcount/2])
        }
        // if even, return average of middle two of new list
        return Double((newnums[newcount/2 - 1] + newnums[newcount/2])) / 2.0
    }
}
