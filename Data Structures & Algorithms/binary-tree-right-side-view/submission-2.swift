/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     var val: Int
 *     var left: TreeNode?
 *     var right: TreeNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root else { return [] }

        // final result will be an array of the "right-visible" nodes' values
        var result = [Int]()
        var nodesToProcess = [root]
        var currentNodePointer = 0 // ??

        // while currentNodePointer is somwhere within nodesToProcess array
        while currentNodePointer < nodesToProcess.count {
            // levelSize is the number of nodes to process in this level
            // in other words, the remaining members of the nodesToProcess array
            // in other words, the nodes at + after currentNodeIndex
            let levelSize = nodesToProcess.count - currentNodePointer

            for i in 0..<levelSize {
                let currentNode = nodesToProcess[currentNodePointer]
                currentNodePointer += 1

                // if we are processing the last node (the right most, given our setup), add it to the result
                if i == (levelSize - 1) {
                    result.append(currentNode.val)
                }

                // add left, right nodes to the processing queue so we can later them or their "right-visible" subnodes
                if let left = currentNode.left {
                    nodesToProcess.append(left)
                }

                if let right = currentNode.right {
                    nodesToProcess.append(right)
                }
            }
        }

        return result
    }
}
