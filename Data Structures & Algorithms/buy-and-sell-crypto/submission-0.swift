class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var lowestPrice = Int.max
        var bestProfit = 0

        for price in prices {
            lowestPrice = min(lowestPrice, price)
            bestProfit = max(bestProfit, price - lowestPrice)
        }

        return bestProfit
    }
}
