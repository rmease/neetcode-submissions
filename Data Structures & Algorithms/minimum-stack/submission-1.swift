class MinStack {
    private var stack: [(value: Int, lastKnownMinimum: Int)]

    init() {
        self.stack = [(value: Int, lastKnownMinimum: Int)]()
    }

    func push(_ val: Int) {
        if self.stack.count > 0 {
            self.stack.append((value: val, lastKnownMinimum: min(val, self.getMin())))       
        } else {
            self.stack.append((value: val, lastKnownMinimum: val))
        }
    }

    func pop() {
        let _ = self.stack.popLast()
    }

    func top() -> Int {
        if let top = self.stack.last {
            return top.value
        } else {
            print("ERROR: unable to get top from empty array: \(self.stack)")
            return -1
        }
    }

    func getMin() -> Int {
        if let top = self.stack.last {
            return top.lastKnownMinimum
        } else {
            print("ERROR: unable to get min from empty array: \(self.stack)")
            return -1
        }
    }
}
