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
}

extension MainViewController {
    private func setupViewControllers() {
        let calculator = VC1()
        let myBMI = VC2()
        
        calculator.tabBarItem = UITabBarItem(title: "Calculator", image: UIImage(named: "calculator"), selectedImage: UIImage(named: "calculator-selected"))
        calculator.tabBarItem.tag = 1
        myBMI.tabBarItem = UITabBarItem(title: "My BMI", image: UIImage(named: "saved"), selectedImage: UIImage(named: "saved-selected"))
        myBMI.tabBarItem.tag = 2
        
        let nc1 = UINavigationController(rootViewController: calculator)
        let nc2 = UINavigationController(rootViewController: myBMI)
        
        nc1.navigationBar.tintColor = .blue
        
        viewControllers = [nc1, nc2]
    }
    
    private func setupTabBar() {
        tabBar.isTranslucent = false
        tabBar.backgroundColor = .white
        tabBar.tintColor = UIColor(named: "MainPurple")
        tabBar.layer.borderWidth = 2
        tabBar.layer.borderColor = UIColor.systemGray5.cgColor
    }
}


class VC1: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = UIColor(named: "MainPurple")
    }
}

class VC2: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .white
    }
}
