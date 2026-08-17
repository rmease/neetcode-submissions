class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var productPrefixMap: [Int] = [nums[0]]
        var currentIndex = 1

        while currentIndex < nums.count {
            productPrefixMap.append(nums[currentIndex] * productPrefixMap[currentIndex - 1])
            currentIndex += 1
        }

        print("productPrefixMap:\(productPrefixMap)")
        
        // reverse input to build productSuffixMap left to right (easier to follower)
        let reversedNums = Array(nums.reversed())
        var productSuffixMap: [Int] = [reversedNums[0]]
        currentIndex = 1

        while currentIndex < reversedNums.count {
            productSuffixMap.append(reversedNums[currentIndex] * productSuffixMap[currentIndex - 1])
            currentIndex += 1
        }

        // reverse suffix map to build result left to right (easier to follow)
        productSuffixMap = Array(productSuffixMap.reversed())

        print("productSuffixMap:\(productSuffixMap)")

        return nums.enumerated().map { numsIndex, num in
            var result = num

            if numsIndex == 0 {
                return productSuffixMap[1]
            }
            if numsIndex == nums.count - 1 {
                return productPrefixMap[nums.count - 2]
            }

            return productPrefixMap[numsIndex - 1] * productSuffixMap[numsIndex + 1]
        }
    }
}
