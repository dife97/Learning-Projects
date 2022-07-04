//
//  CalculatorView.swift
//  BMI Calculator
//
//  Created by Diego Personal on 03/07/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

class CalculatorView: UIView {
    
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
        label.text = "Sliders"
        
        return label
    }()
    
    
    //MARK: - INITIALIZERS
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
}

extension CalculatorView {
    private func setup() {
        backgroundColor = .systemOrange
        
        setupHierarchy()
        setupConstraints()
    }
    
    private func setupHierarchy() {
        translatesAutoresizingMaskIntoConstraints = false
        
        stackview.addArrangedSubview(label)
        addSubview(stackview)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackview.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackview.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
