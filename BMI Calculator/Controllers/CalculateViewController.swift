//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    var bmiModel: BMI?
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let heightString = String(format: "%.2f", sender.value)
        heightLabel.text = "\(heightString)m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weightString = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weightString)kg"
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let weight = weightSlider.value
        let height = heightSlider.value
        calculatorBrain.calculateBmi(weight: weight, height: height)
//        bmiModel = calculatorBrain.getBmi()
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVS = segue.destination as! ResultViewController
            destinationVS.bmiModel = calculatorBrain.getBmi()
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}

