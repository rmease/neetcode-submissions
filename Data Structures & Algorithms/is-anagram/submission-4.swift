class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count {
            return false
        }

        var sCharacterCount = [Character:Int]()
        var tCharacterCount = [Character:Int]()

        for character in s {
            sCharacterCount[character, default: 0] += 1
        }
        for character in t {
            tCharacterCount[character, default: 0] += 1
        }

        return sCharacterCount == tCharacterCount
    }
}
