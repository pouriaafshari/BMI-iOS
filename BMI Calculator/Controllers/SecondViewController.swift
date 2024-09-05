//
//  SecondViewController.swift
//  BMI Calculator
//
//  Created by Kappa on 05/09/2024.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

class SecondViewController : UIViewController {
    var bmi:String = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        let label = UILabel()
        label.text = bmi
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        view.addSubview(label)
    }
}
