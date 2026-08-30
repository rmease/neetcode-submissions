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
        return dfs(root, lowerBound: nil, upperBound: nil)
    }

    private func dfs(_ node: TreeNode?, lowerBound: Int?, upperBound: Int?) -> Bool {
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

        // check left subtree and ensure that all values are <= node.val (upperBound)
        let leftSubtreeIsVaild = dfs(node.left, lowerBound: lowerBound, upperBound: node.val)
        guard leftSubtreeIsVaild else { return false }

        // check right subtree and ensure that all values are >= node.val (lowerBound)
        let rightSubtreeIsValid = dfs(node.right, lowerBound: node.val, upperBound: upperBound)
        guard rightSubtreeIsValid else { return false }

        return true
    }
}
