//
//  ViewController.swift
//  Simple Calculator
//
//  Created by Samuel Kern on 1/29/15.
//  Copyright (c) 2015 Samuel Kern. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTypingANumber = false
    
    //Adds the number you select to the display.
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber{
            display.text = display.text! + digit
        }
        else{
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
    }
    
    var nextOperation = "nada"
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber{
            enter()
        }
        
        if operandStack.count == 1 {//a second value for calculation hasn't been given yet. Ex: 100 + ...
            nextOperation = operation
        }
        if operandStack.count >= 2 {//Uses stored operator to do calculation on the 2 numbers in the stack
            switch nextOperation {
            case "*": performOperation { $0 * $1}
            case "/": performOperation { $1 / $0}
            case "+": performOperation { $0 + $1}
            case "-": performOperation { $1 - $0}
            case "s": performOperation { sqrt($0)}
            case "=": break
            default: break
            }
            nextOperation = operation
            
        }
    }
    
    func performOperation(operation: (Double, Double) -> Double){
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    func performOperation(operation: (Double) -> Double){
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }

    
    var operandStack = Array<Double>()
    
    func enter() {
        userIsInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        println("operandStack = \(operandStack)")
    }
    

    
    var displayValue: Double {//Turns string shown on the display into a double
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
    
    
    @IBAction func clear() {
        display.text = "0"
        userIsInTheMiddleOfTypingANumber = false
    }

    
    
}





//class ViewController: UIViewController {
//    
//    
//    @IBOutlet weak var display: UILabel!
//    
//    var userIsInTheMiddleOfTypingANumber = false
//    
//    //Adds the number you select to the display.
//    @IBAction func appendDigit(sender: UIButton) {
//        let digit = sender.currentTitle!
//        if userIsInTheMiddleOfTypingANumber{
//            display.text = display.text! + digit
//        }
//        else{
//            display.text = digit
//            userIsInTheMiddleOfTypingANumber = true
//        }
//    }
//    
//    
//    @IBAction func operate(sender: UIButton) {
//        let operation = sender.currentTitle!
//        if userIsInTheMiddleOfTypingANumber{
//            enter()
//        }
//        switch operation {
//        case "*": performOperation { $0 * $1}
//        case "/": performOperation { $1 / $0}
//        case "+": performOperation { $0 + $1}
//        case "-": performOperation { $1 - $0}
//        case "s": performOperation { sqrt($0)}
//        default: break
//        }
//        
//    }
//    
//    func performOperation(operation: (Double, Double) -> Double){
//        if operandStack.count >= 2 {
//            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
//            enter()
//        }
//    }
//    func performOperation(operation: (Double) -> Double){
//        if operandStack.count >= 1 {
//            displayValue = operation(operandStack.removeLast())
//            enter()
//        }
//    }
//    
//    
//    var operandStack = Array<Double>()
//    
//    @IBAction func enter() {
//        userIsInTheMiddleOfTypingANumber = false
//        operandStack.append(displayValue)
//        println("operandStack = \(operandStack)")
//    }
//    
//    
//    
//    var displayValue: Double {//Turns string shown on the display into a double
//        get{
//            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
//        }
//        set{
//            display.text = "\(newValue)"
//            userIsInTheMiddleOfTypingANumber = false
//        }
//    }
//    
//    
//    
//}

    

    

    
    
    


