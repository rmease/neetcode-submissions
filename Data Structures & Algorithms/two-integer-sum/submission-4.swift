class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var memberPositions: [Int: Int] = [:]
        memberPositions.reserveCapacity(nums.count) // pre-reserve memory, performance improvement

        var complement: Int // during iteration, complement = target - member
        for (memberPosition, member) in nums.enumerated() {
            complement = target - member

            if let complementPosition = memberPositions[complement] {
                return [complementPosition, memberPosition]
            } else {
                memberPositions[member] = memberPosition
            }
        }

        print("ERROR: unexpectedy failed to find sum")
        return [-1, -1]
    }
}
