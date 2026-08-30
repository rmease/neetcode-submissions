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
    // recall that this is a scan of a binary search tree
    // a specific binary tree format where the left node is always less than the right node
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        // if either p or q is missing, we cannot determine an LCA
        guard let p, let q else {
            return nil
        }

        var currentNode = root

        while let node = currentNode {
            // if both values are less than the current node's value, search the left tree
            if p.val < node.val && q.val < node.val {
                currentNode = node.left
                continue
            }

            // if both values are greater than the current node's value, search the right tree
            if p.val > node.val && q.val > node.val {
                currentNode = node.right
                continue
            }

            // if we have a mix of comparison outcomes (one greater, one smaller), then we have found the LCA
            return node
        }

        // return nil if our scan fails to find a valid LCA
        return nil
    }
}
