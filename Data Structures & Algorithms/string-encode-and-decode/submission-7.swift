class Solution {
    private let delimiter: Character = "#"

    func encode(_ strs: [String]) -> String {
        return strs.map { encoded($0) }.joined(separator: "")
    }

    func decode(_ str: String) -> [String] {
        var result = [String]()
        var currentIndex = str.startIndex

        while currentIndex < str.endIndex {
            let nextSeparatorIndex = str[currentIndex...].firstIndex(of: delimiter)!

            let stringLength = Int(str[currentIndex..<nextSeparatorIndex])!
            let stringStart = str.index(after: nextSeparatorIndex)
            let stringEnd = str.index(stringStart, offsetBy: stringLength)

            result.append(String(str[stringStart..<stringEnd]))

            currentIndex = stringEnd
        }

        return result
    }

    private func encoded(_ string: String) -> String {
        return "\(string.count)\(delimiter)\(string)"
    }
}
