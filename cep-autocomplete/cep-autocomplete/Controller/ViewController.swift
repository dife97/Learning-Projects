//
//  ViewController.swift
//  cep-autocomplete
//
//  Created by Diego Ferreira on 13/06/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cepTextField: UITextField!
    @IBOutlet weak var streetTextField: UITextField!
    @IBOutlet weak var numeroTextField: UITextField!
    @IBOutlet weak var complementTextField: UITextField!
    @IBOutlet weak var neighborhoodTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    
    let address = AddressData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func searchPressed(_ sender: UIButton) {
        
        if let cep = cepTextField.text {
            address.fetchAddress(cep: cep)
        } else { return }
        
    }
}

