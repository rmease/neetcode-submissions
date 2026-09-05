class WordDictionary {
    private let wildcard: Character = "."
    private let root = WordDictionaryNode()

    func addWord(_ word: String) {
        var currentNode = root

        for character in word {
            if currentNode.children[character] == nil {
                currentNode.children[character] = WordDictionaryNode()
            }

            currentNode = currentNode.children[character]!
        }

        currentNode.isEndOfWord = true
    }

    func search(_ word: String) -> Bool {
        return search(Array(word), index: 0, node: root)
    }

    private func search(_ characters: [Character], index: Int, node: WordDictionaryNode) -> Bool {
        if index == characters.count {
            return node.isEndOfWord
        }

        if index > characters.count {
            return false
        }

        let currentCharacter = characters[index]

        if currentCharacter == wildcard {
            return node.children.values.contains { search(characters, index: index + 1, node: $0) }
        } else {
            guard let nextNode = node.children[currentCharacter] else {
                return false
            }

            return search(characters, index: index + 1, node: nextNode)
        }
    }
}


class WordDictionaryNode {
    // a dictionary of available next-character nodes present within the tree
    // allows for O(n) searches where n is the size of the word
    var children = [Character: WordDictionaryNode]()
    var isEndOfWord = false
}

// class PrefixTree {
//     private let root = PrefixTreeNode()

//     // O(n) scales with the size of the inserted word
//     func insert(_ word: String) {
//         var currentNode = root

//         // scan the tree and add nodes as values for the character-keyed children dictionary
//         for character in word {
//             if currentNode.children[character] == nil {
//                 currentNode.children[character] = PrefixTreeNode()
//             }

//             // set currentNode to the next character's node within the trie
//             currentNode = currentNode.children[character]!
//         }

//         // after finished with traversal / adding nodes, mark the final node (currentNode) as the word boundary
//         currentNode.isEndOfWord = true
//     }

//     // O(n) scales with the length of the word
//     // search is indifferent to the density of the tree: each character check is an O(1) dictionary read
//     func search(_ word: String) -> Bool {
//         guard let finalNode = findNode(for: word) else {
//             return false
//         }

//         // if we return a node, check that it is the end of the word
//         return finalNode.isEndOfWord
//     }

//     func startsWith(_ prefix: String) -> Bool {
//         return findNode(for: prefix) != nil
//     }

//     // returns nil if the word is not present within the tree's node structure
//     // returns the final character node for the word, regardless of word boundary status within the trie
//     private func findNode(for word: String) -> PrefixTreeNode? {
//         var currentNode = root

//         for character in word {
//             guard let nextCharacterNode = currentNode.children[character] else {
//                 return nil
//             }

//             currentNode = nextCharacterNode
//         }

//         return currentNode
//     }
// }