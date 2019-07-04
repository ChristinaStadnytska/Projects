//
//  ViewController.swift
//  SalaryApp
//
//  Created by XP on 7/3/19.
//  Copyright © 2019 XP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let labelSalary = UILabel()
    let labelHours = UILabel()
    
    let textFieldSalary = UITextField()
    let textFieldHours = UITextField()
    
    let circleView = UIView()
    let labelInCircle = UILabel()
    let switchInCircle = UISwitch()
    
    let buttonCalc = UIButton()
    let labelResult = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - Design of elements
        
        //label for salary
        self.labelSalary.frame = CGRect(x: 20, y: 100, width: 300, height: 50)
        self.labelSalary.text = "Your salary per hour:"
        self.view.addSubview(self.labelSalary)
        
        //label for hours
        self.labelHours.frame = CGRect(x: 20, y: 200, width: 300, height: 50)
        self.labelHours.text = "Working hours per week:"
        self.view.addSubview(self.labelHours)
        
        //textField for salary
        self.textFieldSalary.frame = CGRect(x: 230, y: 100, width: 150, height: 50)
        self.textFieldSalary.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        self.textFieldSalary.layer.borderWidth = 3
        self.textFieldSalary.layer.cornerRadius = 10
        self.textFieldSalary.textAlignment = .center
        self.view.addSubview(self.textFieldSalary)
        
        //textField for hours
        self.textFieldHours.frame = CGRect(x: 230, y: 200, width: 150, height: 50)
        self.textFieldHours.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        self.textFieldHours.layer.borderWidth = 3
        self.textFieldHours.layer.cornerRadius = 10
        self.textFieldHours.textAlignment = .center
        self.view.addSubview(self.textFieldHours)
        
        //circle for tax
        self.circleView.frame = CGRect(x: 50, y: 350, width: 200, height: 200)
        self.circleView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.circleView.layer.cornerRadius = 100
        self.view.addSubview(self.circleView)
        //label in circle
        self.labelInCircle.frame = CGRect(x: 65, y: 50, width: 100, height: 30)
        self.labelInCircle.text = "-19% tax"
        self.circleView.addSubview(self.labelInCircle)
        //switch in circle
        self.switchInCircle.frame = CGRect(x: 75, y: 100, width: 0, height: 0)
        self.circleView.addSubview(self.switchInCircle)
        self.switchInCircle.addTarget(self, action: #selector(colorCicle(mySwitch:)), for: .valueChanged)
        
        //calculating button
        self.buttonCalc.frame = CGRect(x: 200, y: 650, width: 150, height: 50)
        self.buttonCalc.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        self.buttonCalc.layer.cornerRadius = 10
        self.buttonCalc.setTitle("Calculate", for: .normal)
        self.buttonCalc.setTitle("Clicked💥", for: .highlighted)
        self.view.addSubview(self.buttonCalc)
        self.buttonCalc.addTarget(self, action: #selector(calculate(salary:hours:)), for: .touchUpInside)
        
        //label for result
        self.labelResult.frame = CGRect(x: 50, y: 750, width: 150, height: 50)
        self.labelResult.layer.borderWidth = 3
        self.labelResult.layer.borderColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        self.labelResult.layer.cornerRadius = 10
        self.labelResult.textAlignment = .center
        self.view.addSubview(self.labelResult)
        
    }

    //MARK: - change background in circleView
    @objc func colorCicle(mySwitch: UISwitch) {
        circleView.backgroundColor = (mySwitch.isOn ? #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1) : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
    }
    
    //MARK: - calculate salary
    @objc func calculate(salary: Double, hours: Double){
        var mySalary = salary
        mySalary = Double(textFieldSalary.text ?? "") ?? 0
        
        var myHours = hours
        myHours = Double(textFieldHours.text ?? "") ?? 0
        
        if switchInCircle.isOn {
            var result = mySalary * myHours
            let tax = result * 0.195
            result -= tax
            labelResult.text = "\(result) UAH"
        } else {
            labelResult.text = "\(mySalary * myHours) UAH"
        }
    }

}

