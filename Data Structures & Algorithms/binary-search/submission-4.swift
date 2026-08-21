class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        // set boundary of search scope to left and right ends of the array

        var leftIndex = 0
        var rightIndex = nums.count - 1
        var medianIndex = leftIndex + ((rightIndex - leftIndex) / 2)

        // until leftIndex and rightIndex collide, progressively divide the remaining array scope
        // if the number at the middle of the scope:
        // - == target, then return median index
        // - < target, then restrict scope to all numbers after median index (left = medianIndex + 1)
        // - > target, then restrict scope to all numbers before median index (right = medianIndex - 1)

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
