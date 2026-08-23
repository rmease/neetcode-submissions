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
                let hoursToConsumePile = (pile / medianRate + (pile % medianRate == 0 ? 0 : 1))
                hoursConsumed += hoursToConsumePile
            }

            
            if hoursConsumed <= h {
                // if the hours consumed is less than our target, we may be able to eat more slowly
                // update the upper bound of our range and search for a smaller minimumRate
                minimumRate = medianRate
                rightRate = medianRate - 1
            } else {
                // if the hours consumed is greater than our target, we must eat more quickly
                // update the lower bound of our range and search for a larger minimumRate
                leftRate = medianRate + 1
            }
        }

        return minimumRate
    }
}
