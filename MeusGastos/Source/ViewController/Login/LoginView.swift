//
//  LoginVIew.swift
//  MeusGastos
//
//  Created by Diego Ferreira on 25/07/22.
//

import UIKit

class LoginView: UIView {
    
    //MARK: - Properties
    var onRegisterTap: (() -> Void)?
    var onLoginTap: (() -> Void)?
    
    //MARK: - UI
    let titleLabel = LabelDefault(text: "Login", font: UIFont.systemFont(ofSize: 25, weight: .semibold))
    let emailLabel = LabelDefault(text: "E-mail")
    let emailTextField = TextFieldDefault(placeholder: "Informe seu e-mail", keyboardType: .emailAddress)
    let passwordLabel = LabelDefault(text: "Senha")
    let passwordTextField = TextFieldDefault(placeholder: "Informe sua senha", isSecureTextEntry: true)
    let loginButton = ButtonDefault(title: "Login")
    let registerButton = ButtonDefault(title: "Registrar")
    
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
        configureLoginButton()
        configureRegisterButton()
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
    
    private func configureLoginButton() {
        addSubview(loginButton)
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            loginButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func configureRegisterButton() {
        addSubview(registerButton)
        
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 30),
            registerButton.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor),
            registerButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func loginButtonTapped() {
        self.onLoginTap?()
    }
    
    @objc func registerButtonTapped() {
        self.onRegisterTap?()
    }
}
