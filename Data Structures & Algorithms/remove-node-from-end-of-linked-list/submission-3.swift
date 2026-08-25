/**
 * Definition for singly-linked list.
 * class ListNode {
 *     var val: Int
 *     var next: ListNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        // if there is just one node, n must be 1 -> return nil
        // if there is no node, n must be 0 -> return nil
        guard head != nil && head?.next != nil else {
            return nil
        }


        // O(n) count the number of nodes in the list, set targetIndex for deletion
        var listCount = 0
        var currentCountNode = head

        while currentCountNode != nil {
            listCount += 1
            currentCountNode = currentCountNode?.next
        }

        let targetIndex = (listCount - n)

        // Handle easy scenaio where we're just removing the head
        if targetIndex == 0 {
            return head?.next
        }

        // O(n) scan the array until we find the node at the targetIndex
        // then fuse the previous node and next node togther
        // set the deleted node's next to nil
        var previousNode: ListNode? = nil
        var currentNode: ListNode? = head

        for index in 0..<listCount {
            if index == targetIndex {
                previousNode?.next = currentNode?.next
                currentNode?.next = nil
                break
            } else {
                previousNode = currentNode
                currentNode = currentNode?.next
            }
        }

        return head
    }
}
