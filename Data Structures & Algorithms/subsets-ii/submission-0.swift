class Solution {
    private var result = [[Int]]()
    private var currentSubset = [Int]()

    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        // sort the input first so that we can detect duplicate starting values below
        // see the continue statement
        let numsSorted = nums.sorted()

        backtrack(numsSorted, 0)

        return result
    }

    private func backtrack(
        _ nums: [Int],
        _ start: Int
    ) {
        // append the current subset
        result.append(currentSubset)

        // iterate through the remain of the sorted input array
        // this will potentially build more subsets
        for i in start..<nums.count {
            // while this number is the same as the last number, skip
            // this prevents us from exploring identical subsets
            if i > start && (nums[i] == nums[i - 1]) {
                continue
            }

            // add the current value to the subset
            currentSubset.append(nums[i])

            // explore the rest of the array as a candidate for the subset
            backtrack(nums, i + 1)

            // after exploring, backtrack by removing this element
            currentSubset.removeLast()
        }
    }
}
