class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var left = 0
        var right = 0

        var maxLength = 0
        var characters: [Character] = Array(s)

        var currentCharacters = Set<Character>()

        while right < characters.count {
            while currentCharacters.contains(characters[right]) {
                currentCharacters.remove(characters[left])
                left += 1
            }

            currentCharacters.insert(characters[right])
            maxLength = max(maxLength, (right - left + 1))
            right += 1
        }

        return maxLength
    }
}
