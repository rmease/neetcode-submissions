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
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root else {
            return 0
        }

        // scan the left and right recursively to find the maximum depth of each
        let leftDepth = maxDepth(root.left)
        let rightDepth = maxDepth(root.right)

        // the max depth at each layer of the tree is 1 + the max depth of whichever child node goes deeper
        return 1 + max(leftDepth, rightDepth)
    }
}
