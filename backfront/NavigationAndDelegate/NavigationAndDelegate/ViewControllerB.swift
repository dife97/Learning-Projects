//
//  ViewControllerB.swift
//  NavigationAndDelegate
//
//  Created by Diego Personal on 23/06/22.
//

import UIKit

class ViewControllerB: UIViewController {

    //MARK: - OUTLETS
    @IBOutlet weak var leftCircleButton: UIButton!
    @IBOutlet weak var rightCircleButton: UIButton!
    
    //MARK: - INITIALIZERS
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCircleButtons()
        navigationItem.hidesBackButton = true
    }
    
    //MARK: - PRIVATE METHODS
    private func setUpCircleButtons() {
        leftCircleButton.layer.borderColor = UIColor.white.cgColor
        leftCircleButton.layer.borderWidth = 1
        rightCircleButton.layer.borderColor = UIColor.white.cgColor
        rightCircleButton.layer.borderWidth = 1
        
        leftCircleButton.layer.cornerRadius = leftCircleButton.frame.width / 2
        rightCircleButton.layer.cornerRadius = rightCircleButton.frame.width / 2
        
        leftCircleButton.titleLabel?.isHidden = true
        rightCircleButton.titleLabel?.isHidden = true
    }
    
    //MARK: - ACTIONS
    @IBAction func circlePressed(_ sender: UIButton) {
        guard let selectedCircle = sender.titleLabel?.text else { return }
        
        if selectedCircle == "leftCircle" {
            self.view.backgroundColor = .systemMint
        } else {
            self.view.backgroundColor = .systemBrown
        }
    }
    
    @IBAction func dismissPressed(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
}
