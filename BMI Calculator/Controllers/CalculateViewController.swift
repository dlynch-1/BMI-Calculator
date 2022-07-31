//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    var bmiValue = "0.0"
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func weightSliderChange(_ sender: UISlider) {
        weightLabel.text = String(Int(sender.value)) + "Kg"
    }
    @IBAction func heightSliderChange(_ sender: UISlider) {
        heightLabel.text = String(format: "%.2f",sender.value) + "m"
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
//        let BMI = Float(weight) / pow(Float(height),Float(2))
        let bmi = weight / pow(height,2)
        bmiValue = String(format: "%.1f", bmi)
        
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = bmiValue
//            print("bmiValue is: " + bmiValue)
        }
        // Pass the selected object to the new view controller.
    }
    
}

