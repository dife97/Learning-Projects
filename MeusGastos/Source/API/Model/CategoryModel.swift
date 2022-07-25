//
//  CategoryModel.swift
//  MeusGastos
//
//  Created by Diego Ferreira on 25/07/22.
//

import Foundation

typealias CategoriesModel = [CategoryModel]

struct CategoryModel: Codable {
    let id: Int?
    let name: String?
    let about: String?
    let uid: String?
    
    init() {
        id = 0
        name = String.empty
        about = String.empty
        uid = String.empty
    }
    
    init(id: Int, name: String, about: String, uid: String) {
        self.id = id
        self.name = name
        self.about = about
        self.uid = uid
    }
}
