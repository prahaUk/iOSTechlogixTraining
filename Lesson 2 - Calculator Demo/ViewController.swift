//
//  ViewController.swift
//  Lesson 2 - Calculator Demo
//
//  Created by UmairKhan on 19/04/2016.
//  Copyright © 2016 UmairKhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    var isUserInMiddleOfTyping : Bool = false;
    var operand : Array<Double> = Array<Double>()
    var displayValue : Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
            
        } set {
            display.text = "\(newValue)"
            isUserInMiddleOfTyping = true
        }
    }
    
    
    @IBAction func appendDigit(sender: UIButton) {
        
        
        let digit = sender.currentTitle!
        
        if isUserInMiddleOfTyping {
            
            display.text = display.text! + digit
            
            
        } else {
            
            display.text = digit
            isUserInMiddleOfTyping = true
            
        }
    }
    
    @IBAction func enter() {
        
        isUserInMiddleOfTyping = false
        operand.append(displayValue)
        
        print("In enter the operand is: \(operand)")
    }
    
    
    func performOperationWithSingleVariable(operation: (Double) -> Double) {
        
        
        var result :Double = 0.0
        
        if operand.count >= 1 {
        
            result = sqrt(operand.removeLast())
            displayValue = result
            print("Result is: \(result)");
        }
        
        
    }
    
    
    func performOperation(operation: (Double, Double) -> Double) {
        
        var result : Double = 0.0
        
        
        if operand.count >= 2 {
            
            result = operation(operand.removeLast(), operand.removeLast())
            print("\(result)")
            displayValue = result
            enter()
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        
        let operation = sender.currentTitle!
        if isUserInMiddleOfTyping {
            enter()
        }
        
        switch operation {
            
        case "+": performOperation{$0 + $1}
            break
        case "-": performOperation{$1 - $0}
            break
        case "×": performOperation{$0 * $1}
            break
        case "÷": performOperation{$1 / $0}
            break
        case "√": performOperationWithSingleVariable{$0}
            break
        default: break
            
        }
        
    }
}

