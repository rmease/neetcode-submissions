class TimeMap {
    private var internalStore: [String: [(value: String, timestamp: Int)]]

    init() {
        self.internalStore = [String: [(value: String, timestamp: Int)]]()
    }

    func set(_ key: String, _ value: String, _ timestamp: Int) {
        internalStore[key, default: []].append((value: value, timestamp: timestamp))
    }

    func get(_ key: String, _ timestamp: Int) -> String {
        return search((internalStore[key] ?? []), for: timestamp)
    }

    private func search(
        _ values: [(value: String, timestamp: Int)],
        for timestamp: Int
    ) -> String {
        var result = (value: "", timestamp: -1)

        guard !values.isEmpty else {
            return result.value
        }

        var leftIndex = 0
        var rightIndex = values.count - 1

        while leftIndex <= rightIndex {
            let medianIndex = leftIndex + ((rightIndex - leftIndex) / 2)
            let valueAtMedianIndex = values[medianIndex]

            if valueAtMedianIndex.timestamp == timestamp {
                result = valueAtMedianIndex
                break
            }

            if valueAtMedianIndex.timestamp <= timestamp {
                if valueAtMedianIndex.timestamp > result.timestamp {
                    result = valueAtMedianIndex
                }
                leftIndex = medianIndex + 1
            } else {
                rightIndex = medianIndex - 1
            }
        }

        return result.value
    }
}
