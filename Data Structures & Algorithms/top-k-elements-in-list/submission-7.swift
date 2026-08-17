class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var numsByFrequency = [Int:Int]()

        for num in nums {
            numsByFrequency[num, default: 0] += 1
        }

        var frequencyGroups = [[Int]](repeating: [], count: (nums.count + 1))

        for (num, frequency) in numsByFrequency {
            frequencyGroups[frequency].append(num)
        }

        var result = [Int]()

        for group in frequencyGroups.reversed() {
            for num in group {
                result.append(num)

                if result.count == k {
                    return result
                }
            }
        }

        return result
    }
}
