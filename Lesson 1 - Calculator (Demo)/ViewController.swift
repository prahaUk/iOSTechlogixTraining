//
//  ViewController.swift
//  Lesson 1 - Calculator (Demo)
//
//  Created by UmairKhan on 18/04/2016.
//  Copyright © 2016 UmairKhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var display: UILabel!
    var isUserInMiddleOfTyping : Bool = false
    
    @IBAction func appendDigit(sender: UIButton) {
    
        let digit = sender.currentTitle!
        
        if isUserInMiddleOfTyping {
            display.text = display.text! + digit;
        } else {
            isUserInMiddleOfTyping = true;
            display.text = digit;
        
        }
        
    
    
    
    }
    
}

