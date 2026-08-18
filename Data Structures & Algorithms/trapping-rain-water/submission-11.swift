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
        var addedVolume = 0

        while left < right {
            if leftHeight <= rightHeight {
                left += 1
                leftHeight = max(leftHeight, height[left])

                addedVolume = leftHeight - height[left]
                // print("adding volume: \(addedVolume) at left: \(left)")

                totalTrapVolume += addedVolume
            } else {
                right -= 1
                rightHeight = max(rightHeight, height[right])

                addedVolume = rightHeight - height[right]
                // print("adding volume: \(addedVolume) at right: \(right)")

                totalTrapVolume += addedVolume
            }
        }

        return totalTrapVolume
    }
}
