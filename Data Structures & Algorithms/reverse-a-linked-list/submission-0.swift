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
        guard let head = head else {
            return nil
        }
        
        var nodes = [ListNode]()
        var currentNode: ListNode = head

        while currentNode.next != nil {
            nodes.append(currentNode)
            if let nextNode = currentNode.next {
                currentNode = nextNode
            }
        }

        let result = currentNode // save the head pointer

        guard currentNode.next == nil else {
            print("ERROR currentNode is not the previous tail node: \(currentNode)")
            return nil
        }

        while !nodes.isEmpty {
            let nextNode = nodes.popLast()!

            currentNode.next = nextNode
            currentNode = nextNode
        }

        currentNode.next = nil // reset the former head node to avoid a loop

        return result // return former tail object
    }
}
