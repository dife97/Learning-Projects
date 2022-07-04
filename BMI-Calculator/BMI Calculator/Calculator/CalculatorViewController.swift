//
//  CalculatorViewController.swift
//  BMI Calculator
//
//  Created by Diego Personal on 03/07/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    //MARK: - UI
    lazy var calculatorView: UIView = {
        let view = CalculatorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var calculateButton: UIButton = {
        let button = createButton(titleText: "CALCULATE",
                                  titleColor: UIColor.white,
                                  buttonColor: UIColor(named: "MainPurple") ?? UIColor.black)
        button.addTarget(self, action: #selector(calculateTapped), for: .touchUpInside)
        
        return button
    }()
    
    
    //MARK: - INITIALIZERS
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    //MARK: - PRIVATE FUNCTIONS
    private func setup() {
        view.backgroundColor = .white
        
        setupHierarchy()
        setupConstraints()
    }
    
    private func setupHierarchy() {
        view.addSubview(calculatorView)
        view.addSubview(calculateButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // View
            calculateButton.topAnchor.constraint(equalToSystemSpacingBelow: calculatorView.bottomAnchor, multiplier: 2),
            calculatorView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: calculatorView.trailingAnchor, multiplier: 2),
            
            // Calculate Button
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: calculateButton.bottomAnchor, multiplier: 2),
            calculateButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: calculateButton.trailingAnchor, multiplier: 2),
            calculateButton.heightAnchor.constraint(equalToConstant: 51)
        ])
    }
}

//MARK: - ACTIONS
extension CalculatorViewController {
    @objc private func calculateTapped(_ sender: UIButton) {
        present(ResultViewController(), animated: true)
    }
    
    private func calculateBMI() {
        print("BMI Calculated")
    }
}
