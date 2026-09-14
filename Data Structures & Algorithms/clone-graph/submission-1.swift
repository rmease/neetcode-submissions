class Solution {
    private var cloneMap = [Int: Node]()

    // TIME: O(vertices + edges), linear
    // SPACE: O(vertices), linear
    func cloneGraph(_ node: Node?) -> Node? {
        // unwrap optional input
        // rename to currentNode to capture it as point of focus
        guard let currentNode = node else {
            return nil
        }

        // return the clones that we have already cloned
        // as the DFS nature of this algorithm rolls up
        // the final clone returned will be the root node
        // from which the algorithm started
        if let clonedNode = cloneMap[currentNode.val] {
            return clonedNode
        }

        // clone the currentNode, store it in our visited cloneMap
        let currentClone = Node(currentNode.val)
        cloneMap[currentNode.val] = currentClone

        // DFS clone the currentNode's neighbors
        for neighbor in currentNode.neighbors {
            if let nextNeighbor = neighbor {
                currentClone.neighbors.append(cloneGraph(nextNeighbor))
            }
        }

        // map want to wipe the class variable at this point
        // cloneMap = [Int: Node]()

        // return the clone, similar to L16 above,
        // except that in this branch we're doing the DSF scan
        // for the first time
        return currentClone
    }
}
