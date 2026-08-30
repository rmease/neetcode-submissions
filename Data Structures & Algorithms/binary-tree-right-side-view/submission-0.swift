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
        var currentNodeIndex = 0 // ??

        while currentNodeIndex < nodesToProcess.count {
            let levelSize = nodesToProcess.count - currentNodeIndex

            for i in 0..<levelSize {
                let currentNode = nodesToProcess[currentNodeIndex]
                currentNodeIndex += 1

                if i == (levelSize - 1) {
                    result.append(currentNode.val)
                }

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
