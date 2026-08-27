class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var slowPointer = 0
        var fastPointer = 0

        for n in 0..<nums.count + 1 {
            slowPointer = nums[slowPointer]
            fastPointer = nums[nums[fastPointer]]

            if slowPointer == fastPointer {
                break
            }
        }

        var duplicatePointer = 0

        for n in 0..<nums.count + 1 {
            slowPointer = nums[slowPointer]
            duplicatePointer = nums[duplicatePointer]

            if slowPointer == duplicatePointer {
                return duplicatePointer
            }
        }

        return -1
    }
}
