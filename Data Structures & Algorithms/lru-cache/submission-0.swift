class LRUCache {
    private let capacity: Int
    private var cache: [Int: LRUCacheNode] = [:]

    // these are dummy nodes
    private let lruBoundary = LRUCacheNode(0, 0) // least recently used
    private let mruBoundary = LRUCacheNode(0, 0) // most recently used

    init(_ capacity: Int) {
        self.capacity = capacity

        lruBoundary.next = mruBoundary
        mruBoundary.prev = lruBoundary
    }

    func get(_ key: Int) -> Int {
        guard let node = cache[key] else {
            return -1
        }

        // when we access the node, it becomes the MRU
        // therefore, remove it and immediately reattach it (to the far right)
        remove(node)
        insert(node)

        return node.value
    }

    func put(_ key: Int, _ value: Int) {
        // scenario 1: updating an existing node
        if let node = cache[key] {
            node.value = value

            // when we update its value, it becomes the MRU
            // therefore, remove it and immediately reattach it (to the far right)
            remove(node)
            insert(node)
            return
        }

        // scenario 2: inserting a new node

        // when we insert a new node, it becomes the MRU
        // therefore, insert it (to the far right)
        let node = LRUCacheNode(key, value)
        cache[key] = node
        insert(node)

        // evict LRU if the cache is over capacity.
        if cache.count > capacity {
            if let lru = lruBoundary.next, lru !== mruBoundary {
                remove(lru)
                cache[lru.key] = nil
            }
        }
    }

    // remove a node by attaching its left and right nodes to one another
    private func remove(_ node: LRUCacheNode) {
        let prev = node.prev
        let next = node.next

        prev?.next = next
        next?.prev = prev
    }

    // insert a node to the far right, where it is the MRU
    private func insert(_ node: LRUCacheNode) {
        let previousMRU = mruBoundary.prev

        previousMRU?.next = node
        node.prev = previousMRU

        node.next = mruBoundary
        mruBoundary.prev = node
    }

}

class LRUCacheNode {
    let key: Int
    var value: Int
    var prev: LRUCacheNode?
    var next: LRUCacheNode?

    init(_ key: Int, _ value: Int) {
        self.key = key
        self.value = value
    }
}