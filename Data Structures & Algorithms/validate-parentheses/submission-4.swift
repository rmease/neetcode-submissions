class Solution {
    func isValid(_ s: String) -> Bool {
        let characters = Array(s)
        var openedPairs = [Character]()

        for character in characters {
            switch character {
                case "{", "[", "(":
                    openedPairs.append(character)
                case "}":
                    guard let lastOpenedPair = openedPairs.popLast(), lastOpenedPair == "{" else {
                        return false
                    }
                case "]":
                    guard let lastOpenedPair = openedPairs.popLast(), lastOpenedPair == "[" else {
                        return false
                    }
                case ")":
                    guard let lastOpenedPair = openedPairs.popLast(), lastOpenedPair == "(" else {
                        return false
                    }
                default: 
                    print("ERROR: encountered unexpected character: \(character)")
            }
        }

        return openedPairs.isEmpty
    }
}
