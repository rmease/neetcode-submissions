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
    func isValidBST(_ root: TreeNode?) -> Bool {
        return dfs(root, nil, nil)
    }

    private func dfs(_ node: TreeNode?, _ lowerBound: Int?, _ upperBound: Int?) -> Bool {
        // if the node is missing, the tree is valid
        guard let node else {
            return true
        }

        if let lowerBound, node.val <= lowerBound {
            return false
        }
        
        if let upperBound, node.val >= upperBound {
            return false
        }

        return dfs(node.left, lowerBound, node.val) && dfs(node.right, node.val, upperBound)
    }
}
