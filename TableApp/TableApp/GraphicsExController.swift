//
//  GraphicsExController.swift
//  TableApp
//
//  Created by Neetu Tyagi on 18/01/17.
//  Copyright © 2017 MyPractice. All rights reserved.
//

import UIKit

class GraphicsExController: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func draw(_ rect: CGRect) {
        
        
        let bg = UIImage(named: "128")
        bg?.draw(in: UIScreen.main.bounds)
        
        let context = UIGraphicsGetCurrentContext()
        context?.move(to: CGPoint(x:0,y:0))
        context?.addLine(to: CGPoint(x:100, y:100))
        context?.setStrokeColor(UIColor.red.cgColor)
        context?.strokePath()
        let w = rect.width;
        context?.addRect(CGRect(x:100,y:100,width:w/2,height:100))
        context?.setFillColor(UIColor.blue.cgColor)
        context?.fillPath()
        
        context?.addLines(between: [CGPoint(x:300,y:300), CGPoint(x:w, y: rect.height)])
        context?.setStrokeColor(UIColor.brown.cgColor)
        context?.strokePath()
        
        let img = UIImage(named: "128-3")
        let pt = CGPoint(x:200,y:200)
        img?.draw(at: pt)
        
    }
}
