class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        // we know that the maximium possible output value is the maximum value within h
        // that would guarantee that Koko eats on pile per hour

        // we will use a binary search approach to scan the range from 1 to the maximum value of piles
        // for each potential output value, we'll see how many hours it would take Koko to eat the bananas

        var leftRate = 1
        var rightRate = piles.max()!

        // in the worst case, the result will be equal to the maximum value of any pile in the array
        var minimumRate = rightRate 

        while leftRate <= rightRate {
            let medianRate = leftRate + (rightRate - leftRate) / 2
            var hoursConsumed = 0

            for pile in piles {
                // it will take pile / medianRate (rounded up) hours to consume the pile
                let hoursToConsumePile = (pile + medianRate - 1) / medianRate
                hoursConsumed += hoursToConsumePile
            }

            if hoursConsumed <= h {
                minimumRate = medianRate
                rightRate = medianRate - 1
            } else {
                leftRate = medianRate + 1
            }
        }

        return minimumRate
    }
}
