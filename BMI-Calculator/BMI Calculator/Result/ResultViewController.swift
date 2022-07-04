//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Diego Personal on 03/07/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    //MARK: - PROPERTIES
    var result: String?

    
    //MARK: - UI
    lazy var calculatorView: UIView = {
        let view = ResultView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var recalculateButton: UIButton = {
        let button = createButton(titleText: "RECALCULATE",
                                  titleColor: UIColor(named: "MainPurple") ?? UIColor.black,
                                  buttonColor: UIColor.white)
        button.addTarget(self, action: #selector(recalculateTapped), for: .touchUpInside)
        
        return button
    }()
    
    
    //MARK: - INITIALIZERS
    init(result: String) {
        super.init(nibName: nil, bundle: nil)
        self.result = result
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        makeResult()
    }
    
    //MARK: - PRIVATE FUNCTIONS
    private func setup() {
        view.backgroundColor = UIColor(named: "MainPurple")
        
        setupHierarchy()
        setupConstraints()
    }
    
    private func setupHierarchy() {
        view.addSubview(calculatorView)
        view.addSubview(recalculateButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            // Result
            calculatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            calculatorView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: calculatorView.trailingAnchor, multiplier: 2),
            
            // Recalculate Button
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: recalculateButton.bottomAnchor, multiplier: 2),
            recalculateButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: recalculateButton.trailingAnchor, multiplier: 2),
            recalculateButton.heightAnchor.constraint(equalToConstant: 51)
        ])
    }
    
    private func makeResult() {
        
    }
}

//MARK: - ACTIONS
extension ResultViewController {
    @objc private func recalculateTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
