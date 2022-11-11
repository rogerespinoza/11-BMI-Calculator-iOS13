//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Roger Espinoza on 8/11/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    
    func getBmi() -> BMI {
        let color = #colorLiteral(red: 0.04732046276, green: 0.9938454032, blue: 0.01150536723, alpha: 1)
        let bmiModel = bmi ?? BMI(value: 0.0, advice: "Eat more pies!", color: color)
        return bmiModel
    }

    mutating func calculateBmi(weight: Float, height: Float) {
        let bmiValue = weight / ( height * height)
        if bmiValue < 18.5 {
            let color = #colorLiteral(red: 0.04732046276, green: 0.9938454032, blue: 0.01150536723, alpha: 1)
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: color )
            return
        }
        if bmiValue < 24.9 {
            let color = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: color )
            return
        }
        let color = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: color )
    }
    
    
}
