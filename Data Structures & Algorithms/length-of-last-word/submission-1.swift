class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        let reversedString = String(s.reversed())
        var wordLengthCount = 0

        for character in reversedString {
            if character == Character(" ") {
                if wordLengthCount == 0 {
                    continue
                } else {
                    return wordLengthCount
                }
            } else {
                wordLengthCount += 1
            }
        }

        return wordLengthCount
    }
}
