class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var left = 0
        var right = numbers.count - 1
        var currentSum = -1001

        while left < right {
            currentSum = numbers[left] + numbers[right]

            if currentSum == target {
                return [left + 1, right + 1]
            }

            if currentSum > target {
                right -= 1
            }

            if currentSum < target {
                left += 1
            }
        }

        return [-1]
    }
}
