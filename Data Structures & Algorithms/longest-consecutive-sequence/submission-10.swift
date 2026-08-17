class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        let uniqueNums = Set(nums)

        var maxSequenceLength = 0

        // using a set of the input, we can scan the set for numbers that begin a sequence
        // from there, we can try building the longest possible sequence
        // this produces O(n) loops through the array, where O(n) is the number of sequences
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
