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
    
    var leadingEdgeOnScreen: CGFloat = 16
    var leadingEdgeOffScreen: CGFloat = -1000
    
    var bankeyTitleLeadingAnchor: NSLayoutConstraint?
    var bankeyDescriptionLeadingAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        signInButton.configuration?.showsActivityIndicator = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
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
        bankeyTitleLabel.alpha = 0
        
        bankeyDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        bankeyDescriptionLabel.textAlignment = .center
        bankeyDescriptionLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        bankeyDescriptionLabel.adjustsFontForContentSizeCategory = true
        bankeyDescriptionLabel.numberOfLines = 0
        bankeyDescriptionLabel.text = "Your premium source for all things banking!"
        bankeyDescriptionLabel.alpha = 0
        
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
        
        
        // Title
        NSLayoutConstraint.activate([
            bankeyDescriptionLabel.topAnchor.constraint(equalToSystemSpacingBelow: bankeyTitleLabel.bottomAnchor, multiplier: 3),
            bankeyTitleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
        
        bankeyTitleLeadingAnchor = bankeyTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingEdgeOffScreen)
        bankeyTitleLeadingAnchor?.isActive = true

        
        // Description
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: bankeyDescriptionLabel.bottomAnchor, multiplier: 3),
            bankeyDescriptionLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
        
        bankeyDescriptionLeadingAnchor = bankeyDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingEdgeOffScreen)
        bankeyDescriptionLeadingAnchor?.isActive = true
        
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
  
//        temporaily turned off while building the app
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username or password cannot be blank")
            return
        }
        
        if username == "Diego" && password == "lindo" {
            signInButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
        } else {
            configureView(withMessage: "Incorrect username or password")
        }
    }
    
    private func configureView(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
        shakeButton()
    }
    
    private func shakeButton() {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [0, 10, -10, 10, 0]
        animation.keyTimes = [0, 0.16, 0.5, 0.83, 1]
        animation.duration = 0.4
        
        animation.isAdditive = true
        signInButton.layer.add(animation, forKey: "shake")
    }
}

//MARK: - Animations
extension LoginViewController {
    private func animate() {
        let duration = 0.8
        
        let animator1 = UIViewPropertyAnimator(duration: duration, curve: .easeOut) {
            self.bankeyTitleLeadingAnchor?.constant = self.leadingEdgeOnScreen
//            self.bankeyDescriptionLeadingAnchor?.constant = self.leadingEdgeOnScreen
            self.view.layoutIfNeeded()
        }
        animator1.startAnimation()
        
        let animator2 = UIViewPropertyAnimator(duration: duration, curve: .easeOut) {
            self.bankeyDescriptionLeadingAnchor?.constant = self.leadingEdgeOnScreen
            self.view.layoutIfNeeded()
        }
        animator2.startAnimation(afterDelay: 0.2)
        
        let animator3 = UIViewPropertyAnimator(duration: duration * 2, curve: .easeOut) {
            self.bankeyTitleLabel.alpha = 1
            self.bankeyDescriptionLabel.alpha = 1
            self.view.layoutIfNeeded()
        }
        animator3.startAnimation(afterDelay: 0.2)
    }
}
