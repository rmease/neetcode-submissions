class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        for i in 1...numbers.count {
            for j in (i + 1)...numbers.count {
                if (numbers[i - 1] + numbers[j - 1]) == target {
                    return [i, j]
                }
            }
        }

        return [0]
    }
}
