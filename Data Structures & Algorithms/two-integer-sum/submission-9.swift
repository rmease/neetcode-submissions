class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var seenNumbersByIndex = [Int:Int]() // where key is the seen number, value is the index where it was seen

        for (index, num) in nums.enumerated() {
            let difference = target - num

            if let seenIndex = seenNumbersByIndex[difference] {
                return [seenIndex, index]
            }
            seenNumbersByIndex[num] = index
        }

        // per insutrctions, we should never hit this return
        return []
    }
}
