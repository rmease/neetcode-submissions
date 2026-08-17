class Solution {
    func hasDuplicate(_ nums: [Int]) -> Bool {
        var seenNums = Set<Int>()

        for num in nums {
            if seenNums.contains(num) {
                return true
            } else {
                seenNums.insert(num)
            }
        }

        return false
    }
}
