class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()

        for token in tokens {
            if let number = Int(token) {
                stack.append(number)
                continue
            }

            let rightOperand = stack.removeLast()
            let leftOperand = stack.removeLast()

            let result: Int

            switch token {
            case "+":
                result = leftOperand + rightOperand
            case "-":
                result = leftOperand - rightOperand
            case "*":
                result = leftOperand * rightOperand
            case "/":
                result = leftOperand / rightOperand
            default:
                fatalError("Unexpected operator: \(token)")
            }

            stack.append(result)
        }

        return stack.removeLast()
    }
}
