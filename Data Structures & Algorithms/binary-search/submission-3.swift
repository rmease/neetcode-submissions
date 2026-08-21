class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1

        while left <= right {
            let halfOfRemainingScope = (right - left) / 2
            let medianIndex = left + halfOfRemainingScope

            let medianNum = nums[medianIndex]

            if medianNum == target {
                return medianIndex
            }
            if medianNum < target {
                left = medianIndex + 1
            }
            if medianNum > target {
                right = medianIndex - 1
            }
        }

        return -1
    }
}
