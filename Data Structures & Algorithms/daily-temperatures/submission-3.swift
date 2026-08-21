class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var result = Array(repeating: 0, count: temperatures.count)
        var stack = [(temp: Int, seenIndex: Int)]()

        for (currentIndex, temperature) in temperatures.enumerated() {
            while !stack.isEmpty && temperature > (stack.last)!.temp {
                let previousTemperature = stack.popLast()!

                let daysPassed = (currentIndex - previousTemperature.seenIndex)
                result[previousTemperature.seenIndex] = daysPassed
            }
            stack.append((temp: temperature, seenIndex: currentIndex))
        }

        return result
    }

    // O(n^2) solution, not fast enough for Neetcode requirement O(n)

    // func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
    //     var result = Array(repeating: 0, count: temperatures.count)

    //     for i in 0..<temperatures.count {
    //         for j in (i + 1)..<temperatures.count {
    //             if temperatures[j] > temperatures[i] {
    //                 result[i] = (j - i)
    //                 break
    //             }
    //         }
    //     }

    //     return result
    // }
}
