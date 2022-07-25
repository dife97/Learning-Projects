//
//  HomeViewController.swift
//  MeusGastos
//
//  Created by Diego Ferreira on 25/07/22.
//

import UIKit

class HomeViewController: ViewControllerDefault {
    
    private lazy var homeView: HomeView = {
        let view = HomeView()
        view.backgroundColor = .systemBackground
        
        return view
    }()
    
    override func loadView() {
        self.view = homeView
        
        self.title = ""
    }
}
