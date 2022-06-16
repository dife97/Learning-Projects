//
//  ViewController.swift
//  ByteCoin
//
//  Created by Diego Personal on 16/06/22.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    var coinManager = CoinManager()
    var selectedCurrency = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coinManager.delegate = self
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
    }
}

//MARK: - UIPickerView DataSource

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
}

//MARK: - UIPickerView DataSource

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCurrency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: selectedCurrency)
    }
}

//MARK: - CoinManager Delegate

extension ViewController: CoinManagerDelegate {
    func didUpdatePrice(_ coinManager: CoinManager, price: CoinData) {
        DispatchQueue.main.async {
            self.bitcoinLabel.text = String(format: "%.2f", price.rate)
            self.currencyLabel.text = price.asset_id_quote
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
