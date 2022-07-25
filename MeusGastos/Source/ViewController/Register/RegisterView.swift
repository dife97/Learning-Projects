//
//  RegisterView.swift
//  MeusGastos
//
//  Created by Diego Ferreira on 25/07/22.
//

import UIKit

class RegisterView: UIView {
    
    //MARK: - Properties
    var onLoginTap: (() -> Void)?
    
    //MARK: - UI
    let titleLabel = LabelDefault(text: "Cadastro de Usuário", font: UIFont.systemFont(ofSize: 25, weight: .semibold))
    let emailLabel = LabelDefault(text: "E-mail")
    let emailTextField = TextFieldDefault(placeholder: "E-mail para o cadastro", keyboardType: .emailAddress)
    let passwordLabel = LabelDefault(text: "Senha")
    let passwordTextField = TextFieldDefault(placeholder: "Sua senha para o cadastro", isSecureTextEntry: true)
    let registerButton = ButtonDefault(title: "Registrar Usuário")
    let loginButton = ButtonDefault(title: "Logar")
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configs
    private func configureUI() {
        configureTitle()
        configureEmail()
        configurePassword()
        configureRegisterButton()
        configureLoginButton()
    }
    
    private func configureTitle() {
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
    }
    
    private func configureEmail() {
        addSubview(emailLabel)
        addSubview(emailTextField)
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            emailLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            emailLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 12),
            emailTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func configurePassword() {
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30),
            passwordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            passwordLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 12),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordLabel.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func configureRegisterButton() {
        addSubview(registerButton)
        
//        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            registerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            registerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            registerButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func configureLoginButton() {
        addSubview(loginButton)
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 30),
            loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            loginButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func loginButtonTapped() {
        self.onLoginTap?()
    }
    
//    @objc func registerButtonTapped() {
////        self.onLoginTap?()
//    }
}
