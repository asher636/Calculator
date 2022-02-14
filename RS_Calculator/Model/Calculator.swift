//
//  Calculator.swift
//  RS_Calculator
//
//  Created by Asher Ahsan on 13.02.22.
//

import Foundation

protocol CalculatorOps {
    mutating func add(op1: Float, op2: Float)
    mutating func subtract(op1: Float, op2: Float)
    mutating func multiply(op1: Float, op2: Float)
    mutating func divide(op1: Float, op2: Float)
    mutating func sqroot(op1: Float)
}

enum Operation: String {
    case add = "+"
    case subtract = "-"
    case multiply = "x"
    case divide = "/"
    case sqroot = "√"
    case null = "null"
}

struct Calculator: CalculatorOps {
    private(set) var operation: Operation?
    private(set) var operand1: Float?
    private(set) var operand2: Float?
    private(set) var result: Float?
    
    mutating func setOperation(op: String) {
        switch op {
        case "+":
            operation = Operation.add
        case "-":
            operation = Operation.subtract
        case "x":
            operation = Operation.multiply
        case "/":
            operation = Operation.divide
        case "√":
            operation = Operation.sqroot
        default:
            operation = Operation.null
        }
    }
    
    mutating func setOperand(operand: String, isSecondOperand: Bool) {
        if !isSecondOperand {
            if let operand = Float(operand) {
                operand1 = operand
                if operation == .sqroot {
                    performOperation()
                }
            }
        } else {
            if let operand = Float(operand) {
                operand2 = operand
                performOperation()
            }
        }
    }
    
    mutating func performOperation() {
        switch operation {
        case .add:
            if let operand1 = operand1, let operand2 = operand2 {
                self.add(op1: operand1, op2: operand2)
            }
        case .subtract:
            if let operand1 = operand1, let operand2 = operand2 {
                self.subtract(op1: operand1, op2: operand2)
            }
        case .multiply:
            if let operand1 = operand1, let operand2 = operand2 {
                self.multiply(op1: operand1, op2: operand2)
            }
        case .divide:
            if let operand1 = operand1, let operand2 = operand2 {
                self.divide(op1: operand1, op2: operand2)
            }
        case .sqroot:
            if let operand1 = operand1 {
                self.sqroot(op1: operand1)
            }
        default:
            return
        }
    }
    
    mutating func add(op1: Float, op2: Float) {
        self.result = op1 + op2
    }
    
    mutating func subtract(op1: Float, op2: Float) {
        self.result = op1 - op2
    }
    
    mutating func multiply(op1: Float, op2: Float) {
        self.result = op1 * op2
    }
    
    mutating func divide(op1: Float, op2: Float) {
        self.result = op1 / op2
    }
    
    mutating func sqroot(op1: Float) {
        self.result = sqrt(op1)
    }
    
    mutating func reset() {
        self = Calculator()
    }
    
}
