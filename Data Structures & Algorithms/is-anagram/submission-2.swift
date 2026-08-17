class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var seenCharacterCount = [Character:Int]()

        for character in s {
            seenCharacterCount[character, default: 0] += 1
        }

        for character in t {
            seenCharacterCount[character, default: 0] -= 1

            if let count = seenCharacterCount[character], count < 0 {
                return false
            }
        }

        return seenCharacterCount.values.allSatisfy { $0 == 0 }
    }
}
