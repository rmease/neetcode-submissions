class Solution {
    private let emptyCharacter: Character = "."
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        let validRows = board.allSatisfy { self.isValidSudokuRow($0) }
        guard validRows else { return false }

        let transposedBoard = (0..<board[0].count).map { col in
            board.map { row in
                row[col]
            }
        }
        let validColumns = transposedBoard.allSatisfy { self.isValidSudokuRow($0) }
        guard validColumns else { return false }

        var validBoxes = true
        for r in stride(from: 0, to: 9, by: 3) {
            for c in stride(from: 0, to: 9, by: 3) {
                var box = [Character]()
                for i in 0..<3 {
                    for j in 0..<3 {
                        box.append(board[r + i][c + j])
                    }
                }
                if !self.isValidSudokuRow(box) {
                    validBoxes = false
                    break
                }
            }
        }

        return validBoxes
    }

    func isValidSudokuRow(_ row: [Character]) -> Bool {
        let numbers = row.filter { $0 != emptyCharacter }

        // if set discards any number, invalid duplicates are present
        return Set(numbers).count == numbers.count
    }
}