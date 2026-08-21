class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        // create operand stack
        var operands = [Int]()

        // move through tokens, adding integer tokens to the stack or computing the running total from the last two operands
        for token in tokens {
            switch token {
                case "+":
                    if let secondOperand = operands.popLast(), let firstOperand = operands.popLast() {
                        operands.append(firstOperand + secondOperand)
                    } else {
                        print("ERROR: invalid operands while computing + operation: \(operands)")
                        return -Int.max
                    }
                case "-":
                    if let secondOperand = operands.popLast(), let firstOperand = operands.popLast() {
                        operands.append(firstOperand - secondOperand)
                    } else {
                        print("ERROR: invalid operands while computing - operation: \(operands)")
                        return -Int.max
                    }
                case "*":
                    if let secondOperand = operands.popLast(), let firstOperand = operands.popLast() {
                        operands.append(firstOperand * secondOperand)
                    } else {
                        print("ERROR: invalid operands while computing * operation: \(operands)")
                        return -Int.max
                    }
                case "/":
                    if let secondOperand = operands.popLast(), let firstOperand = operands.popLast() {
                        operands.append(firstOperand / secondOperand)
                    } else {
                        print("ERROR: invalid operands while computing / operation: \(operands)")
                        return -Int.max
                    }
                default:
                    if let nextOperand = Int(token) {
                        operands.append(nextOperand)
                    } else {
                        print("ERROR: invalid token: \(token)")
                        return -Int.max
                    }
            }
        }

        // validate that operand stack has only one element before returning result
        if let finalResult = operands.popLast(), operands.count == 0 {
            return finalResult
        } else {
            print("ERROR: found invalid operands at end of evaluation: \(operands)")
            return -Int.max
        }
    }
}
