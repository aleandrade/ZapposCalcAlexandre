//
//  ViewController.swift
//  ZapposCalc
//
//  Created by agomesan on 2/11/16.
//  Copyright (c) 2016 agomesan. All rights reserved.
//

import UIKit
import Darwin

class ViewController: UIViewController {

    var writingNumber = false
    var firstOperand = Float()
    var secondOperand = Float()
    var res = Float()
    var operation = ""
    
    @IBOutlet weak var display: UILabel!
    
    @IBAction func number(sender: AnyObject) {
        let num = sender.currentTitle
       
        if writingNumber == true{
            display.text = display.text! + num!!;
        } else {
            display.text = num;
        }
        
        writingNumber = true
    }
    
    @IBAction func dot(sender: AnyObject) {
        let dot = sender.currentTitle
        display.text = display.text! + dot!!
    }
    
    @IBAction func operation(sender: AnyObject) {
        operation = sender.currentTitle!!
        writingNumber = false
        firstOperand = (display.text! as NSString).floatValue
    }
    
    @IBAction func result(sender: AnyObject) {
        secondOperand = (display.text! as NSString).floatValue
        
        if operation == "*" {
            res = firstOperand * secondOperand
        } else if operation == "/"{
            res = firstOperand / secondOperand
        } else if operation == "+"{
            res = firstOperand + secondOperand
        } else if operation == "-"{
            res = firstOperand - secondOperand
        } else if operation == "√"{
            res = sqrt(firstOperand)
        } else if operation == "^2"{
            res = firstOperand * firstOperand
        } else if operation == "!"{
            res = factorial(firstOperand)
        }
        
        display.text = "\(res)"
    }
    
    @IBAction func clear(sender: AnyObject) {
        firstOperand = 0
        secondOperand = 0
        res = 0
        display.text = ""
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

func factorial(n: Float) -> Float {
    var facresult = Int(n);
    var i = Int(n) - 1;
    
    while(i>0){
        facresult = facresult * (i);
        i--;
    }
    
    return Float(facresult);
}
