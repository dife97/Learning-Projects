//
//  ViewController.swift
//  LoginViewCode
//
//  Created by Diego Personal on 08/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    var loginScreen: LoginScreen?
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
    }

    override func viewDidLoad() {
        let bgColor = UIColor(red: 0.22, green: 0.03, blue: 0.36, alpha: 1.00)
        
        super.viewDidLoad()
        self.view.backgroundColor = bgColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}

