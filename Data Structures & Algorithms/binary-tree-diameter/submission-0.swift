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
    private var maxDiameter = 0

    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root else {
            return maxDiameter
        }

        let _ = dfs(root)
        return maxDiameter
    }

    private func dfs(_ root: TreeNode?) -> Int {
        guard let root else {
            return 0
        }

        let leftDepth = dfs(root.left)
        let rightDepth = dfs(root.right)

        maxDiameter = max(self.maxDiameter, (leftDepth + rightDepth))

        return 1 + max(leftDepth, rightDepth)
    }
}
