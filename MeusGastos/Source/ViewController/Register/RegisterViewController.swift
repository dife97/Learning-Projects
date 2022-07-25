//
//  RegisterViewController.swift
//  MeusGastos
//
//  Created by Diego Ferreira on 25/07/22.
//

import UIKit

class RegisterViewController: ViewControllerDefault {
    
    //MARK: - Properties
    var onLoginTap: (() -> Void)?
    
    //MARK: - UI
    lazy var registerView: RegisterView = {
        let view = RegisterView()
        view.backgroundColor = .systemBackground
        
        view.onLoginTap = {
            self.onLoginTap?()
        }
        
        return view
    }()
    
    override func loadView() {
        self.view = registerView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}

