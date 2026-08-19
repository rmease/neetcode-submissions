class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let s1Characters = Array(s1)
        let s2Characters = Array(s2)

        if s1Characters.count > s2Characters.count {
            return false
        }

        // step 1: build hash of character counts within s1 (enables permutation check)

        var s1CharacterCounts = [Character: Int]()

        for character in s1Characters {
            s1CharacterCounts[character, default: 0] += 1
        }

        // step 2: using a sliding window, compare window of size s1.count to s1CharacterCounts
        var left = 0
        var characterCountsWithinWindow = [Character: Int]()

        for right in 0..<s2Characters.count {
            characterCountsWithinWindow[s2Characters[right], default: 0] += 1

            // skip permutation check until windowSize ((left - right) + 1) matches s1.count

            if ((right - left) + 1) > s1Characters.count {
                
                // when the windowSize is large enough, start moving the window
                // remove previous left content from sliding window counts
                // then slide left

                characterCountsWithinWindow[s2Characters[left], default: 0] -= 1

                if let characterCount = characterCountsWithinWindow[s2Characters[left]], characterCount == 0 {
                    characterCountsWithinWindow[s2Characters[left]] = nil
                }

                left += 1
            }

            // if the current window is a permutation of s1, return true

            if characterCountsWithinWindow == s1CharacterCounts {
                return true
            }
        }

        return false
    }
}
