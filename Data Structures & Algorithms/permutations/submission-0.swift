class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        var permutation: [Int] = []
        var used = Array(repeating: false, count: nums.count)

        backtrack(nums, &permutation, &used, &result)

        return result
    }

    func backtrack(
        _ nums: [Int],
        _ permutation: inout [Int],
        _ used: inout [Bool],
        _ result: inout [[Int]]
    ) {
        if permutation.count == nums.count {
            result.append(permutation)
            return
        }

        for i in 0..<nums.count {
            if used[i] {
                continue
            }

            permutation.append(nums[i])
            used[i] = true

            backtrack(nums, &permutation, &used, &result)

            permutation.removeLast()
            used[i] = false
        }
    }
}
