class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var left = 0
        var right = 1

        var maxProfit = 0

        guard prices.count > 1 else {
            return 0
        }

        while right < prices.count {
            let leftPrice = prices[left]
            let rightPrice = prices[right]

            if leftPrice >= rightPrice {
                left += 1
                if left == right {
                    right += 1
                }
            } else {
                let currentProfit = rightPrice - leftPrice
                maxProfit = max(maxProfit, currentProfit)
                right += 1
            }
        }

        return maxProfit
    }
}
