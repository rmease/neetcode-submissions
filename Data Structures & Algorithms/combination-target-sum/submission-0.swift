class Solution {
    func combinationSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var result: [[Int]] = []
        var current: [Int] = []

        backtrack(nums, 0, &current, &result, target)
        return result
    }

    private func backtrack(
        _ nums: [Int],
        _ start: Int,
        _ current: inout [Int],
        _ result: inout [[Int]],
        _ target: Int
    ) { 
        // if the sum of content of current matches our target, append current and return
        // this exits the current backtrack
        let currentSum = current.reduce(0, +)
        if (currentSum == target) {
            result.append(current)
            return
        }

        // if the sum of content of current exceeds our target, return
        // this backtrack has overrun the target and is no longer a plausible result candidate
        // this exits the current backtrack
        if (currentSum > target) {
            return
        }

        for i in start..<nums.count {
            current.append(nums[i])
            // backtrack with i instead of i + 1, because we can reuse a number multiple times
            backtrack(nums, i, &current, &result, target)
            current.removeLast()
        }
    }
}
