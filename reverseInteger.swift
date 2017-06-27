/*

7. Reverse Integer

Reverse digits of an integer.

Example1: x = 123, return 321
Example2: x = -123, return -321

Beats 84.89% of submissions on submit - 6/26/17

Source: https://leetcode.com/problems/reverse-integer/

*/

class Solution {
    func reverse(_ x: Int) -> Int {
        // Recast x as mutable for algorithm's use
        var changeableX = x
        var reversed = 0
        // Iterate, multiplying past results by 10 (shifting left one magnitude)
        // and adding new digit to one's position while taking off that value from x
        while changeableX != 0 {
            var nextDigit = changeableX % 10
            reversed = reversed * 10 + nextDigit
            changeableX /= 10
        }
        // Check if out of bounds result for signed 32 bit integer (surely there's a prettier way...)
        if reversed > Int(Int32.max) || reversed < Int(Int32.min){
            return 0
        }
        return reversed
    }
}
