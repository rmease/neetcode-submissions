class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        let uniqueNums = Set(nums)

        var maxSequenceLength = 0

        for num in uniqueNums {
            if isBeginningOfSequence(num, within: uniqueNums) {
                var currentNum = num
                var currentSequenceLength = 1

                while uniqueNums.contains(currentNum + 1) {
                    currentNum += 1
                    currentSequenceLength += 1
                }

                maxSequenceLength = max(maxSequenceLength, currentSequenceLength)
            }
        }

        return maxSequenceLength
    }

    func isBeginningOfSequence(_ num: Int, within nums: Set<Int>) -> Bool {
        return !nums.contains(num - 1)
    }
}
