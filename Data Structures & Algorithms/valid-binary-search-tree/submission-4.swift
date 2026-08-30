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

        // right and left subtrees must both be valid

        // left subtree is valid if for all nodes in node.left, their leftSubtrees are valid
        let leftSubtreeIsVaild = dfs(node.left, lowerBound, node.val)
        guard leftSubtreeIsVaild else { return false }

        // right subtree is valid if for all nodes in node.right, their rightSubtrees are valid
        let rightSubtreeIsValid = dfs(node.right, node.val, upperBound)
        guard rightSubtreeIsValid else { return false }

        return true
    }
}
