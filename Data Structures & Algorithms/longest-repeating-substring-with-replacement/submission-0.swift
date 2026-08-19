class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var left = 0
        var characters = Array(s)
        var characterCounts = [Character : Int]()
        var mostFrequentCharacterCount = 0

        var longestPossibleSubstringCount = 0

        for right in 0..<characters.count {
            let character = characters[right]

            characterCounts[character, default: 0] += 1
            mostFrequentCharacterCount = max(
                mostFrequentCharacterCount,
                characterCounts[character, default: 0]
            )

            while ((right - left + 1) - mostFrequentCharacterCount) > k {
                characterCounts[characters[left], default: 0] -= 1
                left += 1
            }

            longestPossibleSubstringCount = max(longestPossibleSubstringCount, (right - left + 1))
        }

        return longestPossibleSubstringCount
    }
}
