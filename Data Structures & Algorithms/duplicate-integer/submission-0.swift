class Solution {
    func hasDuplicate(_ nums: [Int]) -> Bool {
        let setOfArrayValues = Set(nums)

        return setOfArrayValues.count != nums.count
    }
}
