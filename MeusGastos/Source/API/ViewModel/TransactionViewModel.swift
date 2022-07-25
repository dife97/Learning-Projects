//
//  TransactionViewModel.swift
//  MeusGastos
//
//  Created by Diego Ferreira on 25/07/22.
//

import Foundation

typealias TransactionsViewModel = [TransactionViewModel]

struct TransactionViewModel {
    let model: TransactionModel
    
    init(withModel model: TransactionModel) {
        self.model = model
    }
    
    var id: Int {
        model.id ?? 0
    }
    
    var name: String {
        model.name ?? String.empty
    }
    
    var category: CategoryModel {
        model.category ?? CategoryModel()
    }
    
    var date: Date {
        model.date ?? Date()
    }
    
    var amount: Double {
        model.amount ?? 0
    }
    
    var uid: String {
        model.uid ?? String.empty
    }
    
    var type: TypeEntry {
        model.type == 0 ? TypeEntry.input : TypeEntry.output
    }
    
    func mock() -> TransactionsViewModel {
        var mocks = TransactionsViewModel()
        
        mocks.append(TransactionViewModel(withModel: TransactionModel(id: 1,
                                                                      name: "Salário de maio",
                                                                      category: CategoryModel(id: 2,
                                                                                              name: "Salário do mês",
                                                                                              about: "",
                                                                                              uid: "DiegoLindo"),
                                                                      date: Date(),
                                                                      amount: 5000,
                                                                      uid: "DiegoLindo",
                                                                      type: 0)))
        
        mocks.append(TransactionViewModel(withModel: TransactionModel(id: 1,
                                                                      name: "Água de maio",
                                                                      category: CategoryModel(id: 2,
                                                                                              name: "Despesas fixas",
                                                                                              about: "",
                                                                                              uid: "DiegoLindo"),
                                                                      date: Date(),
                                                                      amount: 123,
                                                                      uid: "DiegoLindo",
                                                                      type: 1)))
        
        return mocks
    }
}
