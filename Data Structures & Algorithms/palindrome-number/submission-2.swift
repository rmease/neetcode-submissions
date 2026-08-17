class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else {
            return false
        }

        var reversedX = 0
        var remainingX = x
        var nextReversedDigit = 0

        while remainingX > 0 {
            nextReversedDigit = remainingX % 10
            reversedX = (reversedX * 10) + nextReversedDigit
            remainingX = remainingX / 10
        }

        return reversedX == x
    }
}
