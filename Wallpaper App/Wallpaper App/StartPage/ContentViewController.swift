//
//  ContentViewController.swift
//  Wallpaper App
//
//  Created by XP on 9/16/19.
//  Copyright © 2019 XP. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    var getIndex = 0
    var img = ""
    var text = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: img)
        textLabel.text = text
    }
}

