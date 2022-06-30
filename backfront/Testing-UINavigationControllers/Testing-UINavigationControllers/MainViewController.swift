//
//  ViewController.swift
//  Testing-UINavigationControllers
//
//  Created by Diego Ferreira on 29/06/22.
//

import UIKit

class MainViewController: UIViewController {
    
    let stackview = UIStackView()
    let presentFullScreenButton = makeButton(withTitle: "Present Full Screen")
    let presentPageSheetButton = makeButton(withTitle: "Present Page Sheet")
    let presentFormSheetButton = makeButton(withTitle: "Present Form Sheet")
    let presentPopOverButton = makeButton(withTitle: "Present Pop Over")
    let presentblurOverFullScreenButton = makeButton(withTitle: "Present Blur Full Screen")
    let popButton = makeButton(withTitle: "Pop")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
}

extension MainViewController {
    private func style() {
        title = "Main View Controller"
        
        view.backgroundColor = .white
        
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.spacing = 16
        
        presentFullScreenButton.addTarget(self, action: #selector(presentFullScreen), for: .touchUpInside)
    }
    
    private func layout() {
        stackview.addArrangedSubview(presentFullScreenButton)
        stackview.addArrangedSubview(presentPageSheetButton)
        stackview.addArrangedSubview(presentFormSheetButton)
        stackview.addArrangedSubview(presentPopOverButton)
        stackview.addArrangedSubview(presentblurOverFullScreenButton)
        stackview.addArrangedSubview(popButton)
        
        view.addSubview(stackview)
        NSLayoutConstraint.activate([
            stackview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackview.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func presentFullScreen() {
        let navigationPresentFullScreen = UINavigationController(rootViewController: PresentFullScreen())
        navigationPresentFullScreen.modalPresentationStyle = .fullScreen
        self.present(navigationPresentFullScreen, animated: true)
    }
}


//MARK: - Present Full Screen
class PresentFullScreen: UIViewController {
    let mainView = MainView()
    let navigationBar = UINavigationBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        setupGestures()
//        setupNavigationBar()
        
        mainView.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(mainView)
        
        NSLayoutConstraint.activate([
            mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: mainView.trailingAnchor, multiplier: 2),
        ])
    }
    
    private func setup() {
        navigationBar.isTranslucent = true
        navigationBar.title
        navigationItem.title = "Teste"
        
    }
    
//    private func setupNavigationBar() {
//        let appearence = UINavigationBarAppearance()
//        appearence.backgroundColor = UIColor.systemBackground
//        appearence.titleTextAttributes = [.foregroundColor: UIColor.black]
//        navigationController?.navigationBar.scrollEdgeAppearance = appearence
//        title = "Present Full Screen"
//    }
    
    private func setupGestures() {
        mainView.leftCircleView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(changeBackground)))
        mainView.rightCircleView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(changeBackground)))
    }
    
    @objc private func changeBackground(_ tapGesture: UITapGestureRecognizer) {
        view.backgroundColor = tapGesture.view?.backgroundColor
    }
}

// e se dentro da view controller vc instanciar uma UINavigationItem
