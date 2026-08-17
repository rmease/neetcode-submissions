class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let characters = Array(s.filter { $0.isLetter || $0.isNumber }.lowercased())

        var start = 0
        var end = characters.count - 1

        while start < end {
            guard characters[start] == characters[end] else {
                return false
            }

            start += 1
            end -= 1
        }

        return true
    }
}
