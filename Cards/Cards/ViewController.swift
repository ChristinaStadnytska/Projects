//
//  ViewController.swift
//  Cards
//
//  Created by Christina Stadnytska on 20.01.2020.
//  Copyright © 2020 Christina Stadnytska. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let cPath = UIBezierPath()
    let aPath = UIBezierPath()
    let rPath = UIBezierPath()
    let dPath = UIBezierPath()
    let sPath = UIBezierPath()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeLogo()
        addAnimationPath()
    }

    func addAnimationPath() {
        // Make background container
        let origin = CGPoint(x: self.view.frame.origin.x, y: self.view.frame.origin.y + self.view.bounds.height / 3)
        let size = CGSize(width: self.view.bounds.width, height: self.view.frame.height / 8)
        let containerView = UIView(frame: CGRect(origin: origin, size: size))
        containerView.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        
        self.view.addSubview(containerView)
        
        // Draw logo
        let paths = [cPath, aPath, rPath, dPath, sPath]
        let layers = paths.map{ path -> CAShapeLayer in
            let layer = CAShapeLayer()
            layer.path = path.cgPath
            layer.lineWidth = 2
            layer.strokeColor = UIColor.white.cgColor
            layer.fillColor = UIColor.clear.cgColor
            containerView.layer.addSublayer(layer)
            return layer
        }
        
        // Add animation
        layers.enumerated().forEach{ offset, layer in
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.fromValue = 0.0
            animation.toValue = 1.0
            animation.duration = 2.0
            
            layer.add(animation, forKey: "drawLineAnimation")
        }
    }
    
    func makeLogo() {

        // cPath
        cPath.move(to: CGPoint(x: 100, y: 25))
        cPath.addCurve(to: CGPoint(x: 70, y: 20), controlPoint1: CGPoint(x: 97, y: 12), controlPoint2: CGPoint(x: 75, y: 15))
        cPath.addCurve(to: CGPoint(x: 70, y: 93), controlPoint1: CGPoint(x: 52, y: 30), controlPoint2: CGPoint(x: 50, y: 80))
        cPath.addCurve(to: CGPoint(x: 105, y: 80), controlPoint1: CGPoint(x: 84, y: 99), controlPoint2: CGPoint(x: 100, y: 87))
        cPath.addLine(to: CGPoint(x: 108, y: 80))
        
        // aPath
        aPath.move(to: CGPoint(x: 154, y: 68))
        aPath.addCurve(to: CGPoint(x: 130, y: 65), controlPoint1: CGPoint(x: 150, y: 58), controlPoint2: CGPoint(x: 135, y: 58))
        aPath.addCurve(to: CGPoint(x: 135, y: 93), controlPoint1: CGPoint(x: 122, y: 75), controlPoint2: CGPoint(x: 123, y: 87))
        aPath.addCurve(to: CGPoint(x: 155, y: 75), controlPoint1: CGPoint(x: 140, y: 95), controlPoint2: CGPoint(x: 155, y: 100))
        aPath.addLine(to: CGPoint(x: 156, y: 75))
        aPath.addCurve(to: CGPoint(x: 170, y: 86), controlPoint1: CGPoint(x: 150, y: 75), controlPoint2: CGPoint(x: 164, y: 110))
        
        // rPath
        rPath.move(to: CGPoint(x: 195, y: 63))
        rPath.addLine(to: CGPoint(x: 195, y: 94))
        rPath.addCurve(to: CGPoint(x: 215, y: 67), controlPoint1: CGPoint(x: 195, y: 70), controlPoint2: CGPoint(x: 212, y: 60))
        
        // dPath
        dPath.move(to: CGPoint(x: 260, y: 68))
        dPath.addCurve(to: CGPoint(x: 236, y: 70), controlPoint1: CGPoint(x: 256, y: 58), controlPoint2: CGPoint(x: 240, y: 60))
        dPath.addCurve(to: CGPoint(x: 240, y: 93), controlPoint1: CGPoint(x: 230, y: 78), controlPoint2: CGPoint(x: 236, y: 90))
        dPath.addCurve(to: CGPoint(x: 262, y: 70), controlPoint1: CGPoint(x: 250, y: 100), controlPoint2: CGPoint(x: 264, y: 80))
        dPath.addLine(to: CGPoint(x: 262, y: 23))
        dPath.addCurve(to: CGPoint(x: 275, y: 88), controlPoint1: CGPoint(x: 257, y: 110), controlPoint2: CGPoint(x: 267, y: 96))
        
        // sPath
        sPath.move(to: CGPoint(x: 323 , y: 71))
        sPath.addCurve(to: CGPoint(x: 300, y: 74), controlPoint1: CGPoint(x: 323, y: 64), controlPoint2: CGPoint(x: 303, y: 62))
        sPath.addCurve(to: CGPoint(x: 324, y: 88), controlPoint1: CGPoint(x: 300, y: 87), controlPoint2: CGPoint(x: 320, y: 75))
        sPath.addCurve(to: CGPoint(x: 298, y: 89), controlPoint1: CGPoint(x: 325, y: 98), controlPoint2: CGPoint(x: 296, y: 96))
    }
}

