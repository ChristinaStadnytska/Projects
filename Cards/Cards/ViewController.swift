//
//  ViewController.swift
//  Cards
//
//  Created by Christina Stadnytska on 20.01.2020.
//  Copyright © 2020 Christina Stadnytska. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        animate()
    }

    func animate() {
        let path = UIBezierPath()
        let origin = CGPoint(x: self.view.frame.origin.x, y: self.view.frame.origin.y + self.view.bounds.height / 3)
        let size = CGSize(width: self.view.bounds.width, height: self.view.frame.height / 8)
        let containerView = UIView(frame: CGRect(origin: origin, size: size))
        containerView.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        
        self.view.addSubview(containerView)
        
//        path.move(to: CGPoint(x: containerView.frame.maxX, y: containerView.frame.maxY))
//        path.addQuadCurve(to: CGPoint(x: 0, y: containerView.frame.maxY), controlPoint: CGPoint(x: containerView.frame.maxX/2, y: 0))
//
//        let animation = CAKeyframeAnimation(keyPath: "position")
//        animation.path = path.cgPath
//
//        animation.repeatCount = 0
//        animation.duration = 2.0
//
//        containerView.layer.add(animation, forKey: "animate")
//        containerView.center = CGPoint(x: 0, y: containerView.frame.maxY)
    }


}

