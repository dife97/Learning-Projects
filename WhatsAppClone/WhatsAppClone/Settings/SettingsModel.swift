//
//  SettingsModel.swift
//  WhatsAppClone
//
//  Created by Diego Ferreira on 19/07/22.
//

struct SettingsModel {
    let numberOfCellsInSection: Int
    let cells: [SettingCells]
}

struct SettingCells {
    let image: String
    let label: String
}
