//
//  MyBMIViewController.swift
//  BMI Calculator
//
//  Created by Diego Personal on 03/07/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

class MyBMIViewController: UIViewController {
    
    //MARK: - UI
    lazy var stackview: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.spacing = 20
        
        return stackview
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.text = "Welcome"
        
        return label
    }()
    
    //MARK: - INITIALIZERS
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    //MARK: - PRIVATE FUNCTIONS
    private func setup() {
        view.backgroundColor = .systemYellow
        setupHierarchy()
        setupConstraints()
    }
    
    private func setupHierarchy() {
        stackview.addArrangedSubview(label)
        view.addSubview(stackview)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackview.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
