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
            operand1 = Float(operand)
        } else {
            operand2 = Float(operand)
        }
    }
    
    mutating func add(op1: Float, op2: Float) {

    }
    
    mutating func subtract(op1: Float, op2: Float) {
        
    }
    
    mutating func multiply(op1: Float, op2: Float) {
        
    }
    
    mutating func divide(op1: Float, op2: Float) {
        
    }
    
    mutating func sqroot(op1: Float) {
        
    }
    
}
