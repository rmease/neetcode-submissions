class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        for row in board {
            guard isValidSudokuZone(row) else {
                return false
            }
        }

        for column in 0..<9 {
            var zone = [Character]()

            for row in board {
                zone.append(row[column])
            }

            guard isValidSudokuZone(zone) else {
                return false
            }
        }

        for boxRow in stride(from: 0, to: 9, by: 3) {
            for boxColumn in stride(from: 0, to: 9, by: 3) {
                var zone = [Character]()

                for row in boxRow..<(boxRow + 3) {
                    for column in boxColumn..<(boxColumn + 3) {
                        zone.append(board[row][column])
                    }
                }

                guard isValidSudokuZone(zone) else {
                    return false
                }
            }
        }

        return true
    }

    func isValidSudokuZone(_ zone: [Character]) -> Bool {
        let numsInZone: [Int] = zone.compactMap { Int(String($0)) }

        return numsInZone.count == Set(numsInZone).count
    }
}
