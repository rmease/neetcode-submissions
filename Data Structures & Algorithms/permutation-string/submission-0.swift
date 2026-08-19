class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let s1Characters = Array(s1)
        let s2Characters = Array(s2)

        if s1Characters.count > s2Characters.count {
            return false
        }

        var s1CharacterCounts = [Character: Int]()

        for character in s1Characters {
            s1CharacterCounts[character, default: 0] += 1
        }

        // print("s1CharacterCounts:\(s1CharacterCounts)")

        var left = 0
        var characterCountsWithinWindow = [Character: Int]()

        for right in 0..<s2Characters.count {
            characterCountsWithinWindow[s2Characters[right], default: 0] += 1

            if ((right - left) + 1) > s1Characters.count {
                characterCountsWithinWindow[s2Characters[left], default: 0] -= 1

                if let characterCount = characterCountsWithinWindow[s2Characters[left]], characterCount == 0 {
                    characterCountsWithinWindow[s2Characters[left]] = nil
                }

                left += 1
            }

            if characterCountsWithinWindow == s1CharacterCounts {
                return true
            }
        }

        return false
    }
}
