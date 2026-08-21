class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        // set boundary of search scope to left and right ends of the array

        var leftIndex = 0
        var rightIndex = nums.count - 1

        // set initial target to the median of entire array

        var medianIndex = leftIndex + ((rightIndex - leftIndex) / 2)

        // until leftIndex and rightIndex collide, progressively divide the remaining scope

        // if the number at the middle of the scope...
        //      is == target: return median index
        //      is < target:  restrict scope to after median index (set leftIndex to medianIndex + 1)
        //      is > target:  restrict scope to before median index (set rightIndex to medianIndex - 1)
        // when restricitng the scope, reset the median to the middle of the new scope

        // this operates in O(logN) -- faster than O(n) -- because we progressively halve the scope

        while leftIndex <= rightIndex {
            let medianNum = nums[medianIndex]

            if medianNum == target {
                return medianIndex
            }
            if medianNum < target {
                leftIndex = medianIndex + 1
                medianIndex = leftIndex + ((rightIndex - leftIndex) / 2)
            }
            if medianNum > target {
                rightIndex = medianIndex - 1
                medianIndex = leftIndex + ((rightIndex - leftIndex) / 2)
            }
        }

        return -1
    }
}
