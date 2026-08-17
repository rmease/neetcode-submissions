class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var anagramGroups = [String: [String]]()

        for string in strs {
            let sortedKey = String(string.sorted())
            anagramGroups[sortedKey, default: [String]()].append(string)
        }

        return Array(anagramGroups.values)
    }
}