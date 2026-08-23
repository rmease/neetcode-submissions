class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var result = nums.first! // arbitarily set minimum to first array element, we will udpate below as we go

        var leftIndex = 0
        var rightIndex = nums.count - 1

        while leftIndex <= rightIndex {
            // if we encounter a scenario where the left value is less than the right value
            // then we are already within a range where the 
            if nums[leftIndex] < nums[rightIndex] {
                result = min(result, nums[leftIndex])
                break
            } else {
                let medianIndex = leftIndex + ((rightIndex - leftIndex) / 2)
                result = min(result, nums[medianIndex])

                if nums[medianIndex] >= nums[leftIndex] {
                    leftIndex = medianIndex + 1
                } else {
                    rightIndex = medianIndex - 1
                }
            }
        }

        return result
    }
}
