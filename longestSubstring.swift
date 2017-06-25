/*

3. Longest Substring Without Repeating Characters

Given a string, find the length of the longest substring without repeating characters.

Examples:

Given "abcabcbb", the answer is "abc", which the length is 3.

Given "bbbbb", the answer is "b", with the length of 1.

Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.

Source: https://leetcode.com/problems/longest-substring-without-repeating-characters

Editor's Note: I had no idea Swift would make accessing String indeces so hard (and, when available, inefficient).
It will be interesting to see if future releases of the language improve this and make this answer arcane.

/*


class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s == "" { return 0 }
        
        // Swift (annoyingly) does not allow for String indexing with Integers,
        // so the solution here is to convert to UTF-8 and work from there instead
        let real_s = Array(s.utf8)
        var charsToIndeces: [UInt8:Int] = [:]
        
        // back tracks the last valid start index and maximum will be the returned value.
        // Basically this is the same concept as many of the two pointer solutions to
        // this problem, with back being the left pointer
        var back = 0
        var maximum = 0
        
        for front in 0..<real_s.count{
            var currentChar = real_s[front]
            // Update left pointer if repeat char found
            if let oldIndex = charsToIndeces[currentChar]{
                back = max(back, oldIndex + 1)
            }
            // Always update dict (HashMap) with most recent index and recalculate max
            charsToIndeces[currentChar] = front
            maximum = max(maximum, front - back + 1)
        }
        return maximum
    }
}
