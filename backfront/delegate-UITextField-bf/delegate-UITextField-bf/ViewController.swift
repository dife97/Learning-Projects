//
//  ViewController.swift
//  delegate-UITextField-bf
//
//  Created by Diego Personal on 21/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var confirmationLabel: UILabel!
    
    
    //MARK: - INITIALIZERS
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTextFields()
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        register()
    }
    
    //MARK: - PRIVATE METHODS
    private func configureTextFields() {
        confirmationLabel.isHidden = true
        
        registerButton.isEnabled = false
        registerButton.backgroundColor = .gray
        
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func isAllTextFieldsFilled() -> Bool {
        nameTextField.text != "" && emailTextField.text != "" && passwordTextField.text != "" ? true : false
    }
    
    private func register() {
        if isAllTextFieldsFilled() {
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
        if let isEmpty = textField.text?.isEmpty {
            if isEmpty {
                textField.layer.borderColor = UIColor.red.cgColor
                textField.layer.borderWidth = 2
            } else {
                textField.layer.borderColor = UIColor.lightGray.cgColor
                textField.layer.borderWidth = 0
            }
        }
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if isAllTextFieldsFilled() {
            registerButton.isEnabled = true
            registerButton.backgroundColor = .red
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        register()
        return true
    }
    
    // didChangeSelection
}

