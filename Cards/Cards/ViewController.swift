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
        let layer = CAShapeLayer()
        layer.path = cPath.cgPath
        
        layer.lineWidth = 2
        layer.strokeColor = UIColor.white.cgColor
        layer.fillColor = UIColor.clear.cgColor
        
        containerView.layer.addSublayer(layer)
        
        // Add animation
    }
    
    func makeLogo() {

        // cPath
        cPath.move(to: CGPoint(x: 100, y: 25))
        cPath.addCurve(to: CGPoint(x: 70, y: 20), controlPoint1: CGPoint(x: 97, y: 12), controlPoint2: CGPoint(x: 75, y: 15))
        cPath.addCurve(to: CGPoint(x: 70, y: 93), controlPoint1: CGPoint(x: 52, y: 30), controlPoint2: CGPoint(x: 50, y: 80))
        cPath.addCurve(to: CGPoint(x: 105, y: 80), controlPoint1: CGPoint(x: 84, y: 99), controlPoint2: CGPoint(x: 100, y: 87))
        cPath.addLine(to: CGPoint(x: 108, y: 80))
        
        // aPath
        aPath.move(to: CGPoint(x: 130, y: 65))
        aPath.addCurve(to: CGPoint(x: 120, y: 65), controlPoint1: CGPoint(x: 127, y: 58), controlPoint2: CGPoint(x: 123, y: 58))
    }
}

