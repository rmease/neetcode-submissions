class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let cleanedString = String(s.filter {
            $0.isASCII && ($0.isLetter || $0.isNumber)
        }).lowercased()

        print("\(cleanedString)")

        return cleanedString == String(cleanedString.reversed())
    }
}
