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
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        // handle edge scenario where both root and subRoot are empty trees
        guard let root else {
            return subRoot == nil
        }

        // if the current tree is identical to the subroot, it is a subtree
        if isSameTree(root, subRoot) {
            return true
        } else {
            // if not, we can try comparing it to the children of the current node
            return isSubtree(root.left, subRoot) || isSubtree(root.right, subRoot)
        }
    }

    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        // if both trees are empty, they are the same tree
        if p == nil && q == nil {
            return true 
        }

        // if either tree is non-empty, they must both exist and have the same value
        guard let p, let q, p.val == q.val else {
            return false
        }

        return isSameTree(p.left, q.left) && isSameTree(p.right, q.right)
    }
}
