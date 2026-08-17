class Solution {
    func maxArea(_ heights: [Int]) -> Int {
        var result: Int = 0

        for i in 0..<heights.count {
            for j in (i + 1)..<heights.count {
                result = max(
                    result,
                    maxPossibleArea(
                        row1: i,
                        col1: heights[i],
                        row2: j,
                        col2: heights[j]
                    )
                )
            }
        }

        return result
    }

    func maxPossibleArea(row1: Int, col1: Int, row2: Int, col2: Int) -> Int {
        return (row2 - row1) * min(col1, col2)
    }
}
