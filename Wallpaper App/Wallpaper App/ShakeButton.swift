//
//  ShakeButton.swift
//  Wallpaper App
//
//  Created by XP on 9/18/19.
//  Copyright © 2019 XP. All rights reserved.
//

import UIKit

class ShakeButton: UIButton {

    func shake() {
        let shakeAnimation = CABasicAnimation(keyPath: "shake")
        
        shakeAnimation.fromValue = CGPoint(x: center.x, y: center.y - 10)
        shakeAnimation.toValue = CGPoint(x: center.x, y: center.y + 10)
        shakeAnimation.duration = 0.06
        shakeAnimation.repeatCount = 6
        shakeAnimation.autoreverses = true
        
        layer.add(shakeAnimation, forKey: "shake")
    }

}
