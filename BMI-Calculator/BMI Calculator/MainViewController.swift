//
//  MainViewController.swift
//  BMI Calculator
//
//  Created by Diego Personal on 03/07/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
        setupTabBar()
    }
    
    private func setupViewControllers() {
        let calculator = CalculatorViewController()
        let myBMI = MyBMIViewController()
        let calculatorNC = UINavigationController(rootViewController: calculator)
        
        calculator.tabBarItem = UITabBarItem(title: "Calculator",
                                             image: UIImage(named: "calculator"),
                                             selectedImage: UIImage(named: "calculator-selected"))
        calculator.tabBarItem.tag = 0
        
        myBMI.tabBarItem = UITabBarItem(title: "My BMI",
                                        image: UIImage(named: "saved"),
                                        selectedImage: UIImage(named: "saved-selected"))
        myBMI.tabBarItem.tag = 1
        
        viewControllers = [calculatorNC, myBMI]
    }
    
    private func setupTabBar() {
        tabBar.isTranslucent = false
        tabBar.backgroundColor = .white
        tabBar.tintColor = UIColor(named: "MainPurple")
        tabBar.layer.borderWidth = 2
        tabBar.layer.borderColor = UIColor(named: "MainPurple")?.cgColor
        tabBar.layer.borderColor = tabBar.layer.borderColor?.copy(alpha: 0.2)
    }
}
