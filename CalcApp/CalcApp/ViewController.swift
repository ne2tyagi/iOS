//
//  ViewController.swift
//  CalcApp
//
//  Created by Neetu Tyagi on 22/01/17.
//  Copyright © 2017 MyPractice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var display: UILabel!
    var isUserIntyping = false;
   
    
    @IBAction private func numberPressed(sender: UIButton){
        let text = sender.currentTitle!
        if isUserIntyping{
            let displayValue = display.text!;
            display.text = displayValue + text;
        }else{
            display.text = text;
        }
        isUserIntyping = true;
    }
    var displayValue: Double{
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    private var calc = CalcBrain()
    @IBAction private func opnPressed(sender: UIButton){
        if(isUserIntyping){
            calc.setOperand(operand: displayValue)
        }
        isUserIntyping = false;
        if let symbol = sender.currentTitle{
            calc.performOperation(symbol: symbol)

        }
        displayValue = calc.result
        
    }

}

