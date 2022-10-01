//
//  CryptoViewModel.swift
//  MyCrypto
//
//  Created by Константин Каменчуков on 23.08.2022.
//

import Foundation

class CryptoViewModel {
    static let shared = CryptoViewModel()
    
    enum SortPosition {
        case formHighToLow
        case formLowToHigh
    }
    
    var crypto = [CryptoData]()
    var coins: [CryptoData] = []
    let baseUrl = "https://data.messari.io/api/v1/assets/"
    let feature = "/metrics"

     func fetchCrypto(cryptoName: String) {
        let urlString = "\(baseUrl + cryptoName + feature)"
        NetworkDataFetch.shared.fetchCrypto(urlString: urlString) { [weak self] cryptoModel, error in
            if error == nil {
                guard let cryptoModel = cryptoModel else {
                    return
                }
                self?.coins.append(cryptoModel.data)
                self?.crypto = [cryptoModel.data]
                print(self?.crypto)
                print(self?.coins.count)

            } else {
                print(error?.localizedDescription)
            }
        }
    }
    
     func fetchCryptos() {
        let cryptoName = ["btc", "eth", "tron", "stellar", "tether", "dogecoin", "cardano", "xrp"]
        let groupRequest = DispatchGroup()
        
        for coin in cryptoName {
            groupRequest.enter()
            fetchCrypto(cryptoName: coin) 
            groupRequest.leave()
        }
    }
}
