class Solution {
    // because our inputs are given in a sorted increasing order, this calls for binary search
    // we can think of this as a 2D binary search problem
    // -- first, we use a binary search approach to finding the correct row (row.first <= target && row.last >= target)
    // -- next, we scan the correct row to see whether it contains the element

    // this solution is O(logM * logN), where M is the number of matrix rows and N is the number of elements within each row

    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var rowLeft = 0
        var rowRight = matrix.count - 1
        var rowMedian = rowLeft + ((rowRight - rowLeft) / 2)

        while rowLeft <= rowRight {
            guard let medianResult = searchRow(matrix[rowMedian], target) else {
                return false
            }

            if medianResult == target {
                return true
            } else if medianResult > target {
                rowRight = rowMedian - 1
                rowMedian = rowLeft + ((rowRight - rowLeft) / 2)
            } else if medianResult < target {
                rowLeft = rowMedian + 1
                rowMedian = rowLeft + ((rowRight - rowLeft) / 2)
            }
        }

        return false
    }

    private func searchRow(_ row: [Int], _ target: Int) -> Int? {
        // early exit if the first or last elements of the row indicate that it is not a match
        
        // if the first element is greater than the target, we need to find an earlier row in the matrix
        if let first = row.first, first > target {
            return first
        }
        // if the last element is less than the target, we need to find a later row in the matrix
        if let last = row.last, last < target {
            return last
        }

        var leftIndex = 0
        var rightIndex = row.count - 1
        var medianIndex = leftIndex + ((rightIndex - leftIndex) / 2)

        while leftIndex <= rightIndex {
            let medianElement = row[medianIndex]

            if medianElement == target {
                return medianElement
            }
            if medianElement > target {
                rightIndex = medianIndex - 1
                medianIndex = leftIndex + ((rightIndex - leftIndex) / 2)
            }
            if medianElement < target {
                leftIndex = medianIndex + 1
                medianIndex = leftIndex + ((rightIndex - leftIndex) / 2)
            }
        }

        // nil here signals that we expected to find the target within this row, but we did not
        // we can use this as a signal to our -> Bool function above that it can early exit with false
        // becaues the only row that could have contained the element does not
        return nil
    }
}
