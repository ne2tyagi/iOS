//
//  GreenViewController.swift
//  StackViewDemo
//
//  Created by Neetu Tyagi on 14/01/17.
//  Copyright © 2017 MyPractice. All rights reserved.
//

import UIKit

class GreenViewController: UIViewController {

    @IBAction func closeMe(){
        self.dismiss(animated: true, completion: nil);
    }
    
    @IBAction func addImageV(){
        let imageV = UIImageView(image: UIImage(named:"128"))
        imageV.frame = CGRect(x:20,y:20,width:self.view.frame.width-100, height:200);
        self.view.addSubview(imageV)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}
