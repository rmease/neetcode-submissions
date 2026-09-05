class WordDictionary {
    private let wildcard: Character = "."
    private let root = WordDictionaryNode()

    // standard TrieNode add implementation
    // descend tree one letter at a time, adding new nodes as needed
    // mark final node as end of word
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

    // depth-first search the tree by characters
    // when search input includes a wildcard, advance search to all children of current node
    // return true only when end of search input aligns with some node where isEndOfWord = true
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