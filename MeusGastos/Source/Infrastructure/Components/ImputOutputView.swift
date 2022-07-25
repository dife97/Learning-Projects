//
//  ImputOutputView.swift
//  MeusGastos
//
//  Created by Diego Ferreira on 25/07/22.
//

import UIKit

enum TypeEntry {
    case input
    case output
}

class ImputOutputView: UIView {
    
    var typeEntry: TypeEntry
    
    //MARK: - UI
    lazy var icon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "")
        imageView.tintColor = .iconDarkGrey
        
        return imageView
    }()
    
    lazy var valueLabel = LabelDefault(text: "", font: UIFont.systemFont(ofSize: 25, weight: .bold))
    lazy var subtitleLabel = LabelDefault(text: "", font: UIFont.systemFont(ofSize: 14, weight: .light))
    
    //MARK: - Initializers
    init(typeEntry: TypeEntry) {
        self.typeEntry = typeEntry
        
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setValue(value: Double) {
        valueLabel.text = "R$ \(value)"
    }
    
    private func configureUI() {
        configureTypeEntry()
        configureIcon()
        configureValueLabel()
        configureSubtitleLabel()
    }
    
    private func configureTypeEntry() {
        switch typeEntry {
        case .input:
            icon.image = UIImage(systemName: "arrow.up.circle.fill")
            subtitleLabel.text = "Entradas do Mês"
            self.backgroundColor = .inputBlue
        case .output:
            icon.image = UIImage(systemName: "arrow.down.circle.fill")?.withTintColor(.darkGray)
            subtitleLabel.text = "Saídas do Mês"
            self.backgroundColor = .outputRed
        }
    }
    
    private func configureIcon() {
        addSubview(icon)
        
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            icon.widthAnchor.constraint(equalToConstant: 24),
            icon.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    private func configureValueLabel() {
        addSubview(valueLabel)
        
        valueLabel.textAlignment = .center
        valueLabel.text = "R$ 1.150.000,00"
        valueLabel.adjustsFontSizeToFitWidth = true
        valueLabel.minimumScaleFactor = 0.5
        
        NSLayoutConstraint.activate([
            valueLabel.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 20),
            valueLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
    }
    
    private func configureSubtitleLabel() {
        addSubview(subtitleLabel)
        
        subtitleLabel.textAlignment = .center
        subtitleLabel.adjustsFontSizeToFitWidth = true
        subtitleLabel.minimumScaleFactor = 0.5
        
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 4),
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
    }
}
