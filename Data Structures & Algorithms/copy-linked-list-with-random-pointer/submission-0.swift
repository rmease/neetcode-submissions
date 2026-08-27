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
        guard let head else {
            return nil
        }
        
        var copies = [ObjectIdentifier: Node]()

        var currentNode: Node? = head
        while let copiedNode = currentNode {
            copies[ObjectIdentifier(copiedNode)] = Node(copiedNode.val)
            currentNode = copiedNode.next
        }

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
