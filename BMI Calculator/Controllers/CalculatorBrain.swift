//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Kappa on 05/09/2024.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    var height: Float?
    var weight: Float?
    var bmi: BMI?
    
    mutating func setHeight(newHeight: Float) {
        height = newHeight
    }
    
    mutating func setWeight(newWeight: Float) {
        weight = newWeight
    }
    
    func getBmi() -> BMI {
        return bmi ?? BMI(value: "0.0", advice: "No Advice", color: UIColor.white)
    }
    
    mutating func calculateBmi() {
        let valueFloat: Float?
        
        if let safeWeight = weight, let safeHeight = height {
            valueFloat = safeWeight / (pow(safeHeight, 2))
        } else {
            return
        }
        
        let valueString = String(format: "%.1f", valueFloat ?? 0.0)
        bmi = BMI(value: valueString, advice: getAdvice(valueFloat!), color: getColor(valueFloat!))
    }
    
    func getAdvice(_ i: Float) -> String{
        if i <= 18.5 {
            return "You need to eat more!"
        } else if i > 18.5, i < 24.9 {
            return "Nice body, keep it going!"
        } else {
            return "Eat less FastFood!"
        }
    }
    
    func getColor(_ i: Float) -> UIColor{
        if i <= 18.5 {
            return #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        } else if i > 18.5, i < 24.9 {
            return #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        } else {
            return #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }
    }
    
    func getHeightText() -> String {
        return String(format: "%.2fm", height ?? 0)
    }
    
    func getWeightText() -> String {
        let weight = Float(round((weight ?? 0) * 10)/10)
        return "\(weight)Kg"
    }
}
