class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result: [[Int]] = []
        var current: [Int] = []
        var seenResults: Set<[Int]> = []

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

        if sum == target {
            let resultCandidate = current.sorted()

            if !seenResults.contains(resultCandidate) {
                result.append(resultCandidate)
                seenResults.insert(resultCandidate)
            }

            return
        }

        if sum > target {
            return
        }

        for i in start..<candidates.count {
            // do not revisit identical numbers
            if i > start && candidates[i] == candidates[i - 1] {
                continue
            }
            current.append(candidates[i])
            backtrack(candidates, i + 1, target, &current, &result, &seenResults)
            current.removeLast()
        }
    }
}
