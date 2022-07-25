//
//  CategoryViewModel.swift
//  MeusGastos
//
//  Created by Diego Ferreira on 25/07/22.
//

import Foundation

typealias CategoriesViewModel = [CategoryViewModel]

class CategoryViewModel {
    let model: CategoryModel
    
    init(withModel model: CategoryModel) {
        self.model = model
    }
    
    var id: Int {
        model.id ?? 0
    }
    
    var name: String {
        model.name ?? String.empty
    }
    
    var about: String {
        model.about ?? String.empty
    }
    
    var uid: String {
        model.uid ?? String.empty
    }
    
    func mock() -> CategoriesViewModel {
        var mocks = CategoriesViewModel()
        
        let model = CategoryModel(id: 1,
                                  name: "Contas Fixas",
                                  about: "Contas que se paga todo mês",
                                  uid: "DiegoLindo")
        let viewModel = CategoryViewModel(withModel: model)
        mocks.append(viewModel)
        
        mocks.append(CategoryViewModel(withModel: CategoryModel(id: 2,
                                                                name: "Salário",
                                                                about: "Salário que recebo todo mês",
                                                                uid: "DiegoLindo")))
        
        mocks.append(CategoryViewModel(withModel: CategoryModel(id: 3,
                                                                name: "Sem Categoria",
                                                                about: "Lançamentos que ainda não possuem categorias",
                                                                uid: "DiegoLindo")))
        
        return mocks
    }
}
