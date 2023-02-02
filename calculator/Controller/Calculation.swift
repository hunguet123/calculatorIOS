//
//  Calculation.swift
//  calculator
//
//  Created by Hà Quang Hưng on 02/02/2023.
//

import Foundation
enum CalculationErro: Error {
    case errorOperator
}

class Calculation {
    private var inputList : [String] = []
    private var error: Error?
    
    func result(textInput: String)-> String {
        self.reset()
        digitsOperator(textInput: textInput)
        do {
            return try evaluatePostfix()
        } catch let e {
            self.error = e
        }
        return ""
    }
    
    func isError()-> Bool {
        if error != nil {
            return true
        }
        return false
    }
    
    private func digitsOperator(textInput: String) {
        var currentDigit = ""
        for character in textInput {
            if (character.isNumber || character == ".") {
                currentDigit.append(character)
            } else if !currentDigit.isEmpty {
                inputList.append(currentDigit)
                inputList.append(String(character))
                currentDigit = ""
            }
        }
        if (currentDigit != "") {
            inputList.append(currentDigit)
        }
    }
    
    private func reset() {
        inputList = []
        error = nil
    }
    
    private func getPriority(_operator: String)-> Int {
        
        if _operator == "+" || _operator == "-" {
            return 0
        } else if _operator == "x" || _operator == "/" {
            return 1
        }
        return -1
    }
    
    private func convertInfixToPostfix()-> [String] {
        var postFix: [String] = []
        var stack = Stack()
        for element in inputList {
            if Float(element) != nil {
                postFix.append(element)
            } else {
                while !stack.isEmpty() && getPriority(_operator: element) <= getPriority(_operator: stack.peek()!) {
                    postFix.append(stack.pop()!)
                }
                stack.push(element)
                if stack.count() == 1 {
                    continue
                }
            }
        }
        while !stack.isEmpty() {
            postFix.append(stack.pop()!)
        }
        return postFix
    }
    
    private func evaluatePostfix() throws -> String {
        let postFix = convertInfixToPostfix()
        var stack = Stack()
        for element in postFix {
            if Float(element) != nil {
                stack.push(element)
            } else {
                if stack.peek() == nil {
                    throw CalculationErro.errorOperator
                }
                let x = Float(stack.pop()!)!
                if stack.peek() == nil {
                    throw CalculationErro.errorOperator
                }
                var y = Float(stack.pop()!)!
                switch element {
                case "+":
                    y += x
                case "-":
                    y -= x
                case "x":
                    y *= x
                default:
                    y /= x
                }
                stack.push(String(y))
            }
        }
        return stack.pop()!
    }
}
