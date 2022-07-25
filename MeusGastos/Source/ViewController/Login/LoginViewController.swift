//
//  LoginViewController.swift
//  MeusGastos
//
//  Created by Diego Ferreira on 22/06/22.
//

import UIKit

class LoginViewController: ViewControllerDefault {
    
    var onRegisterTap: (() -> Void)?
    var onLoginTap: (() -> Void)?
    
    lazy var loginView: LoginView = {
        let view = LoginView()
        view.backgroundColor = .systemBackground
        
        view.onLoginTap = {
            self.onLoginTap?()
        }
        
        view.onRegisterTap = {
            self.onRegisterTap?()
        }
        
        return view
    }()
    
    override func loadView() {
        self.view = loginView
    }
}
