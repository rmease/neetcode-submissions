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

        // current node is a good node if its value is an improvement over the known max of ancestors
        let isGoodNode = node.val >= currentMax
        let newMax = max(currentMax, node.val)

        // scan the left and right nodes for their goodNodeCount
        let leftCount = dfs(node.left, newMax)
        let rightCount = dfs(node.right, newMax)

        // combine result of left and right scans with currentNode status
        return (isGoodNode ? 1 : 0) + leftCount + rightCount
    }
}
