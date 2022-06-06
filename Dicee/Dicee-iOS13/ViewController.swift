//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
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

