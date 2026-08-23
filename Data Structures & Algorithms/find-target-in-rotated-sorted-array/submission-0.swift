class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var leftIndex = 0
        var rightIndex = nums.count - 1

        while leftIndex <= rightIndex {
            let medianIndex = leftIndex + ((rightIndex - leftIndex) / 2)

            if nums[medianIndex] == target {
                return medianIndex
            }

            // if the leftIndex value is less than the medianIndex value
            // then we know that this is the sorted half of the array (no internal pivot)
            if nums[leftIndex] <= nums[medianIndex] {
                // check whether the target could plausible exist within this sorted range
                // if it is, move the search range to this sorted half by moving the rightIndex to just before the medianIndex
                // if it is not, move the search range to the other half of the array
                if target >= nums[leftIndex] && target < nums[medianIndex] {
                    rightIndex = medianIndex - 1
                } else {
                    leftIndex = medianIndex + 1
                }
            } else {
                // if the left half is not sorted, then the right half must be sorted
                // check whether the target could plausible exist within this sorted range
                // if it is, move the search range to this sorted half by moving the leftIndex to just after the medianIndex
                // if it is not, move the search range to the other half of the array
                if target > nums[medianIndex] && target <= nums[rightIndex] {
                    leftIndex = medianIndex + 1
                } else {
                    rightIndex = medianIndex - 1
                }
            }
        }

        // return -1 if we never found our target
        return -1
    }
}
