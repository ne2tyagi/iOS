//
//  ViewController.swift
//  GraphicsProject
//
//  Created by Neetu Tyagi on 20/01/17.
//  Copyright © 2017 MyPractice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UIView.animate(withDuration: 5.0, animations: {
            print("anima")
            self.view.backgroundColor = UIColor.init(red: 0.5, green: 0.2, blue: 0.2, alpha: 0.5)
            self.button.backgroundColor = UIColor.yellow
            self.button.tintColor = UIColor.red
            self.button.transform = CGAffineTransform(scaleX: 0.5, y: 0.25)
            self.button.transform = CGAffineTransform(rotationAngle: CGFloat(0.25*M_PI))
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sample(){
        print("test")
        let grect:UIView?
            grect = UIView(frame: CGRect(x:50, y:50,width: 200, height: 200))
        grect?.backgroundColor = UIColor.cyan
        self.view.addSubview(grect!)
        
        let uianim: UIDynamicAnimator?
        uianim = UIDynamicAnimator(referenceView: self.view)
        
        let gravity:UIGravityBehavior?
            gravity = UIGravityBehavior(items: [grect!])
        gravity?.gravityDirection = CGVector(dx: 0.0, dy: 1.0)
        
            uianim?.addBehavior(gravity!)
        //collision.translatesReferenceBoundsIntoBoundary = true
        
        //animator?.addBehavior(collision)
    }
}

