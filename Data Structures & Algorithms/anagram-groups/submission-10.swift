class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var result = [[Character: Int]: [String]]()
        for string in strs {
            result[anagramMap(of: string), default: [String]()].append(string)
        }

        return Array(result.values)
    }

    func anagramMap(of string: String) -> [Character:Int] {
        var result = [Character:Int]()

        for character in string {
            result[character, default: 0] += 1
        }

        return result
    }
}
