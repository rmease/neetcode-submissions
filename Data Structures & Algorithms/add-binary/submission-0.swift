class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        let reversedA = Array(a.reversed())
        let reversedB = Array(b.reversed())

        var result = [Character]()
        var index = 0
        var carry = 0

        while index < reversedA.count || index < reversedB.count || carry > 0 {
            let digitA: Int

            if index < reversedA.count {
                digitA = reversedA[index].wholeNumberValue ?? 0
            } else {
                digitA = 0
            }

            let digitB: Int

            if index < reversedB.count {
                digitB = reversedB[index].wholeNumberValue ?? 0
            } else {
                digitB = 0
            }

            let sum = digitA + digitB + carry

            let resultDigit = sum % 2
            carry = sum / 2

            result.append(Character(String(resultDigit)))
            index += 1
        }

        return String(result.reversed())
    }
}
