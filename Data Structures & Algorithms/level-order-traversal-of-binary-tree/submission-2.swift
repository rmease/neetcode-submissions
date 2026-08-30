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
    private var nodeValueList = [[Int]]()

    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root else {
            return []
        }

        var result = [[Int]]()
        var nodesToProcess = [root]

        while !nodesToProcess.isEmpty {
            // level result grows as levelSize grows
            // as we move deeper into the tree, the nodesToProcess list grows and we append more values per level
            // level size will grow exponentially as each parent has up to two children
            var levelResult = [Int]()
            var levelSize = nodesToProcess.count

            for _ in 0..<levelSize {
                let currentNode = nodesToProcess.removeFirst()

                levelResult.append(currentNode.val)

                if let left = currentNode.left {
                    nodesToProcess.append(left)
                }
                if let right = currentNode.right {
                    nodesToProcess.append(right)
                }
            }

            result.append(levelResult)
        }

        return result
    }
}
