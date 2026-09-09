class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        var current: [Int] = []

        backtrack(nums, 0, &current, &result)
        return result
    }

    private func backtrack(
        _ nums: [Int],
        _ start: Int,
        _ current: inout [Int],
        _ result: inout [[Int]]
    ) {
        result.append(current)

        for i in start..<nums.count {
            current.append(nums[i])
            backtrack(nums, i + 1, &current, &result)
            current.removeLast()
        }
    }
}
