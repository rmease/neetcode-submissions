class Solution {
    private let directions = [
        (-1, 0),
        (1, 0),
        (0, -1),
        (0, 1)
    ]

    func islandsAndTreasure(_ grid: inout [[Int]]) {
        // set row/col boundaries for more readable BFS scanning
        let rowBoundary = grid.count
        let colBoundary = grid[0].count

        // prepare queue for levelled expansion of BFS scanning
        // use Coordinate abstraction to spare us the x/y litter
        var queue = [(Int, Int)]()

        // fill our queue with known treasure locations
        // these will be our starting points for BFS scan
        for row in 0..<rowBoundary {
            for col in 0..<colBoundary {
                if grid[row][col] == 0  { // treasure
                    queue.append((row, col))
                }
            }
        }

        var index = 0

        while index < queue.count {
            let (currentRow, currentCol) = queue[index]
            index += 1

            for (directionRow, directionCol) in directions {
                let newRow = currentRow + directionRow
                let newCol = currentCol + directionCol

                guard newRow >= 0 && newRow < rowBoundary else {
                    // out of bounds, early return
                    continue
                }
                guard newCol >= 0 && newCol < colBoundary else {
                    // out of bounds, early return
                    continue
                }

                // encountered impassable water, early return
                guard grid[newRow][newCol] == 2147483647 else { // land
                    continue
                }

                grid[newRow][newCol] = grid[currentRow][currentCol] + 1
                queue.append((newRow, newCol))
            }
        }

    }



}
