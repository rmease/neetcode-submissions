class Solution {
    func trap(_ height: [Int]) -> Int {
        guard height.count >= 3 else {
            return 0
        }

        var left = 0
        var right = height.count - 1

        var leftMax = height[left]
        var rightMax = height[right]

        var total = 0

        while left < right {
            if leftMax <= rightMax {
                left += 1
                leftMax = max(leftMax, height[left])
                total += leftMax - height[left]
            } else {
                right -= 1
                rightMax = max(rightMax, height[right])
                total += rightMax - height[right]
            }
        }

        return total
    }
}
