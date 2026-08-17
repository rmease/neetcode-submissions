class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var seenCharacters = [Character: Int]()

        for character in s {
            seenCharacters[character, default: 0] += 1
        }

        for character in t {
            seenCharacters[character, default: 0] -= 1
            
            if let characterCount = seenCharacters[character], characterCount < 0 {
                return false
            }
        }

        return seenCharacters.values.allSatisfy { $0 == 0 }
    }
}
