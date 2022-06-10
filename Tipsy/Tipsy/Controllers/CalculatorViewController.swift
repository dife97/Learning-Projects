//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    var tip: Double = 0
    var peopleToSplit: Int = 0
    var result: Double = 0
    var resultString: String = "0"
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        guard let selectedTip = sender.currentTitle else { return }
        
        switch selectedTip {
        case "0%":
            tip = 0.0
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        case "10%":
            tip = 0.1
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
        case "20%":
            tip = 0.2
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
        default:
            return
        }
        
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        peopleToSplit = Int(sender.value)
        splitNumberLabel.text = String(peopleToSplit)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        guard let billTextField = billTextField.text else { return }
        let totalTip = Double(billTextField)! * tip
        let totalBill = Double(billTextField)! + totalTip
        
        result = totalBill / Double(peopleToSplit)
        resultString = String(format: "%.2f", result)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.total = resultString
            destinationVC.people = splitNumberLabel.text
            destinationVC.selectedTip = String(tip)
        }
    }
}
