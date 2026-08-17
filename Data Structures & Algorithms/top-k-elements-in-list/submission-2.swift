class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var frequencyCounts: [Int: Int] = [:]

        for num in nums {
            frequencyCounts[num, default: 0] += 1
        }

        if frequencyCounts.count == k {
            return Array(frequencyCounts.keys)
        } else {
            return frequencyCounts.sorted { $0.value > $1.value }.prefix(k).map { $0.key }
        }
    }
}
