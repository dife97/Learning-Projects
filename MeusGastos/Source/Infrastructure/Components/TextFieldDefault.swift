//
//  TextFieldDefault.swift
//  MeusGastos
//
//  Created by Diego Ferreira on 25/07/22.
//

import UIKit

class TextFieldDefault: UITextField {
    
    //MARK: - Properties
    let padding = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    
    //MARK: - Initializers
    /// default keyboard type
    init(placeholder: String, keyboardType: UIKeyboardType = .default) {
        super.init(frame: .zero)
        
        initDefault(placeholder: placeholder)
        self.keyboardType = keyboardType
    }
    
    /// default passwords security
    init(placeholder: String, isSecureTextEntry: Bool) {
        super.init(frame: .zero)
        
        initDefault(placeholder: placeholder)
        self.isSecureTextEntry = isSecureTextEntry
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault(placeholder: String) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
        self.placeholder = placeholder
    }
    
    //MARK: - Add Padding in Textfields
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
