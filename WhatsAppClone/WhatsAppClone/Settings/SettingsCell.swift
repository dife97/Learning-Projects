//
//  SettingsCell.swift
//  WhatsAppClone
//
//  Created by Diego Ferreira on 19/07/22.
//

import UIKit

class SettingsCell: UITableViewCell {
    
    static let identifier = "SettingsCell"
    
    var imageName: String?
    var labelName: String?

    lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "star.square")
        // image.image = UIImage(systemName: imageName ?? "cloud")
        image.heightAnchor.constraint(equalToConstant: 25).isActive = true
        image.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        return image
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.text = "Label" // labelName
                
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.accessoryType = .disclosureIndicator
        
        configureImage()
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureImage() {
        contentView.addSubview(image)
        
        NSLayoutConstraint.activate([
            image.centerYAnchor.constraint(equalTo: centerYAnchor),
            image.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            image.widthAnchor.constraint(equalToConstant: 40),
            image.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func configureLabel() {
        contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: image.centerYAnchor),
            label.leadingAnchor.constraint(equalToSystemSpacingAfter: image.trailingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: label.trailingAnchor, multiplier: 2)
        ])
    }
    
    func setupCell(image: String, label: String) {
        self.imageName = image
        self.labelName = label
    }
}
