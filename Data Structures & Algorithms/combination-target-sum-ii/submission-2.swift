class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result: [[Int]] = []
        var current: [Int] = []
        var seenResults: Set<[Int]> = []

        // presort candidates to align duplicate candidates within input array
        // this allows us to skip traversals when we encounter duplicates
        let sortedCandidates = candidates.sorted()

        backtrack(candidates.sorted(), 0, target, &current, &result, &seenResults)
        return result
    }

    private func backtrack(
        _ candidates: [Int],
        _ start: Int,
        _ target: Int,
        _ current: inout [Int],
        _ result: inout [[Int]],
        _ seenResults: inout Set<[Int]>
    ) {
        let sum = current.reduce(0, +)

        // if sum of the current array is idential to target, append to result
        // but only a duplicate of current is not yet present in the result
        // use seenResults to verify new vs. repeat result
        if sum == target {
            let resultCandidate = current.sorted()

            if !seenResults.contains(resultCandidate) {
                result.append(resultCandidate)
                seenResults.insert(resultCandidate)
            }

            return
        }

        // if sum has exceeded target, do not proceed
        // given increasing sort order, we know that remaining numbers will sum to > target
        if sum > target {
            return
        }

        for i in start..<candidates.count {
            // skip traversal when encountering a duplicate candidate
            if i > start && candidates[i] == candidates[i - 1] {
                continue
            }

            current.append(candidates[i])
            // traverse the remainder of the input candidates for a valid combination
            // backtrack with i + 1 because we cannot resuse candidates in this problem
            backtrack(candidates, i + 1, target, &current, &result, &seenResults)
            current.removeLast()
        }
    }
}
