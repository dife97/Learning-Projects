//
//  ViewController.swift
//  IAmPoor
//
//  Created by Diego Personal on 05/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    let diceArray = ["DiceOne", "DiceTwo", "DiceThree", "DiceFour", "DiceFive", "DiceSix"]
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        if let randomDice1 = diceArray.randomElement(),
           let randomDice2 = diceArray.randomElement() {
            diceImageView1.image = UIImage(named: randomDice1)
            diceImageView2.image = UIImage(named: randomDice2)
        }
    }
}

