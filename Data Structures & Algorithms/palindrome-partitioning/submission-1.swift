class Solution {
    private var result = [[String]]()
    private var partitions = [String]()

    func partition(_ s: String) -> [[String]] {
        backtrack(Array(s), from: 0)

        return result
    }

    private func backtrack(
        _ characters: [Character],
        from startIndex: Int
    ) {
        // when we reach the end of the string, append current partition to the result
        // we will reach the end of the string multiple times as we scan
        // we only add to the result when we reach the word end because
        // that signals that we have partitioned the entire input string
        // which is a requirement for the problem
        if startIndex == characters.count {
            result.append(partitions)
            return
        }

        for endIndex in startIndex..<characters.count {
            // if the current range forms a palindrome, add it to the partition
            // then scan through the rest of the word seeking unique partitions
            // e.g. "aabb" 
            // -> from "a" we can only add "a", and then we can add "bb" or "b", "b"
            if isPalindrome(characters, from: startIndex, to: endIndex) {
                let substring = String(characters[startIndex...endIndex])
                partitions.append(substring)
                backtrack(characters, from: endIndex + 1)
                partitions.removeLast()
            }
         }
    }

    // two pointers scan for palindrome status
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
