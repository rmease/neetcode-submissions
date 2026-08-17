class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var anagramGroups: [String: [String]] = [:]
        anagramGroups.reserveCapacity(strs.count)

        for string in strs {
            let stringAnagram = String(string.sorted())
            anagramGroups[stringAnagram, default: []].append(string)
        }

        return Array(anagramGroups.values)
    }
}
