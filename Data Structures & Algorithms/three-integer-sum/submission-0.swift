class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var uniqueResults = Set<[Int]>()

        for i in 0..<nums.count {
            for j in (i + 1)..<nums.count {
                for k in (j + 1)..<nums.count {
                    if (nums[i] + nums[j] + nums[k]) == 0 {
                        uniqueResults.insert(
                            Array([nums[i], nums[j], nums[k]].sorted())
                        )
                    }
                }
            }
        }

        return Array(uniqueResults)
    }
}
