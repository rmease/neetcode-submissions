class TimeMap {
    // create a store that houses values tagged by their insertion timestamp
    private var internalStore: [String: [(value: String, timestamp: Int)]]

    init() {
        self.internalStore = [String: [(value: String, timestamp: Int)]]()
    }

    func set(_ key: String, _ value: String, _ timestamp: Int) {
        // append the value to key's value array
        // this works at O(1) becaues the problem design guarantees increasing insertion
        internalStore[key, default: []].append((value: value, timestamp: timestamp))
    }

    func get(_ key: String, _ timestamp: Int) -> String {
        // search the value array at the key, using O(logn) binary scan below
        return search((internalStore[key] ?? []), for: timestamp)
    }

    private func search(
        _ values: [(value: String, timestamp: Int)],
        for timestamp: Int
    ) -> String {
        // set the default value to the problem design's desired default ""
        // set the default timestamp to -1, such that any valid value will supplant it
        var result = (value: "", timestamp: -1)

        // if the value array does not exist, return the default value
        guard !values.isEmpty else {
            return result.value
        }

        var leftIndex = 0
        var rightIndex = values.count - 1

        // use binary search to scan the timestamps in the array of values
        // these are already sorted by increasing order, see not on get()
        while leftIndex <= rightIndex {
            let medianIndex = leftIndex + ((rightIndex - leftIndex) / 2)
            let valueAtMedianIndex = values[medianIndex]

            // if the timestamp exactly matches the queried timestamp, return the value
            if valueAtMedianIndex.timestamp == timestamp {
                result = valueAtMedianIndex
                break
            }

            if valueAtMedianIndex.timestamp < timestamp {
                // if the timestamp at the medianIndex is less than the queried timestamp
                // update the result if the timestamp is closer to the queried timestamp
                // then update LeftIndex to search for a possibly larger value
                // we want the largest possible timestamp value that is still < timestamp
                if valueAtMedianIndex.timestamp > result.timestamp {
                    result = valueAtMedianIndex
                }
                leftIndex = medianIndex + 1
            } else {
                // if the timestamp at the medianIndex is greater than the queried timestamp
                // we know we're checkign invalid timestamps
                // update the right index to consider values with smaller timestamps
                rightIndex = medianIndex - 1
            }
        }

        return result.value
    }
}
