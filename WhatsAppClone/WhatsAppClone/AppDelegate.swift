//
//  AppDelegate.swift
//  WhatsAppClone
//
//  Created by Diego Ferreira on 19/07/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = createTabBarController()
        window?.makeKeyAndVisible()
        
        return true
    }
    
    private func createTabBarController() -> UITabBarController {
        let tabbar = UITabBarController()
        tabbar.tabBar.layer.borderWidth = 2
        tabbar.tabBar.layer.borderColor = UIColor.systemGray5.cgColor
        tabbar.tabBar.clipsToBounds = true
        tabbar.viewControllers = [createStatusNC(),
                                  createDummyNC(title: "Calls", image: "phone", tag: 1),
                                  createDummyNC(title: "Camera", image: "camera", tag: 2),
                                  createDummyNC(title: "Chats", image: "message", tag: 3),
                                  createSettingsNC()]
        return tabbar
    }
    
    private func createStatusNC() -> UINavigationController {
        let statusViewController = StatusViewController()
        statusViewController.title = "Status"
        statusViewController.tabBarItem = UITabBarItem(title: "Status", image: UIImage(systemName: "circle.dashed"), tag: 0)
        
        return UINavigationController(rootViewController: statusViewController)
    }
    
    private func createSettingsNC() -> UINavigationController {
        let settingsViewController = SettingsViewController()
        settingsViewController.title = "Settings"
        settingsViewController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 5)
        
        return UINavigationController(rootViewController: settingsViewController)
    }
    
    private func createDummyNC(title: String, image: String, tag: Int) -> UINavigationController {
        let dummyViewController = DummyViewController()
        dummyViewController.title = title
        dummyViewController.tabBarItem = UITabBarItem(title: title, image: UIImage(systemName: image), tag: tag)
        
        return UINavigationController(rootViewController: dummyViewController)
    }
}

