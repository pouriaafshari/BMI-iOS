//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateView: UIViewController {

    @IBOutlet weak var heightSliderView: UISlider!
    @IBOutlet weak var weightSliderView: UISlider!
    @IBOutlet weak var weightSliderLabel: UILabel!
    @IBOutlet weak var heightSliderLabel: UILabel!
    
    var bmiValue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChange(_ sender: UISlider) {
        var height = Float(round(sender.value*100)/100)
        heightSliderLabel.text = String(format: "%.2fm", sender.value)
    }
    
    @IBAction func weightSliderChange(_ sender: UISlider) {
        var weight = Float(round(sender.value*10)/10)
        weightSliderLabel.text = "\(weight)Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSliderView.value
        let weight = weightSliderView.value
        
        let bmi = weight / (pow(height, 2))
        bmiValue = String(format: "%.1f", bmi)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = bmiValue
        }
    }
}

