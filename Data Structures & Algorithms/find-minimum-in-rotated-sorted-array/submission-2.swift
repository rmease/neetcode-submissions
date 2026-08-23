class Solution {
    func findMin(_ nums: [Int]) -> Int {
        // default to maximum possible value, we'll update with real values below
        var result = 1000

        var leftIndex = 0
        var rightIndex = nums.count - 1

        while leftIndex <= rightIndex {
            // the entire remaining range is sorted
            // this means we have already found the minimum result, or it's the leftmost value of this range
            // we can early exit from this state
            if nums[leftIndex] < nums[rightIndex] {
                result = min(result, nums[leftIndex])
                break
            } else {
                let medianIndex = leftIndex + ((rightIndex - leftIndex) / 2)
                result = min(result, nums[medianIndex])

                // if leftIndex value is less than medianIndex value, but greater than rightIndex value (L13)
                // then we know that the minimum value is somewhere in the right side of the remaining range
                if nums[leftIndex] <= nums[medianIndex] {
                    // update leftIndex to just beyond the medianIndex
                    leftIndex = medianIndex + 1
                } else {
                    // otherwise, if the leftIndex value is greater than the medianIndex value
                    // then we know the "pivot" from the rotation is somwhere within the left side of the remaining range
                    // update rightIndex to just before the medianIndex
                    rightIndex = medianIndex - 1
                }
            }
        }

        return result
    }
}
