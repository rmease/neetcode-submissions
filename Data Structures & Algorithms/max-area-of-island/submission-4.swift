class Solution {
    private var maxAreaFound = 0

    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var mutableGridTracker = grid

        for row in 0..<grid.count {
            for col in 0..<grid[0].count {
                if mutableGridTracker[row][col] == 1 {
                    var currentSize = 0
                    computeIslandArea(row, col, &mutableGridTracker, &currentSize)
                    maxAreaFound = max(maxAreaFound, currentSize)
                }
            }
        }

        return maxAreaFound
    }

    func computeIslandArea(
        _ row: Int,
        _ col: Int,
        _ grid: inout [[Int]],
        _ currentSize: inout Int
    ) {
        // early return when scanning out-of-bounds row
        guard row >= 0, row < grid.count else {
            return
        }

        // early return when scanning out-of-bounds col
        guard col >= 0, col < grid[0].count else {
            return
        }

        // early return when territory to claim is not an island
        guard grid[row][col] == 1 else {
            return
        }

        // expland the currentSize to include this island
        currentSize += 1

        // set current grid item to -1 so that we do not reuse paths
        grid[row][col] = -1

        // scan all adjacent territories for additional islands
        computeIslandArea(row, col + 1, &grid, &currentSize)
        computeIslandArea(row, col - 1, &grid, &currentSize)
        computeIslandArea(row + 1, col, &grid, &currentSize)
        computeIslandArea(row - 1, col, &grid, &currentSize)
    }
}