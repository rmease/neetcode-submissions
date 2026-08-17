class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var memberPositions: [Int: Int] = [:]
        memberPositions.reserveCapacity(nums.count) // pre-reserve memory, performance improvement

        var complement: Int // during iteration, complement = currentMember - target
        for (memberPosition, member) in nums.enumerated() {
            complement = target - member

            if let previousySeenComplementPosition = memberPositions[complement] {
                return [previousySeenComplementPosition, memberPosition]
            } else {
                memberPositions[member] = memberPosition
            }
        }

        print("ERROR: unexpectedy failed to find sum")
        return [-1, -1]
    }
}
