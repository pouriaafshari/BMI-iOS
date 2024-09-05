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
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculatorBrain.setWeight(newWeight: weightSliderView.value)
        calculatorBrain.setHeight(newHeight: heightSliderView.value)
    }

    @IBAction func heightSliderChange(_ sender: UISlider) {
        calculatorBrain.setHeight(newHeight: sender.value)
        heightSliderLabel.text = calculatorBrain.getHeightText()
    }
    
    @IBAction func weightSliderChange(_ sender: UISlider) {
        calculatorBrain.setWeight(newWeight: sender.value)
        weightSliderLabel.text = calculatorBrain.getWeightText()
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        calculatorBrain.calculateBmi()
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            let myBmi = calculatorBrain.getBmi()
            destinationVC.bmiValue = myBmi.value
            destinationVC.bmiAdvice = myBmi.advice
            destinationVC.bmiColor = myBmi.color
        }
    }
}

