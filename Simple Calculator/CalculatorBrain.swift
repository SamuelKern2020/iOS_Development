//
//  CalculatorBrain.swift
//  Simple Calculator
//
//  Created by Samuel Kern on 2/2/15.
//  Copyright (c) 2015 Samuel Kern. All rights reserved.
//

import Foundation

class CalculatorBrain{
    private enum Op {
        case Operand(Double)
        case UnaryOperation(String, Double -> Double)
        case BinaryOperation (String, (Double, Double) ->Double)
    }
    
    private var opStack = [Op]() //Stack containing Op enums
    
    
    private var knownOps = [String: Op]() //A dictionary containing all known operations. Init creates new instances of Op enums
    
    init () {
        knownOps["+"] = Op.BinaryOperation("+", +)  //creates a new Op enum containing a symbol (string) and a coorisponding function. In this case + is a built-in function that takes two Doubles and returns a single Double. (Double, Double) -> Double
        knownOps["-"] = Op.BinaryOperation("-") {$1 - $0}
        knownOps["*"] = Op.BinaryOperation("*", *)
        knownOps["/"] = Op.BinaryOperation("/") {$1 / $0}
    }
    
    func pushOperand (number: Double){ //Add a -> Double once evaluate() is created
        opStack.append(Op.Operand(number))
        //will add a return evaluate() once completed
    }
    
    func performOperation (symbol: String) {
        if let newOperation = knownOps[symbol]{
            opStack.append(newOperation)
        }
    }
    
    
    func evaluate() -> Double? {    //Return type is an optional because a user could only have operations on the stack and then call evaluate. We need to be able to return nil, hence the optional.
        
    }
    
   
    func evaluate(ops: [Op]) -> (result: Double?, remaining: [Op]) {//There is an implicit "let" in front of the arguement "ops", making it immutable.
        
        if !ops.isEmpty {
            var remainingOps = ops  //Copying immutable array "ops" into a mutable array "remainingOps" using var
            let op = remainingOps.removeLast()
            switch op {
            case .Operand(let operand):
                return (operand, remainingOps)
            case .UnaryOperation(_, let operation):
                let operandEvaluation = evaluate(remainingOps)
                if let thisOperand = operandEvaluation.result{
                    return (operation(thisOperand), operandEvaluation.remainingOps)
                }
            case .BinaryOperation(_, let operation):
                let operand1Evaluation = evaluate(remainingOps)
                if let operand1 = operand1Evaluation.result{
                    let operand2Evaluation = evaluate(operand1Evaluation.remainingOps)
                    if let operand2 = operand2Evaluation.result{
                        return (operatioin(operand1, operand2), operand2Evaluation.remainingOps)
                    }
                    
                }

                
            }
    
            
            
        }
        
        return (nil, ops)
        
        
        
        
    }
    
    
    
    
    
    
    
    
}