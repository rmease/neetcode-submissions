class MinStack {
    // the internal stack, arranged such that each Element is a two-
    private var stack: [(val: Int, currentMin: Int)]

    init() {
        self.stack = [(val: Int, currentMin: Int)]()
    }

    func push(_ val: Int) {
        if let last = stack.last {
            self.stack.append((val: val, currentMin: min(val, last.currentMin)))
        } else {
            self.stack.append((val: val, currentMin: val))
        }
    }

    func pop() {
        let _ = stack.removeLast()
    }

    func top() -> Int {
        if let last = stack.last {
            return last.val
        } else {
            print("ERROR: unexpected call to top on empty stack")
            return Int(-2^31)
        }
    }

    func getMin() -> Int {
        if let last = stack.last {
            return last.currentMin
        } else {
            print("ERROR: unexpected call to getMin on empty stack")
            return Int(-2^31)
        }
    }
}
