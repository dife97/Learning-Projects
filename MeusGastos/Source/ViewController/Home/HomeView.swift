//
//  HomeView.swift
//  MeusGastos
//
//  Created by Diego Ferreira on 25/07/22.
//

import UIKit

class HomeView: UIView {
    
    //MARK: - Properties
    let width: CGFloat = UIScreen.main.bounds.width - 36
    
    //MARK: - UI
    lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Esta Semana", "Este Mês", "Todos"])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 1
        segmentedControl.backgroundColor = .lightGray
        
        return segmentedControl
    }()
    
    lazy var inputsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        
        return view
    }()
    
    lazy var outputsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        
        return view
    }()
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configs
    private func configureUI() {
        configureSegmentedControl()
        configureInputView()
        configureOutputView()
    }
    
    private func configureSegmentedControl() {
        addSubview(segmentedControl)
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            segmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            segmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
    }
    
    private func configureInputView() {
        addSubview(inputsView)
        
        NSLayoutConstraint.activate([
            inputsView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 16),
            inputsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            inputsView.widthAnchor.constraint(equalToConstant: width / 2),
            inputsView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func configureOutputView() {
        addSubview(outputsView)
        
        NSLayoutConstraint.activate([
            outputsView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 16),
            outputsView.leadingAnchor.constraint(equalTo: inputsView.trailingAnchor, constant: 12),
            outputsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            outputsView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
}
