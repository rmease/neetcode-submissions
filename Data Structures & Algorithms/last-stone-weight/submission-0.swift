class Solution {
    func lastStoneWeight(_ stones: [Int]) -> Int {
        var maxHeap = [Int]()

        for stone in stones {
            insert(stone, into: &maxHeap)
        }

        while maxHeap.count > 1 {
            let largestStone = removeLargest(from: &maxHeap)
            let nextLargestStone = removeLargest(from: &maxHeap)

            if largestStone != nextLargestStone {
                insert(largestStone - nextLargestStone, into: &maxHeap)
            }
        }

        return maxHeap.first ?? 0
    }

    private func removeLargest(from heap: inout [Int]) -> Int {
        let maxValue = heap[0]
        let lastValue = heap.removeLast()

        // if there were more than one nodes in the heap
        // heap must be reordered following removal of maxValue
        if !heap.isEmpty {

            // overwrite maxValue with lastValue and rearrange heap
            heap[0] = lastValue
            reorganize(&heap)
        }

        return maxValue
    }

    private func insert(_ stone: Int, into maxHeap: inout [Int]) {
        maxHeap.append(stone)
        
        var index = maxHeap.count - 1

        while index > 0 {
            let parent = (index - 1) / 2

            if maxHeap[parent] >= maxHeap[index] {
                break
            }

            maxHeap.swapAt(parent, index)
            index = parent
        }
    }

    private func reorganize(_ heap: inout [Int]) {
        var index = 0
        var currentLargest = 0

        while true {
            // binary tree as an array
            // picture an array [0, 1, 2] == [root, right, left]
            // [... rightOfRight, leftOfRight, rightOfLeft, leftOfLeft]
            let nextLeft = 2 * index + 1
            let nextRight = 2 * index + 2

            if nextLeft < heap.count && heap[nextLeft] > heap[currentLargest] {
                currentLargest = nextLeft
            }
            if nextRight < heap.count && heap[nextRight] > heap[currentLargest] {
                currentLargest = nextRight
            }

            if currentLargest == index {
                break
            }

            heap.swapAt(index, currentLargest)
            index = currentLargest
        }
    }
}
