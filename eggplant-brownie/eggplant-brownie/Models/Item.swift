//
//  Item.swift
//  eggplant-brownie
//
//  Created by Diego Ferreira on 03/06/22.
//

import UIKit

class Item: NSObject {
    let nome: String
    var calorias: Double
    
    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
}
