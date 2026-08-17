class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        let allNumbers = Set(nums)
        guard let minNumber = allNumbers.min() else { return 0 }
        guard let maxNumber = allNumbers.max() else { return 0 }

        var currentConsecutiveCount: Int = 1
        var maxConsecutiveCount: Int = 1
        for number in minNumber...maxNumber {
            if allNumbers.contains(number + 1) {
                currentConsecutiveCount += 1
            } else {
                maxConsecutiveCount = max(
                    currentConsecutiveCount,
                    maxConsecutiveCount
                )
                currentConsecutiveCount = 0
            }
        }

        return  max(currentConsecutiveCount, maxConsecutiveCount)
    }
}
