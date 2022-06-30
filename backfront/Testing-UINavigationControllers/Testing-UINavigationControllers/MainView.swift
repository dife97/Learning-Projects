//
//  MainView.swift
//  Testing-UINavigationControllers
//
//  Created by Diego Ferreira on 29/06/22.
//

import UIKit

class MainView: UIView {
    
    lazy var leftCircleView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .systemMint
//        view.layer.borderColor = UIColor.white.cgColor
//        view.layer.borderWidth = 1
//        view.layer.cornerRadius = view.frame.width / 2

        return view
    }()
    
    lazy var rightCircleView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .systemBrown
//        view.layer.borderColor = UIColor.white.cgColor
//        view.layer.borderWidth = 1
//        view.layer.cornerRadius = view.frame.width / 2

        return view
    }()

//    let leftCircleView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
}

extension MainView {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        
        // Circles
        leftCircleView.translatesAutoresizingMaskIntoConstraints = false
        leftCircleView.backgroundColor = .systemMint
        leftCircleView.layer.borderColor = UIColor.white.cgColor
        leftCircleView.layer.borderWidth = 1
        leftCircleView.layer.cornerRadius = leftCircleView.frame.size.width / 2
        
        rightCircleView.translatesAutoresizingMaskIntoConstraints = false
        rightCircleView.backgroundColor = .systemBrown
        rightCircleView.layer.borderColor = UIColor.white.cgColor
        rightCircleView.layer.borderWidth = 1
        rightCircleView.layer.cornerRadius = rightCircleView.frame.size.width / 2
    }
    
    private func layout() {
        addSubview(leftCircleView)
        addSubview(rightCircleView)
        
        
        // Circles
        NSLayoutConstraint.activate([
            leftCircleView.heightAnchor.constraint(equalToConstant: 100),
            leftCircleView.widthAnchor.constraint(equalToConstant: 100),
            leftCircleView.centerYAnchor.constraint(equalTo: centerYAnchor),
            leftCircleView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 4),
            
            rightCircleView.heightAnchor.constraint(equalToConstant: 100),
            rightCircleView.widthAnchor.constraint(equalToConstant: 100),
            rightCircleView.centerYAnchor.constraint(equalTo: centerYAnchor),
            trailingAnchor.constraint(equalToSystemSpacingAfter: rightCircleView.trailingAnchor, multiplier: 4)
        ])
    }
}
