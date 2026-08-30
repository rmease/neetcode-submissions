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
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root else {
            // if the root is not present, nothing to invert
            return nil
        }

        // first invert the left and right nodes (+, recursively, their children)
        let invertedLeft = invertTree(root.left)
        let invertedRight = invertTree(root.right)

        // then reattach the inverted children to the parent note
        root.left = invertedRight
        root.right = invertedLeft

        return root
    }
}
