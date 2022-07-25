//
//  ViewControllerDefault.swift
//  MeusGastos
//
//  Created by Diego Ferreira on 25/07/22.
//

import UIKit

class ViewControllerDefault: UIViewController {
    
    var afterHideKeyboard: (() -> Void)?
    var afterShowKeyboard: ((_ heightKeyboard: CGFloat) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let _: NSObjectProtocol = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { notification in
            
            guard let value = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
            
            self.afterShowKeyboard?(value.cgRectValue.height)
        }
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc
    func hideKeyboard() {
        self.view.endEditing(true)
        afterHideKeyboard?()
    }
}
