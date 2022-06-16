//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Diego Personal on 16/06/22.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdatePrice(_ coinManager: CoinManager, price: CoinData)
    func didFailWithError(error: Error)
}

struct CoinManager {
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "YOUR_API_KEY_HERE"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate: CoinManagerDelegate?
    
    func getCoinPrice(for currency: String) {
        //1. Create a URL
        let urlString = "https://rest.coinapi.io/v1/exchangerate/BTC/\(currency)?apikey=FB720474-0DD1-4C3F-832A-0945EF230F72"
        
        if let url = URL(string: urlString) {
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            //3. Give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let data = data {
                    if let price = self.parseJSON(data) {
                        self.delegate?.didUpdatePrice(self, price: price)
                    }
                }
            }
            
            //4. Start the task
            task.resume()
        }
    }
    
    func parseJSON(_ priceData: Data) -> CoinData? {
        let decoder = JSONDecoder()

        do {
            let decodedData = try decoder.decode(CoinData.self, from: priceData)
            let rate = decodedData.rate
            let currency = decodedData.asset_id_quote
            
            let price = CoinData(rate: rate, asset_id_quote: currency)
            
            return price

        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
