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

// an O(n) approach to this would send us O(n) through the linked list
// we'd create a set of seenListNodes and store each node in the set
// we would early exit with false if we re-encounter a node in our set
// we would return false at the end if we encounter the null next pointer

// an O(n) approach with just O(1) storage (the above is O(n) runtime and storage)
// is to use the tortoise and the hair algorithm
// set two pointers: one moves a n, the othere moves at 2n
// in this scenario, if a cycle exists in the linked list, the pointers will coincide
// return true when the pointers coincide
// return false when one of the pointers encounters the null next pointer

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var hare = head // node cycle at rate 2n
        var tortoise = head // node cycle at rate n
    
        while hare != nil && hare?.next != nil {
            hare = hare?.next?.next // advance 2 nodes
            tortoise = tortoise?.next // advance 1 node

            // cycle detected if the nodes coincide
            if hare === tortoise {
                return true
            }
        }

        return false
    }
}
