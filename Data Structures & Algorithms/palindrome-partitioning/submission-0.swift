class Solution {
    private var result = [[String]]()
    private var currentPartition = [String]()

    func partition(_ s: String) -> [[String]] {
        backtrack(Array(s), from: 0)

        return result
    }

    private func backtrack(
        _ characters: [Character],
        from startIndex: Int
    ) {
        if startIndex == characters.count {
            result.append(currentPartition)
        }

        for endIndex in startIndex..<characters.count {
            if isPalindrome(characters, from: startIndex, to: endIndex) {
                let substring = String(characters[startIndex...endIndex])
                currentPartition.append(substring)
                backtrack(characters, from: endIndex + 1)
                currentPartition.removeLast()
            }
         }
    }

    // two pointers scane for palindrome status
    // start at each edge of the word, move toward the middle
    // early return as soon as non-matching characters are found
    private func isPalindrome(
        _ characters: [Character],
        from left: Int,
        to right: Int
    ) -> Bool {
        var left = left
        var right = right

        while left < right {
            if characters[left] != characters[right] {
                return false
            }

            left += 1
            right -= 1
        }

        return true
    }
}
