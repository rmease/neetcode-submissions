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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var result = ListNode(-Int.max)
        var currentResult = result

        var currentL1 = l1
        var currentL2 = l2
        var carry = 0

        // loop through both lists, summing the digits at each "place"
        // do not terminate the loop while carry is still available
        // this handles the scenario with a final carry (e.g. 55 + 55 = 110)
        while (currentL1 != nil || currentL2 != nil || carry > 0) {
            let currentL1Value = currentL1?.val ?? 0
            let currentL2Value = currentL2?.val ?? 0

            let sum = currentL1Value + currentL2Value + carry

            currentResult.next = ListNode(sum % 10)
            currentResult = currentResult.next!

            currentL1 = currentL1?.next
            currentL2 = currentL2?.next

            carry = sum / 10
        }

        return result.next
    }
}
