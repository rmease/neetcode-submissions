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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        // if both trees are empty, they are the same tree
        if p == nil && q == nil {
            return true 
        }

        // if either tree is non-empty, they must both exist and have the same value
        guard let p, let q, p.val == q.val else {
            return false
        }

        // recursively scan the right to check for differences
        if let pRight = p.right {
            guard let qRight = q.right, pRight.val == qRight.val, isSameTree(pRight, qRight) else {
                return false
            }
        } else {
            guard q.right == nil else {
                return false
            }
        }

        // recursively scan the left to check for differences
        if let pLeft = p.left {
            guard let qLeft = q.left, pLeft.val == qLeft.val, isSameTree(pLeft, qLeft) else {
                return false
            }
        } else {
            guard q.left == nil else {
                return false
            }
        }

        // if no differences are found following the complete scan, the trees are the same
        return true
    }
}
