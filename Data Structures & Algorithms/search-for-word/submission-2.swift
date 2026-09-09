class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var board = board
        let word = Array(word)

        for row in 0..<board.count {
            for col in 0..<board[0].count {
                if found(word, in:&board, row, col, 0) {
                    return true
                }
            }
        }

        return false
    }

    private func found(
        _ word: [Character],
        in board: inout [[Character]],
        _ row: Int,
        _ col: Int,
        _ index: Int
    ) -> Bool {
        if index == word.count {
            return true
        }

        // if scan overflows row, return false
        if row < 0 || row >= board.count {
            return false
        }
        // if scan overflow col, return false
        if col < 0 || col >= board[0].count {
            return false
        }
        // if scan at row/col does not match next character in word, return false
        if board[row][col] != word[index] {
            return false
        }

        let originalCharacter = board[row][col]
        board[row][col] = "#" // unset board at row/col to prevent reusing character

        // search for word recursively in every 
        // note that in practice we only search in 3 directions
        // because at least one direction will early return due to #
        let foundWord =
            found(word, in:&board, row + 1, col, index + 1) ||
            found(word, in:&board, row - 1, col, index + 1) ||
            found(word, in:&board, row, col + 1, index + 1) ||
            found(word, in:&board, row, col - 1, index + 1)

        // reset board at row/col after recursive scan completed
        board[row][col] = originalCharacter 
        
        return foundWord
    }
}
