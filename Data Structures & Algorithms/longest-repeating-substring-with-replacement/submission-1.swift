class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var left = 0
        var characters = Array(s)
        var characterCountsWithinWindow = [Character : Int]()
        var mostFrequentCharacterCountWithinWindow = 0

        var longestPossibleSubstringCount = 0

        for right in 0..<characters.count {
            let character = characters[right]

            characterCountsWithinWindow[character, default: 0] += 1
            mostFrequentCharacterCountWithinWindow = max(
                mostFrequentCharacterCountWithinWindow,
                characterCountsWithinWindow[character, default: 0]
            )

            // (while windowLength - mostFrequentCharacterCount) > maxPossibleSubstitutions
            while ((right - left + 1) - mostFrequentCharacterCountWithinWindow) > k {
                characterCountsWithinWindow[characters[left], default: 0] -= 1
                left += 1
            }

            longestPossibleSubstringCount = max(longestPossibleSubstringCount, (right - left + 1))
        }

        return longestPossibleSubstringCount
    }
}
