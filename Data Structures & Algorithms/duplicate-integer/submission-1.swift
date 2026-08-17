class Solution {
    func hasDuplicate(_ nums: [Int]) -> Bool {
        return Set(nums).count != nums.count
    }
}
