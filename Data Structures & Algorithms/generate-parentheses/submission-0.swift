class Solution {
    private var result = [String]()
    func generateParenthesis(_ n: Int) -> [String] {
        backtrack("", openCount: 0, closeCount: 0, totalRequiredCount: n)

        return result
    }

    private func backtrack(
        _ current: String,
        openCount: Int,
        closeCount: Int,
        totalRequiredCount: Int
    ) {
        if current.count == totalRequiredCount * 2 {
            result.append(current)
            return
        }

        if openCount < totalRequiredCount {
            backtrack(
                current + "(",
                openCount: openCount + 1,
                closeCount: closeCount,
                totalRequiredCount: totalRequiredCount
            )
        }

        if closeCount < openCount {
            backtrack(
                current + ")",
                openCount: openCount,
                closeCount: closeCount + 1,
                totalRequiredCount: totalRequiredCount
            )
        }
    }
}
