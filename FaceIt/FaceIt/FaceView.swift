//
//  FaceView.swift
//  FaceIt
//
//  Created by Neetu Tyagi on 30/01/17.
//  Copyright © 2017 MyPractice. All rights reserved.
//

import UIKit

class FaceView: UIView {

    let scale: CGFloat = 0.9;
    
    var skullRadius: CGFloat{
        return CGFloat(min(bounds.size.width, bounds.size.height)/2) * scale;
    }
    var skullCenter: CGPoint{
        return CGPoint(x: bounds.midX, y: bounds.midY);
    }
    
    private struct Ratios{
        static let SkullRadiusToEyeOffset: CGFloat = 3;
        static let SkullRadiusToEyeRadius: CGFloat = 10;
        static let SkullRadiusToMouthWidth: CGFloat = 1;
        static let SkullRadiusToMouthHeight: CGFloat = 3;
        static let SkullRadiusToMouthOffset: CGFloat = 3;
    }
    private enum Eye{
        case Left
        case Right
    }
    
    private func pathForCircleCenteredAtPoint(arcCenter: CGPoint, arcRadius: CGFloat)->UIBezierPath {
        let path = UIBezierPath(arcCenter: arcCenter, radius: arcRadius, startAngle: CGFloat(0), endAngle: CGFloat(2*M_PI), clockwise: true);
        path.lineWidth = 5.0;
        return path;
    }
    
    private func getEyeCenter(eye: Eye)-> CGPoint{
        let eyeOffset = skullRadius/Ratios.SkullRadiusToEyeOffset;
        var eyeCenter = skullCenter;
        eyeCenter.y -= eyeOffset;
        switch eye {
        case .Left:
            eyeCenter.x -= eyeOffset
        case .Right:
            eyeCenter.x += eyeOffset
        }
        return eyeCenter
    }
    private func pathForEye(eye: Eye)-> UIBezierPath{
        let eyeRadius = skullRadius/Ratios.SkullRadiusToEyeRadius;
        let eyeCenter = getEyeCenter(eye: eye)
        return pathForCircleCenteredAtPoint(arcCenter: eyeCenter, arcRadius: eyeRadius)
    }
    private func pathForMouth()-> UIBezierPath{
        let mouthWidth = skullRadius/Ratios.SkullRadiusToMouthWidth;
        let mouthHeight = skullRadius/Ratios.SkullRadiusToMouthHeight;
        let mouthOffset = skullRadius/Ratios.SkullRadiusToMouthOffset;
        let mouthRect = CGRect(x: skullCenter.x-mouthWidth/2, y: skullCenter.y+mouthOffset, width:mouthWidth, height: mouthHeight)
        //UIBezierPath(rect:mouthRect).stroke()
        let mouthCurvature: Double = 0.8 //1 Full Smile, -1 Full Frown
        let smileOffset = CGFloat(max(-1, min(mouthCurvature, 1))) * mouthHeight;
        //print(mouthWidth, mouthHeight, mouthOffset, smileOffset)
        let start = CGPoint(x: mouthRect.minX, y: mouthRect.minY);
        let end = CGPoint(x: mouthRect.maxX, y: mouthRect.minY);
        let cp1 = CGPoint(x: mouthRect.minX+mouthWidth/3, y: mouthRect.minY+smileOffset)
        let cp2 = CGPoint(x: mouthRect.maxX-mouthWidth/3, y: mouthRect.minY+smileOffset)
        let path = UIBezierPath()
        path.move(to: start)
        path.addCurve(to: end, controlPoint1: cp1, controlPoint2: cp2)
        path.lineWidth = 6.0
        return path
        
    }

    override func draw(_ rect: CGRect) {
        // Drawing code

        UIColor.blue.set();
        pathForCircleCenteredAtPoint(arcCenter: skullCenter, arcRadius: skullRadius).stroke();
        pathForEye(eye: .Left).stroke()
        pathForEye(eye: .Right).stroke()
        UIColor.purple.set()
        pathForMouth().stroke()
    }
    

}
