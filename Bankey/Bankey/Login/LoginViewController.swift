//
//  ViewController.swift
//  Bankey
//
//  Created by Diego Ferreira on 24/06/22.
//

import UIKit

protocol LogoutDelegate: AnyObject {
    func didLogout()
}

protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
}

class LoginViewController: UIViewController {
    
    let bankeyTitleLabel = UILabel()
    let bankeyDescriptionLabel = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    weak var delegate: LoginViewControllerDelegate?
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        signInButton.configuration?.showsActivityIndicator = false
    }
}

extension LoginViewController {
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        bankeyTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        bankeyTitleLabel.textAlignment = .center
        bankeyTitleLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        bankeyTitleLabel.adjustsFontForContentSizeCategory = true
        bankeyTitleLabel.text = "Bankey"
        
        bankeyDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        bankeyDescriptionLabel.textAlignment = .center
        bankeyDescriptionLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        bankeyDescriptionLabel.adjustsFontForContentSizeCategory = true
        bankeyDescriptionLabel.numberOfLines = 0
        bankeyDescriptionLabel.text = "Your premium source for all things banking!"
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped(_:)), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
    }
    
    private func layout() {
        view.addSubview(bankeyTitleLabel)
        view.addSubview(bankeyDescriptionLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        
        // Bankey Title and Description Labels
        NSLayoutConstraint.activate([
            bankeyTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bankeyDescriptionLabel.topAnchor.constraint(equalToSystemSpacingBelow: bankeyTitleLabel.bottomAnchor, multiplier: 3),
            
            bankeyDescriptionLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            bankeyDescriptionLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: bankeyDescriptionLabel.bottomAnchor, multiplier: 3)
        ])
        
        // Login
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
        ])
        
        // Button
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        // Error Label Message
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
    }
}

//MARK: - Actions
extension LoginViewController {
    @objc func signInTapped(_ sender: UIButton) {
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Username / password should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username / password cannot be blank")
            return
        }
        
        if username == "Diego" && password == "lindo" {
            signInButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
        } else {
            configureView(withMessage: "Incorrect username / password")
        }
    }
    
    private func configureView(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}
