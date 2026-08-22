class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var rowLeft = 0
        var rowRight = matrix.count - 1
        var rowMedian = rowLeft + ((rowRight - rowLeft) / 2)

        print("rL: \(rowLeft), rR: \(rowRight), rM: \(rowMedian)")

        while rowLeft <= rowRight {
            print("searching medianrow: \(matrix[rowMedian])")
            guard let medianResult = searchRow(matrix[rowMedian], target) else {
                return false
            }

            print("medianResult: \(medianResult)")

            if medianResult == target {
                return true
            } else if medianResult > target {
                rowRight = rowMedian - 1
                rowMedian = rowLeft + ((rowRight - rowLeft) / 2)
                print ("\(rowRight), \(rowMedian)")
            } else if medianResult < target {
                rowLeft = rowMedian + 1
                rowMedian = rowLeft + ((rowRight - rowLeft) / 2)
            }
        }

        return false
    }

    private func searchRow(_ row: [Int], _ target: Int) -> Int? {
        if let first = row.first, first > target {
            print("returning first \(first)")
            return first
        }
        if let last = row.last, last < target {
            print("returning last \(last)")
            return last
        }

        var leftIndex = 0
        var rightIndex = row.count - 1
        var medianIndex = leftIndex + ((rightIndex - leftIndex) / 2)

        while leftIndex <= rightIndex {
            let medianElement = row[medianIndex]
            print("checking mE: \(medianElement)")

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

        return nil
    }
}
