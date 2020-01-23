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
        UIColor.white.setFill()
        cPath.fill()
        
        UIColor.purple.setStroke()
        cPath.lineWidth = 2
        cPath.stroke()
        
        let layer = CAShapeLayer()
        layer.path = cPath.cgPath
        
        layer.strokeEnd = 0
        layer.lineWidth = 2
        layer.borderColor = UIColor.red.cgColor
        layer.shadowColor = UIColor.yellow.cgColor
        layer.shadowRadius = 12
        layer.shadowOpacity = 0.8
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.strokeColor = UIColor.blue.cgColor
        layer.fillColor = UIColor.white.cgColor
        
        containerView.layer.addSublayer(layer)
        
        // Add animation
    }
    
    func makeLogo() {

        // cPath
        cPath.move(to: CGPoint(x: 50, y: 30))
        cPath.addCurve(to: CGPoint(x: 50, y: 80), controlPoint1: CGPoint(x: 30, y: 20), controlPoint2: CGPoint(x: 0, y: 50))
//        path.addCurve(to: CGPoint(x: 74.1, y: 49.26), controlPoint1: CGPoint(x: 84.23, y: 46.96), controlPoint2: CGPoint(x: 79.37, y: 49.69))
//        path.addCurve(to: CGPoint(x: 74, y: 47.52), controlPoint1: CGPoint(x: 74.03, y: 48.71), controlPoint2: CGPoint(x: 74, y: 48.13))
//        path.addCurve(to: CGPoint(x: 79.3, y: 34.51), controlPoint1: CGPoint(x: 74, y: 43.1), controlPoint2: CGPoint(x: 75.91, y: 38.38))
//        path.addCurve(to: CGPoint(x: 85.76, y: 29.63), controlPoint1: CGPoint(x: 80.99, y: 32.55), controlPoint2: CGPoint(x: 83.15, y: 30.93))
//        path.addCurve(to: CGPoint(x: 93.15, y: 27.52), controlPoint1: CGPoint(x: 88.37, y: 28.35), controlPoint2: CGPoint(x: 90.83, y: 27.65))
//        path.addCurve(to: CGPoint(x: 93.25, y: 29.36), controlPoint1: CGPoint(x: 93.22, y: 28.14), controlPoint2: CGPoint(x: 93.25, y: 28.75))
//        path.addLine(to: CGPoint(x: 93.25, y: 29.36))

        cPath.close()
    }
}

