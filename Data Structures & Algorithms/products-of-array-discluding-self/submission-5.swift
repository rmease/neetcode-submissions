class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var result = Array(repeating: 1, count: nums.count)

        var leftProduct = 1

        for i in 0..<nums.count {
            result[i] = leftProduct
            leftProduct *= nums[i]
        }

        var rightProduct = 1

        for i in (0..<nums.count).reversed() {
            result[i] *= rightProduct
            rightProduct *= nums[i]
        }

        return result
    }
}
