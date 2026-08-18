class Solution {
    func maxArea(_ heights: [Int]) -> Int {
        var left = 0
        var right = heights.count - 1

        var maxWaterVolume = 0

        while left < right {
            let leftHeight = heights[left]
            let rightHeight = heights[right]
            let currentWaterVolume =  (right - left) * min(leftHeight, rightHeight)

            // print("leftHeight: \(leftHeight), rightHeight: \(rightHeight), vol: \(currentWaterVolume)")

            maxWaterVolume = max(maxWaterVolume, currentWaterVolume)

            if leftHeight < rightHeight {
                // print("increment left")
                left += 1
            } else {
                // print("increment right")
                right -= 1
            }
        }

        return maxWaterVolume
    }
}
