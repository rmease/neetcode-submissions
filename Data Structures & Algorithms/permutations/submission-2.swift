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
        // we have a complete permutation of nums, append to result and return
        if permutation.count == nums.count {
            result.append(permutation)
            return
        }

        // scan all values of nums against the used array
        for i in 0..<nums.count {
            // if the value at this index has already been used, skip
            // as we recurse, this isolates the unused values
            if used[i] {
                continue
            }

            // otherwise, append the value to the current permutation
            // then, mark the value's index as used (true) in the used array
            permutation.append(nums[i])
            used[i] = true

            // build this permutation by recursing through the rest of nums
            backtrack(nums, &permutation, &used, &result)

            // backtrack the last element added to the permutation (nums[i])
            // and also backtrack the marking of the value as used
            // for example, with input [1,2,3]
            // we might explore the permutations of [1, ?, ?]
            // we first assemble [1,2,3], then back out to [1], then add [1,3,2]
            permutation.removeLast()
            used[i] = false
        }
    }
}
