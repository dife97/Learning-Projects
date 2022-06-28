//
//  ViewA.swift
//  NavigationAndDelegate
//
//  Created by Diego Personal on 27/06/22.
//

import UIKit

class ViewA: UIViewController {
    
    let stackview = UIStackView()
    let showB = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
}

extension ViewA {
    func style() {
        title = "View Controller A"
        
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.spacing = 20
        
        showB.translatesAutoresizingMaskIntoConstraints = false
        showB.setTitle("Show B ViewController", for: [])
        showB.addTarget(self, action: #selector(showBPressed), for: .primaryActionTriggered)
        
        navigationController?.title = "View Controller A"
    }
    
    func layout() {
        view.backgroundColor = .systemBackground
        
        stackview.addArrangedSubview(showB)
        
        view.addSubview(stackview)
        
        NSLayoutConstraint.activate([
            stackview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackview.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func showBPressed(_ sender: UIButton) {
        let viewB = ViewB()
        
        viewB.modalPresentationStyle = .fullScreen
        
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.present(viewB, animated: true, completion: nil)
    }
}
