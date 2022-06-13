struct Address: Decodable {
    let cep: String
    let logradouro: String
    let bairro: String
    let localidade: String
    let uf: String
    
    func printFullAddress() {
        print("Rua \(logradouro), bairro \(bairro), cidade \(localidade), estado \(uf), CEP \(cep)")
    }
}
