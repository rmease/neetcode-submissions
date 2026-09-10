class Solution {
    private var maxAreaFound = 0

    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var mutableGridTracker = grid

        for row in 0..<grid.count {
            for col in 0..<grid[0].count {
                if mutableGridTracker[row][col] == 1 {
                    var initialSize = 0
                    computeIslandArea(row, col, &mutableGridTracker, &initialSize)
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

        // update maxAreaFound when currentSize overruns previous max value
        maxAreaFound = max(maxAreaFound, currentSize)
    }
}

// class Solution {
//     private var resultIslandCount = 0

//     func numIslands(_ grid: [[Character]]) -> Int {
//         var mutableGridTracker = grid

//         for row in 0..<grid.count {
//             for col in 0..<grid[0].count {
//                 // when we encounter some initial piece of island
//                 // increment our resultIslandCount
//                 // and claim the entirely island using our DFS approach
//                 if mutableGridTracker[row][col] == "1" {
//                     resultIslandCount += 1
//                     claimIsland(row, col, &mutableGridTracker)
//                 }
//             }
//         }

//         return resultIslandCount
//     }

//     func claimIsland(_ row: Int, _ col: Int, _ grid: inout [[Character]]) {
//         // early return when scanning out-of-bounds row
//         guard row >= 0, row < grid.count else {
//             return
//         }

//         // early return when scanning out-of-bounds col
//         guard col >= 0, col < grid[0].count else {
//             return
//         }

//         // early return when territory to claim is not an island
//         guard grid[row][col] == "1" else {
//             return
//         }

//         // by now, we have verified that our search has found another island
//         // set this island as claimed
//         grid[row][col] = "X"

//         // scan the surrounding territories to claim adjacent portions of the island
//         claimIsland(row - 1, col, &grid)
//         claimIsland(row + 1, col, &grid)
//         claimIsland(row, col - 1, &grid)
//         claimIsland(row, col + 1, &grid)
//     }
// }