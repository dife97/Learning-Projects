//
//  ViewB.swift
//  NavigationAndDelegate
//
//  Created by Diego Personal on 27/06/22.
//

import UIKit

class ViewB: UIViewController {
    
    let stackview = UIStackView()
    let leftCircleButton = UIButton(type: .system)
    let rightCircleButton = UIButton(type: .system)
    let dismissButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
}

extension ViewB {
    func style() {
        title = "View Controller B"
        
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .horizontal
        stackview.spacing = 40
        
        leftCircleButton.translatesAutoresizingMaskIntoConstraints = false
        leftCircleButton.configuration = .filled()
        leftCircleButton.backgroundColor = .tintColor
        leftCircleButton.layer.borderColor = UIColor.white.cgColor
        leftCircleButton.layer.borderWidth = 1
        leftCircleButton.layer.cornerRadius = leftCircleButton.frame.width / 2
        leftCircleButton.setTitle("leftCircle", for: [])
        leftCircleButton.titleLabel?.isHidden = true
        leftCircleButton.addTarget(self, action: #selector(circleButtonPressed), for: .primaryActionTriggered)
        
        rightCircleButton.translatesAutoresizingMaskIntoConstraints = false
        rightCircleButton.configuration = .filled()
        rightCircleButton.backgroundColor = .systemBrown
        rightCircleButton.layer.borderColor = UIColor.white.cgColor
        rightCircleButton.layer.borderWidth = 1
        rightCircleButton.layer.cornerRadius = rightCircleButton.frame.width / 2
        rightCircleButton.setTitle("rightCircle", for: [])
        rightCircleButton.titleLabel?.isHidden = true
        rightCircleButton.addTarget(self, action: #selector(circleButtonPressed), for: .primaryActionTriggered)
        
        rightCircleButton.translatesAutoresizingMaskIntoConstraints = false
        rightCircleButton.setTitle("Dismiss", for: [])
        rightCircleButton.addTarget(self, action: #selector(dismissPressed), for: .primaryActionTriggered)
    }
    
    func layout() {
        // navigationItem.hidesBackButton = true
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.barTintColor = .white
        
        view.addSubview(dismissButton)
        
        stackview.addArrangedSubview(leftCircleButton)
        stackview.addArrangedSubview(rightCircleButton)
        view.addSubview(stackview)
        
        // StackView
        NSLayoutConstraint.activate([
            stackview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackview.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    
        // Circle Buttons
        NSLayoutConstraint.activate([
            leftCircleButton.heightAnchor.constraint(equalToConstant: 100),
            leftCircleButton.widthAnchor.constraint(equalToConstant: 100),
            leftCircleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80),
            
            rightCircleButton.heightAnchor.constraint(equalToConstant: 100),
            rightCircleButton.widthAnchor.constraint(equalToConstant: 100),
            rightCircleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80)
        ])
        
        // Dismiss
        NSLayoutConstraint.activate([
            dismissButton.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: dismissButton.trailingAnchor, multiplier: 2)
        ])
    }
    
    @objc func circleButtonPressed(_ sender: UIButton) {
        guard let selectedCircle = sender.titleLabel?.text else { return }
        
        if selectedCircle == "leftCircle" {
            self.view.backgroundColor = .systemMint
        } else {
            self.view.backgroundColor = .systemBrown
        }
    }
    
    @objc func dismissPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
}
