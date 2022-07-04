//
//  Button.swift
//  BMI Calculator
//
//  Created by Diego Personal on 03/07/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

public func createButton(titleText: String, titleColor: UIColor, buttonColor: UIColor) -> UIButton {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle(titleText, for: .normal)
    button.setTitleColor(titleColor, for: .normal)
    button.backgroundColor = buttonColor
    
    return button
}
