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
    
    
    var brain = CalculatorBrain()   //Creates an instance of CalculatorBraing (the green arrow from the controller to the model)
    
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
    
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber{
            enter()
        }
        if let operation = sender.currentTitle{
            if let result = brain.performOperation(operation){
                displayValue = result
            }
            else {
                displayValue = 0

            }
                    }
        
    }
    
    
    func enter() {
        userIsInTheMiddleOfTypingANumber = false
        brain.pushOperand(displayValue)
        if let result = brain.pushOperand(displayValue){
            displayValue = result
        }

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