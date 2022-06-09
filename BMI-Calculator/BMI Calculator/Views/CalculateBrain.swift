//
//  CalculateBrain.swift
//  BMI Calculator
//
//  Created by Diego Ferreira on 09/06/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

struct CalculateBrain {
    
    var bmi: BMI?
    
    let lightBlueColor = UIColor(red: 0.44, green: 0.82, blue: 0.96, alpha: 1.00)
    let lightGreenColor = UIColor(red: 0.68, green: 0.87, blue: 0.56, alpha: 1.00)
    let lightRedColor = UIColor(red: 0.89, green: 0.43, blue: 0.60, alpha: 1.00)
    
    mutating func calculateBMI(_ height: Float, _ weight: Float) {
        let bmiValue = weight / pow(height, 2)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: lightBlueColor)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: lightGreenColor)
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: lightRedColor)
        }
    }
    
    func getBMIValue() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "Something went wrong"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? .black
    }
}
