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
    func reverseList(_ head: ListNode?) -> ListNode? {
        // handle missing head scenario
        guard let head = head else {
            return nil
        }

        var previousNode: ListNode? = nil
        var currentNode: ListNode? = head

        while currentNode != nil {
            let nextNode = currentNode?.next

            // set currentNode pointer to prevousNode (for former head, sets to nil)
            currentNode?.next = previousNode

            // advance to next node shift
            previousNode = currentNode
            // this becomes nil when currentNode?.next returns nil (the tail)
            currentNode = nextNode
        }

        return previousNode // will be the tail-now-head when the while loop terminates
    }

    // O(n) space solution
    // func reverseList(_ head: ListNode?) -> ListNode? {
    //     guard let head = head else {
    //         return nil
    //     }

    //     var nodes = [ListNode]()
    //     var currentNode: ListNode = head

    //     while currentNode.next != nil {
    //         nodes.append(currentNode)
    //         if let nextNode = currentNode.next {
    //             currentNode = nextNode
    //         }
    //     }

    //     let result = currentNode // save the head pointer

    //     guard currentNode.next == nil else {
    //         print("ERROR currentNode is not the previous tail node: \(currentNode)")
    //         return nil
    //     }

    //     while !nodes.isEmpty {
    //         let nextNode = nodes.popLast()!

    //         currentNode.next = nextNode
    //         currentNode = nextNode
    //     }

    //     currentNode.next = nil // reset the former head node to avoid a loop

    //     return result // return former tail object
    // }
}
