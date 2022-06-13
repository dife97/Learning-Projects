//
//  AddressData.swift
//  cep-autocomplete
//
//  Created by Diego Ferreira on 13/06/22.
//

import Foundation

struct AddressData {
    func fetchAddress(cep: String) {
        let urlString = "https://viacep.com.br/ws/\(cep)/json/"
        performRequest(for: urlString)
    }
    
    func performRequest(for urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }

                if let data = data {
                    self.parseJSON(data)
                }
            }
            
            task.resume()
        }
    }
    
    func parseJSON(_ addressData: Data) {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(Address.self, from: addressData)
            let cep = decodedData.cep
            let street = decodedData.logradouro
            let neighborhood = decodedData.bairro
            let city = decodedData.localidade
            let state = decodedData.uf
            
            let address = Address(cep: cep, logradouro: street, bairro: neighborhood, localidade: city, uf: state)
            
            address.printFullAddress()
            
        } catch {
            print(error)
        }
    }
}
