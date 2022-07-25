//
//  TransactionModel.swift
//  MeusGastos
//
//  Created by Diego Ferreira on 25/07/22.
//

import Foundation

struct TransactionModel: Codable {
    let id: Int?
    let name: String?
    let category: CategoryModel?
    let date: Date?
    let amount: Double?
    let uid: String?
    let type: Int
}
