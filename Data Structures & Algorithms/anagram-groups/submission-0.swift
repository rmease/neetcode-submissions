class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var anagramGroups: [String: [String]] = [:]

        for string in strs {
            let stringAnagram = String(string.sorted())
            anagramGroups[stringAnagram, default: []].append(string)
        }

        return Array(anagramGroups.values)
    }
}
