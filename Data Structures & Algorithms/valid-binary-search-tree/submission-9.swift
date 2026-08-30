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
        return dfs(root, lowerBound: -Int.max, upperBound: Int.max)
    }

    private func dfs(_ node: TreeNode?, lowerBound: Int, upperBound: Int) -> Bool {
        // if the node is missing, the tree is valid
        guard let currentNode = node else {
            return true
        }

        // currentNode.val must be less than the lowerBound (no leftward children with a larger value)
        if currentNode.val <= lowerBound {
            return false
        }
        
        // currentNode.val must be greater than the upperBound (no rightward children with a smaller value)
        if currentNode.val >= upperBound {
            return false
        }

        // right and left subtrees must both be valid

        // check left subtree and ensure that all values are <= node.val (upperBound)
        let leftSubtreeIsVaild = dfs(currentNode.left, lowerBound: lowerBound, upperBound: currentNode.val)
        guard leftSubtreeIsVaild else { return false }

        // check right subtree and ensure that all values are >= node.val (lowerBound)
        let rightSubtreeIsValid = dfs(currentNode.right, lowerBound: currentNode.val, upperBound: upperBound)
        guard rightSubtreeIsValid else { return false }

        return true
    }
}
