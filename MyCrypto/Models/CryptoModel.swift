//
//  CryptoModel.swift
//  MyCrypto
//
//  Created by Константин Каменчуков on 28.07.2022.
//

import UIKit

struct CryptoModel: Decodable {
    let data: CryptoData
}

struct CryptoData: Decodable {
    let name: String
    let symbol: String
    let marketData: CryptoMarketData
    let allTimeHigh: AllTimeHighData
    
    private enum CodingKeys: String, CodingKey {
        case name
        case symbol
        case marketData = "market_data"
        case allTimeHigh = "all_time_high"
    }
}

struct CryptoMarketData: Decodable {
    let priceEth: Double
    let priceBtc: Double
    let priceUsd: Double
    let percentChangeUsdLast24Hours: Double
    
    private enum CodingKeys: String, CodingKey {
        case priceEth = "price_eth"
        case priceBtc = "price_btc"
        case priceUsd = "price_usd"
        case percentChangeUsdLast24Hours = "percent_change_usd_last_24_hours"
    }
}

struct AllTimeHighData: Decodable {
    let price: Double
}
