//
//  ViewControllerTwo.swift
//  ViewController
//
//  Created by XP on 6/30/19.
//  Copyright © 2019 XP. All rights reserved.
//

import UIKit

class ViewControllerTwo: UIViewController {
    
    @IBOutlet weak var beautyLabel: UILabel!
    @IBOutlet weak var happyLabel: UILabel!
    @IBOutlet weak var happyButton: UIButton!
    
    override func loadView() {
        super.loadView()
        
        print("loadView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoad")
        hello()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("viewWillAppear")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        print("viewDidLayoutSubviews")
    }
    
    func hello() {
        print("Hi")
    }
    
    @IBAction func beautyButton(_ sender: UIButton) {
        self.alertForBeauty(title: "BEAUTY", message: "What is your name?", style: .alert)
    }
    
    @IBAction func healthButton(_ sender: UIButton) {
        self.alert(title: "HEALTH", message: "You can visit a doctor!", style: .actionSheet)
    }
    
    @IBAction func happyButton(_ sender: UIButton) {
        self.alertForHappy(title: "HAPPY", message: "What is the secret?", style: .alert)
        happyButton.backgroundColor = (happyButton.backgroundColor == #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1) ? #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1))
    }
    
    @IBAction func foodButton(_ sender: UIButton) {
        self.alert(title: "FOOD", message: "You can cook something!", style: .actionSheet)
    }
    
    //MARK: - General alert
    func alert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "ok", style: .default, handler: nil)
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    //MARK: - Alert for Beauty button
    func alertForBeauty(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "ok", style: .cancel) { (action) in
            let text = alertController.textFields?.first
            self.beautyLabel.text! += (text?.text)! + (" is beautiful!")
        }
        
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    //MARK: - Alert for Happy button
    func alertForHappy(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "ok", style: .cancel) { (action) in
            let text = alertController.textFields?.first
            self.happyLabel.text! += (text?.text)! + (" is happy secret!")
        }
        
        alertController.addTextField { (textField) in
            textField.isSecureTextEntry = true
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
