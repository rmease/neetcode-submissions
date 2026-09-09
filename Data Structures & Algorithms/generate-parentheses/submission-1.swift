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
        // if the current pairs of parentheses match the requirement, append curent
        if current.count == totalRequiredCount * 2 {
            result.append(current)
            return
        }

        // with the two if statements below
        // we explore all possible branches of open/closed permutations
        // by exploring the open branch first, we enable (within the open recursion)
        // the exploration of the close branch

        // explore permutations of current with additional opening brackets
        // but only if we can still add more opening brackets
        if openCount < totalRequiredCount {
            backtrack(
                current + "(",
                openCount: openCount + 1,
                closeCount: closeCount,
                totalRequiredCount: totalRequiredCount
            )
        }

        // explore permutations of current with additional closing brackets
        // but only if there are open brackets available to close
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
