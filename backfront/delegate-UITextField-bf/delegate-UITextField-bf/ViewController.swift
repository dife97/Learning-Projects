//
//  ViewController.swift
//  delegate-UITextField-bf
//
//  Created by Diego Personal on 21/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet weak var cadastrarButton: UIButton!
    @IBOutlet weak var confirmationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confirmationLabel.isHidden = true
        
        cadastrarButton.isEnabled = false
        cadastrarButton.backgroundColor = .gray
        
        nomeTextField.delegate = self
        emailTextField.delegate = self
        senhaTextField.delegate = self
    }
    
    @IBAction func cadastrarButtonPressed(_ sender: Any) {
        register()
    }
    
    private func register() {
        if nomeTextField.text != "" && emailTextField.text != "" && senhaTextField.text != "" {
            confirmationLabel.isHidden = false
            print("Cadastro realizado com sucesso")
        }
    }
}

//MARK: - UITextFieldDelegates
extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.blue.cgColor
        textField.layer.borderWidth = 2
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == "" {
            textField.layer.borderColor = UIColor.red.cgColor
            textField.layer.borderWidth = 2
        } else {
            textField.layer.borderColor = UIColor.gray.cgColor
            textField.layer.borderWidth = 0
        }
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if nomeTextField.text != "" && emailTextField.text != "" && senhaTextField.text != "" {
            cadastrarButton.isEnabled = true
            cadastrarButton.backgroundColor = .red
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        register()
        
        return true
    }
}

