class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var nextWarmerDays = [Int]()

        for (idx, temperature) in temperatures.enumerated() {
            if let nextWarmerDayIndex = temperatures[idx...].firstIndex(where: { $0 > temperature }) {
                nextWarmerDays.append(nextWarmerDayIndex - idx)
            } else {
                nextWarmerDays.append(0)
            }
        }

        return nextWarmerDays
    }
}
