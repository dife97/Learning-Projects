//
//  ButtonMaker.swift
//  Testing-UINavigationControllers
//
//  Created by Diego Ferreira on 30/06/22.
//

import UIKit

public func makeButton(withTitle title: String) -> UIButton {
    let button = UIButton(type: .system)
    
    button.translatesAutoresizingMaskIntoConstraints = false
    button.configuration = .plain()
    button.setTitle(title, for: [])
    
    return button
}
