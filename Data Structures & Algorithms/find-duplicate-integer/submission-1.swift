class Solution {
    // this approach uses Floyd's cycle detection algorithm

    func findDuplicate(_ nums: [Int]) -> Int {
        var slowPointer = 0
        var fastPointer = 0

        // first, create a fast and slow pointer and cycle through the array
        // the slowPointer moves at a rate of 1
        // the fastPointer hops around to whichever index matches the value within nums

        for n in 0..<nums.count + 1 {
            slowPointer = nums[slowPointer]
            fastPointer = nums[nums[fastPointer]]

            if slowPointer == fastPointer {
                break
            }
        }

        // when the pointers align, we know we have entered the cycle
        // from here, create another slowPointer and advance both slow pointers by 1
        // when the two pointers have the same value, return the duplicate

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
