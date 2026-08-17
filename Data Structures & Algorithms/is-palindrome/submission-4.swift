class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let alphanumericString = s.filter { $0.isLetter || $0.isNumber }.lowercased()

        return alphanumericString == String(alphanumericString.reversed())
    }
}
