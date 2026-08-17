class Solution {
    private let delimiter: Character = ":"

    func encode(_ strs: [String]) -> String {
        return strs.map { str in
            return "\(str.count)\(delimiter)\(str)"
        }.joined()
    }

    func decode(_ str: String) -> [String] {
        let chars = Array(str)
        var result: [String] = []
        var index = 0

        while index < chars.count {
            var prefix = ""

            // Read the length prefix.
            while index < chars.count && chars[index] != delimiter {
                prefix.append(chars[index])
                index += 1
            }

            guard index < chars.count,
                  let length = Int(prefix) else {
                return result
            }

            index += 1 // Skip the delimiter.

            let endIndex = index + length

            guard endIndex <= chars.count else {
                return result
            }

            result.append(String(chars[index..<endIndex]))
            index = endIndex
        }

        return result
    }
}
