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
        // we have reached the end of the input string
        // append the current combination and early return
        if index == digits.count {
            result.append(String(combination))
            return
        }

        let digit = digits[index]

        // if we cannnot find letters for the digit in our digitMap, early return
        // this is defensive, we should never hit this given input constraints
        guard let possibleLetters = digitMap[digit] else {
            return
        }

        // create a branch for every possible letter given the current digit
        for letter in possibleLetters {
            // add the current letter
            combination.append(letter)
            // branch to combinations for the rest of the input string
            backtrack(digits, from: index + 1)
            // remove the current letter and repeat in the outer loop with next letter
            combination.removeLast()
        }
    }
}
