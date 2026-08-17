class Solution {
    func isPalindrome(_ s: String) -> Bool {
        var characters = Array(
            s.filter { $0.isLetter || $0.isNumber }.lowercased()
        )

        var left = 0
        var right = characters.count - 1

        while left < right {
            guard characters[left] == characters[right] else {
                return false
            }
            left += 1
            right -= 1
        }

        return true
    }
}
