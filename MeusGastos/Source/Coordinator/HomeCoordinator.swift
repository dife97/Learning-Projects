//
//  HomeCoordinator.swift
//  MeusGastos
//
//  Created by Diego Ferreira on 25/07/22.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = HomeViewController()
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
