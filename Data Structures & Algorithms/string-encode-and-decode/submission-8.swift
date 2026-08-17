class Solution {
    private var stringDelimiter: Character = "#"

    func encode(_ strs: [String]) -> String {
        return String(strs.map { encodeString($0) }.joined())
    }

    func encodeString(_ str: String) -> String {
        return "\(str.count)\(stringDelimiter)\(str)"
    }

    func decode(_ str: String) -> [String] {
        var result = [String]()
        var currentIndex = str.startIndex

        while currentIndex < str.endIndex {
            let delimiterIndex = str[currentIndex...].firstIndex(of: stringDelimiter)!
            let length = Int(str[currentIndex..<delimiterIndex])!

            let encodedStringStartIndex = str.index(after: delimiterIndex)
            let encodedStringEndIndex = str.index(encodedStringStartIndex, offsetBy: length)

            result.append(String(str[encodedStringStartIndex..<encodedStringEndIndex]))

            currentIndex = encodedStringEndIndex
        }

        return result
    }
}
