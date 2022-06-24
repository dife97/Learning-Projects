//
//  LoginCoordinator.swift
//  MeusGastos
//
//  Created by Diego Personal on 23/06/22.
//

import UIKit

class LoginCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginViewController = LoginViewController()
        self.navigationController.pushViewController(loginViewController, animated: true)
    }
}
