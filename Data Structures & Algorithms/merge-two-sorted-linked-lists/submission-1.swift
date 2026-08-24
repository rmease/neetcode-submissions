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
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var headResult: ListNode? = nil

        guard list1 != nil else {
            return list2
        }
        guard list2 != nil else {
            return list1
        }

        let headPointer = ListNode(0) // dummy head, next will point to result head
        var resultTail = headPointer

        var currentList1Node = list1
        var currentList2Node = list2

        var currentResultNode: ListNode? = nil

        while currentList1Node != nil && currentList2Node != nil {
            if currentList1Node!.val < currentList2Node!.val {
                resultTail.next = currentList1Node
                currentList1Node = currentList1Node!.next
            } else {
                resultTail.next = currentList2Node
                currentList2Node = currentList2Node!.next
            }

            resultTail = resultTail.next!
        }

        // at most one linked list will have remaining nodes
        // because the inputs are sorted and we have proven these are all larger values
        // we can simply append it to the result
        resultTail.next = currentList1Node ?? currentList2Node

        return headPointer.next // return initialy added node as head
    }
}
