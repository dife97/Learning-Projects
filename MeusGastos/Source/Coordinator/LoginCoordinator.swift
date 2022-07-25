//
//  LoginCoordinator.swift
//  MeusGastos
//
//  Created by Diego Ferreira on 22/06/22.
//

import UIKit

class LoginCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = LoginViewController()
        
        viewController.onRegisterTap = {
            self.showRegister()
        }
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    private func showRegister() {
        let coordinator = RegisterCoordinator(navigationController: self.navigationController)
        coordinator.start()
    }
}
