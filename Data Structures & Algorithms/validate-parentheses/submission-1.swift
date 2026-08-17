class Solution {
    func isValid(_ s: String) -> Bool {
        if s.count % 2 != 0 {
            return false
        }

        var openingBracesStack = [Character]()
        for character in s {
            switch character {
            case "[", "(", "{":
                openingBracesStack.append(character)
            case "]":
                guard let opening = openingBracesStack.popLast(), opening == "[" else {
                    return false
                }
            case ")":
                guard let opening = openingBracesStack.popLast(), opening == "(" else {
                    return false
                }
            case "}":
                guard let opening = openingBracesStack.popLast(), opening == "{" else {
                    return false
                }
            default:
                print("ERROR: Unexpected character in input string: \(s)")
                return false
            }
        }

        return openingBracesStack.count == 0
    }
}
