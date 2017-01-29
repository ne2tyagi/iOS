//
//  ViewController.swift
//  StackViewDemo
//
//  Created by Neetu Tyagi on 13/01/17.
//  Copyright © 2017 MyPractice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textv:UILabel!
    
    @IBAction func showGraphics(){
        let rect = UIView(frame: CGRect(x:20, y: 200, width: 200, height: 200))
        rect.backgroundColor = UIColor.cyan
        self.view.addSubview(rect)
        UIView.animate(withDuration: 5.0, animations: {
            let scaleAn = CGAffineTransform(scaleX: 0.3, y: 0.4)
        
            rect.transform = scaleAn
        })
        self.textv.text = "Sample updated text";
        let subView = UITextView(frame: CGRectFromString("{{10,10},{100,100}}"));
        subView.text = "Sample text in textview sample sample sample"
        rect.addSubview(subView);
    }
    
    @IBAction func showRedView(){
        let redCtrl:RedViewController = RedViewController();
        self.present(redCtrl, animated: true, completion: nil);
    }
    
    @IBOutlet var imageV: UIImageView!
    @IBAction func addImage(){
        self.imageV.image = UIImage(named:"128-3")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

