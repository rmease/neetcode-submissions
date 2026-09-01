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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var nodesToProcess = [TreeNode]()
        var currentNode = root
        var remainingValuesToSolution = k

        while currentNode != nil || !nodesToProcess.isEmpty {
            // while left nodes are available, traserve leftward
            // this will always reveal the smallest possible BST node
            while let nodeToProcess = currentNode {
                nodesToProcess.append(nodeToProcess)
                currentNode = currentNode?.left
            }

            // remove the end of the stack first, the leftmost element
            // this is necessarily the smallest element
            let smallestNode = nodesToProcess.removeLast()
            remainingValuesToSolution -= 1

            // if our leftward search of this branch produces k results
            // we will have found the kth smallest result
            // if there are still remaining values to process
            // try the right node (of the leftmost branch) as root
            // if repeated, this will climb back up the tree
            if remainingValuesToSolution == 0 {
                return smallestNode.val
            } else {
                currentNode = smallestNode.right
            }
        }

        return -1 // specified default value
    }
}
