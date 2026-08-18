class Solution {
    func trap(_ height: [Int]) -> Int {
        var totalTrapVolume = 0

        guard height.count > 2 else {
            return totalTrapVolume
        }

        var left = 0
        var right = height.count - 1


        var leftHeight = height[left]
        var rightHeight = height[right]

        while left < right {
            if leftHeight <= rightHeight {
                left += 1
                leftHeight = max(leftHeight, height[left])
                totalTrapVolume += (leftHeight - height[left])
            } else {
                right -= 1
                rightHeight = max(rightHeight, height[right])
                totalTrapVolume += rightHeight - height[right]
            }
        }

        return totalTrapVolume
    }
}
