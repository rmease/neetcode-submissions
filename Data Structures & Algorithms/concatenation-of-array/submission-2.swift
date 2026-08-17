class Solution {
    func getConcatenation(_ nums: [Int]) -> [Int] {
        var result = [Int]()
        result.reserveCapacity(nums.count * 2)

        result.append(contentsOf: nums)
        result.append(contentsOf: nums)

        return result
    }
}
