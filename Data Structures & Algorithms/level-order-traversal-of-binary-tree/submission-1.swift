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
