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
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let root else {
            return true
        }

        // within dfs, we use -1 to signal an imbalanced subtree
        return dfs(root) != -1
    }

    private func dfs(_ root: TreeNode?) -> Int {
        guard let root else {
            return 0
        }

        let rightDepth = dfs(root.right)
        if rightDepth == -1 {
            return -1 // found imbalance in right tree's children
        }

        let leftDepth = dfs(root.left)
        if leftDepth == -1 {
            return -1 // found imbalance in left tree's children
        }

        // rightDepth and leftDepth must be equal or vary only by 1
        guard abs(leftDepth - rightDepth) < 2 else {
            return -1
        }

        return 1 + max(leftDepth, rightDepth)
    }
}
