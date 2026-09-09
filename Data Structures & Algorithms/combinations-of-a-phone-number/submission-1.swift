class Solution {
    private var result = [String]()
    private var combination = [Character]()

    private let digitMap: [Character: [Character]] = [
        "2": ["a", "b", "c"],
        "3": ["d", "e", "f"],
        "4": ["g", "h", "i"],
        "5": ["j", "k", "l"],
        "6": ["m", "n", "o"],
        "7": ["p", "q", "r", "s"],
        "8": ["t", "u", "v"],
        "9": ["w", "x", "y", "z"]
    ]

    func letterCombinations(_ digits: String) -> [String] {
        guard !digits.isEmpty else {
            return []
        }

        backtrack(Array(digits), from: 0)

        return result
    }

    private func backtrack(
        _ digits: [Character],
        from index: Int
    ) {
        // we have scanned far enough such that our combination
        // matches the length of the input
        // therefore, we have a valid result to append
        if index == digits.count {
            result.append(String(combination))
            return
        }

        let digit = digits[index]

        // if we cannnot find letters for the digit in our digitMap
        // scan led us out of bounds for the digitMap (e.g. 10) so early return
        guard let possibleLetters = digitMap[digit] else {
            return
        }

        // scan for all permutations of the remaining letters, then backtrack
        for letter in possibleLetters {
            // add the current letter
            combination.append(letter)
            // scan the rest of the input string
            backtrack(digits, from: index + 1)
            // remove the current letter and repeat in the outer loop with next letter
            combination.removeLast()
        }
    }
}
