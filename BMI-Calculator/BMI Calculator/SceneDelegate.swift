//
//  SceneDelegate.swift
//  BMI Calculator
//
//  Created by Diego Personal on 09/06/22.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = createMainVC()
    }
    
    private func createMainVC() -> UITabBarController {
        let mainViewController = MainViewController()
        return mainViewController
    }
}

