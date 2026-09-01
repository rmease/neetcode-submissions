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
    private var inorderIndexByValue = [Int: Int]()
    private var indexOfNextPreorderRootToProcesss = 0

    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        for (index, value) in inorder.enumerated() {
            inorderIndexByValue[value] = index
        }

        return buildSubtree(
            from: 0,
            to: inorder.count - 1,
            using: preorder
        )
    }

    private func buildSubtree(
        from left: Int,
        to right: Int,
        using preorder: [Int]
    ) -> TreeNode? {
        // there are no inorder values that belong to this subtree
        guard left <= right else {
            return nil
        }

        // preorder track the index for the subtree root 
        let rootValue = preorder[indexOfNextPreorderRootToProcesss]
        indexOfNextPreorderRootToProcesss += 1

        let root = TreeNode(rootValue)
        let rootInorderIndex = inorderIndexByValue[rootValue]!

        root.left = buildSubtree(
            from: left,
            to: (rootInorderIndex - 1),
            using: preorder
        )
        root.right = buildSubtree(
            from: (rootInorderIndex + 1),
            to: right,
            using: preorder
        )

        return root
    }
}
