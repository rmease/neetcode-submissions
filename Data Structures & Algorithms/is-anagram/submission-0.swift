class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        return s.count == t.count && s.sorted() == t.sorted()
    }
}
