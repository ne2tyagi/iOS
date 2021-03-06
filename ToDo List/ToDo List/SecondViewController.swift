//
//  SecondViewController.swift
//  ToDo List
//
//  Created by Neetu Tyagi on 11/02/17.
//  Copyright © 2017 MyPractice. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet var txtTask: UITextField!
    @IBOutlet var txtDesc: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addTask(sender: UIButton){
        taskMgr.addTask(name: txtTask.text!, description: txtDesc.text!)
        self.view.endEditing(true)
        txtDesc.text = ""
        txtTask.text = ""
        self.tabBarController?.selectedIndex = 0
        print("saving task")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

