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
    // allows us to capture the inorder position of the node
    private var inorderIndexByValue = [Int: Int]()

    // preorder visits root > left > right
    // so we can recurisvely build subtrees and the next value here is always the new root
    private var indexOfNextPreorderRootToProcesss = 0

    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        // build our lookup table, so that when preorder gives us a root
        // we can located the root within the inorder array
        for (index, value) in inorder.enumerated() {
            inorderIndexByValue[value] = index
        }

        // initially, the entire inorder array represents the tree
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
        // left...right is typically the full breadth of this subtree from inorder nodes
        guard left <= right else {
            return nil
        }

        // preorder tracks the index for the subtree root 
        let rootValue = preorder[indexOfNextPreorderRootToProcesss]
        indexOfNextPreorderRootToProcesss += 1

        let root = TreeNode(rootValue)
        let rootInorderIndex = inorderIndexByValue[rootValue]!

        // nodes in the range left...(rootInorderIndex -1) are the leftward nodes
        // IMPORTANT: build the left subtree first because preorder always visits left first
        root.left = buildSubtree(
            from: left,
            to: (rootInorderIndex - 1),
            using: preorder
        )

        // nodes in the range (rootInorderIndex)...right (initially end of array) are rightward nodes
        root.right = buildSubtree(
            from: (rootInorderIndex + 1),
            to: right,
            using: preorder
        )

        return root
    }
}
