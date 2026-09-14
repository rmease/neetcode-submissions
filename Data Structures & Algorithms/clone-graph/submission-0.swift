class Solution {
    private var cloneMap = [Int: Node]()

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

        let currentClone = Node(currentNode.val)
        cloneMap[currentNode.val] = currentClone

        for neighbor in currentNode.neighbors {
            if let nextNeighbor = neighbor {
                currentClone.neighbors.append(cloneGraph(nextNeighbor))
            }
        }

        return currentClone
    }
}
