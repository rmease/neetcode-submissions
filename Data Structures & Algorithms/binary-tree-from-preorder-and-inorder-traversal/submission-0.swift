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
    private var inorderValueToIndexMap = [Int: Int]()
    private var preorderIndex = 0

    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        for (index, value) in inorder.enumerated() {
            inorderValueToIndexMap[value] = index
        }

        return buildWithNodes(
            left: 0,
            right: inorder.count - 1,
            from: preorder
        )

    }

    private func buildWithNodes(
        left: Int,
        right: Int,
        from preorder: [Int]
    ) -> TreeNode? {
        guard left <= right else {
            return nil
        }

        let rootValue = preorder[preorderIndex]
        preorderIndex += 1

        let root = TreeNode(rootValue)

        let inorderIndex = inorderValueToIndexMap[rootValue]!

        root.left = buildWithNodes(
            left: left,
            right: inorderIndex - 1,
            from: preorder
        )
        root.right = buildWithNodes(
            left: inorderIndex + 1,
            right: right,
            from: preorder
        )

        return root
    }
}
