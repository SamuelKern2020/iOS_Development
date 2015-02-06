//
//  CalculatorBrain.swift
//  Simple Calculator
//
//  Created by Samuel Kern on 2/2/15.
//  Copyright (c) 2015 Samuel Kern. All rights reserved.
//

import Foundation

class CalculatorBrain{
    private enum Op: Printable
    {
        case Operand(Double)
        case UnaryOperation(String, Double -> Double)
        case BinaryOperation (String, (Double, Double) ->Double)
        
        var description: String {
            get{
                switch self {
                case .Operand(let operand):
                    return "\(operand)"
                case .UnaryOperation(let symbol, _):
                    return symbol
                case .BinaryOperation(let symbol, _):
                    return symbol
                    
                }
            }
        }
    }
    
    private var opStack = [Op]() //Stack containing Op enums
    
    private var knownOps = [String: Op]() //A dictionary containing all known operations. Init creates new instances of Op enums
    
    init () {
        knownOps["+"] = Op.BinaryOperation("+", +)  //creates a new Op enum containing a symbol (string) and a coorisponding function. In this case + is a built-in function that takes two Doubles and returns a single Double. (Double, Double) -> Double
        knownOps["-"] = Op.BinaryOperation("-") {$1 - $0}
        knownOps["*"] = Op.BinaryOperation("*", *)
        knownOps["/"] = Op.BinaryOperation("/") {$1 / $0}
    }
    
    func pushOperand (number: Double) -> Double? { //Evaluates the stack every time a operand is pushed
        opStack.append(Op.Operand(number))
        return evaluate()
    }
    
    func pushOperation (symbol: String){
        if let newOperation = knownOps[symbol]{
            opStack.append(newOperation)
        }
    }
    func performOperation (symbol: String) -> Double? {
        if let newOperation = knownOps[symbol]{
            opStack.append(newOperation)
        }
        return evaluate()
    }
    
    
    func evaluate() -> Double? {    //Return type is an optional because a user could only have operations on the stack and then call evaluate. We need to be able to return nil, hence the optional.
        let (result, remainder) = evaluate(opStack)
        println("\(opStack) = \(result) with \(remainder) left over")
        return result
    }
    
   
    private func evaluate(ops: [Op]) -> (result: Double?, remainingOps: [Op]) {//There is an implicit "let" in front of the arguement "ops", making it immutable.
        
        if !ops.isEmpty {
            var remainingOps = ops  //Copying immutable array "ops" into a mutable array "remainingOps" using var
            let op = remainingOps.removeLast()
            switch op {
            case .Operand(let operand):
                return (operand, remainingOps)
            case .UnaryOperation(_, let operation):
                let operandEvaluation = evaluate(remainingOps)
                if  let operand = operandEvaluation.result{
                    return (operation(operand), operandEvaluation.remainingOps)
                }
            case .BinaryOperation(_, let operation):
                let operand1Evaluation = evaluate(remainingOps)
                if let operand1 = operand1Evaluation.result{
                    let operand2Evaluation = evaluate(operand1Evaluation.remainingOps)
                    if let operand2 = operand2Evaluation.result{
                        return (operation(operand1, operand2), operand2Evaluation.remainingOps)
                    }
                }
            }
        }
        
        
        return (nil, ops)
        
    }
    
    
    
    
    
    
    
    
}