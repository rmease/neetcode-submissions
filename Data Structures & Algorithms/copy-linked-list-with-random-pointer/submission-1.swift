/*
// Definition for a Node.
class Node {
    var val: Int
    var next: Node?
    var random: Node?
    init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}
*/

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        // handle empty list scenario

        guard let head else {
            return nil
        }

        // Pass 1:
        // build a dictionary relating the copied nodes to the new nodes
        // skip pointers for now because we can't set the random pointers effectively
        var copies = [ObjectIdentifier: Node]()
        var currentNode: Node? = head
        
        while let copiedNode = currentNode {
            copies[ObjectIdentifier(copiedNode)] = Node(copiedNode.val)
            currentNode = copiedNode.next
        }

        // Pass 2:
        // use the dictionary to set the next and random node references
        currentNode = head

        while let copiedNode = currentNode {
            let copy = copies[ObjectIdentifier(copiedNode)]!

            if let nextNode = copiedNode.next {
                copy.next = copies[ObjectIdentifier(nextNode)]
            }
            if let randomNode = copiedNode.random {
                copy.random = copies[ObjectIdentifier(randomNode)]
            }

            currentNode = copiedNode.next
        }

        return copies[ObjectIdentifier(head)]
    }
}
