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

// aim for a solution with O(n) time and O(1) space, where n is the length of the list

// initially, I am only seeing an O(n) time and O(n) space solution
// in this scenario, we'd create an array [ListNode], the list in its original order
// then, we'd reassuble a new linked list that intertwine them as required
// pulling some from the front, some from the back of the array

// review case study material, the ideal solution is O(n) time with O(1) space
// it moves through three phases:
//      - find the middle of the list
//      - reverse the second half of the list
//      - construct a new list interleaving the two halves

class Solution {
    func reorderList(_ head: ListNode?) {
        // handle empty list and single-node scenarios
        guard head != nil && head?.next != nil else {
            return
        }

        // use the fast/slow pointer approach to identify the middle
        var fast: ListNode? = head
        var slow: ListNode? = head

        // proceed as long as fast can continue to advance (2n)
        while fast?.next != nil && fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }

        // the slow pointer now captures the middle of the array
        // because as fast moved to the end of the array at 2n
        // slow moved to the middle of the array at n

        var secondHalf = slow?.next
        slow?.next = nil // terminates the first half of the list

        var previous: ListNode? = nil
        var current = secondHalf

        // reverse the secondHalf of the original list
        while current != nil {
            // grab next ListNode from existing secondHalf
            let next = current?.next

            // set that to the previous node in our reconstruction
            current?.next = previous

            // previous node is now our current node
            previous = current

            // current noe is now the next ListNode from the existing secondHalf
            current = next
        }

        secondHalf = previous // set secondHalf to inverted secondHalf

        var firstHalf: ListNode? = head

        // merge the two lists behind firstHalf one at a time
        // advnacing through each list as you go
        while secondHalf != nil {
            // grab a reference to the next two nodes
            let firstHalfNext = firstHalf?.next
            let secondHalfNext = secondHalf?.next

            // set first half next to the current start of secondHalf
            firstHalf?.next = secondHalf
            // set next of the current start of secondHalf of the next node of firstHalf
            secondHalf?.next = firstHalfNext

            // advance firstHalf to firstHalfNext
            firstHalf = firstHalfNext
            // advance secondHalf to secondHalfNext
            secondHalf = secondHalfNext
        }

        // because we have modified the list behind the input "head"
        // "head" is now in the correct state and we can return
        return
    }
}
