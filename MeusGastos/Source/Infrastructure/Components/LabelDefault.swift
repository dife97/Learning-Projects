//
//  LabelDefault.swift
//  MeusGastos
//
//  Created by Diego Ferreira on 25/07/22.
//

import UIKit

class LabelDefault: UILabel {
    init(text: String) {
        super.init(frame: .zero)
        
        initDefault(text: text, font: UIFont.systemFont(ofSize: 17, weight: .regular))
    }
    
    init(text: String, font: UIFont) {
        super.init(frame: .zero)
        
        initDefault(text: text, font: font)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault(text: String, font: UIFont) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = font
        self.text = text
    }
}
