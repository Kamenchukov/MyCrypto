//
//  NetworkDataFetch.swift
//  MyCrypto
//
//  Created by Константин Каменчуков on 28.07.2022.
//

import Foundation

class NetworkDataFetch {
    static let shared = NetworkDataFetch()
    
    private init() {}
    
    func fetchCrypto(urlString: String, response: @escaping(CryptoModel?, Error?) -> Void) {
        NetworkRequest.shared.requestData(urlString: urlString) { result in
            switch result {
            case .success(let data):
                do {
                    let crypto = try JSONDecoder().decode(CryptoModel.self, from: data)
                    response(crypto,nil)
                } catch let jsonError {
                    print("Failed to decode Json", jsonError)
                }
            case .failure(let error):
                print(error.localizedDescription)
                response(nil, error)
            }
        }
    }
}
