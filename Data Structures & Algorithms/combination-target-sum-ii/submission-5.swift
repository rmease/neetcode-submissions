class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result: [[Int]] = []
        var current: [Int] = []

        // presort candidates to align duplicate candidates within input array
        // this allows us to skip traversals when we encounter duplicates
        let sortedCandidates = candidates.sorted()

        backtrack(sortedCandidates, 0, target, &current, &result)
        return result
    }

    private func backtrack(
        _ candidates: [Int],
        _ start: Int,
        _ target: Int,
        _ current: inout [Int],
        _ result: inout [[Int]]
    ) {
        let sum = current.reduce(0, +)

        // if sum of the current array is idential to target, append to result
        if sum == target {
            result.append(current)
            return
        }

        // if sum has exceeded target, do not proceed
        // adding more numbers will not reach our target because all input candidates are > 0
        if sum > target {
            return
        }

        for i in start..<candidates.count {
            // skip traversal when encountering a duplicate candidate
            // i > start means this is at least the second iteration at this level
            // if we see the same number, skip this (duplicate) candidate
            if i > start && candidates[i] == candidates[i - 1] {
                continue
            }

            current.append(candidates[i])
            // traverse the remainder of the input candidates for a valid combination
            // backtrack with i + 1 because we cannot resuse candidates in this problem
            backtrack(candidates, i + 1, target, &current, &result)
            current.removeLast()
        }
    }
}
