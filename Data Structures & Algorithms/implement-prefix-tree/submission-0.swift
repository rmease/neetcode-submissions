
class PrefixTreeNode {
    var children = [Character: PrefixTreeNode]()
    var isEndOfWord = false
}

class PrefixTree {
    private let root = PrefixTreeNode()

    func insert(_ word: String) {
        var currentNode = root

        // scan the tree and add nodes as values for the character-keyed children dictionary
        for character in word {
            if currentNode.children[character] == nil {
                currentNode.children[character] = PrefixTreeNode()
            }

            // set currentNode to the next character's node within the trie
            currentNode = currentNode.children[character]!
        }

        // after finished with traversal / adding nodes, mark the final node (currentNode) as the word boundary
        currentNode.isEndOfWord = true
    }

    func search(_ word: String) -> Bool {
        guard let finalNode = findNode(for: word) else {
            return false
        }

        // if we return a node, check that it is the end of the word
        return finalNode.isEndOfWord
    }

    func startsWith(_ prefix: String) -> Bool {
        return findNode(for: prefix) != nil
    }

    // returns nil if the word is not present within the tree's node structure
    // returns the final character node for the word, regardless of word boundary status within the trie
    private func findNode(for word: String) -> PrefixTreeNode? {
        var currentNode = root

        for character in word {
            guard let nextCharacterNode = currentNode.children[character] else {
                return nil
            }

            currentNode = nextCharacterNode
        }

        return currentNode
    }
}