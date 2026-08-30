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
    func goodNodes(_ root: TreeNode?) -> Int {
        guard let root else {
            return 0
        }

        return dfs(root, root.val)
    }

    private func dfs(_ node: TreeNode?, _ currentMax: Int) -> Int {
        guard let node else {
            return 0
        }

        let isGoodNode = node.val >= currentMax
        let newMax = max(currentMax, node.val)

        let leftCount = dfs(node.left, newMax)
        let rightCount = dfs(node.right, newMax)

        return (isGoodNode ? 1 : 0) + leftCount + rightCount
    }
}
