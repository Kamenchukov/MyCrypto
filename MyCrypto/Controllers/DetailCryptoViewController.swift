//
//  DetailCryptoViewController.swift
//  MyCrypto
//
//  Created by Константин Каменчуков on 27.07.2022.
//

import UIKit

class DetailCryptoViewController: UIViewController {
    private let cryptoLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let cryptoPrice: UILabel = {
        let label = UILabel()
        label.text = "$ 1"
        label.font = UIFont.systemFont(ofSize: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let cryptoPriceInBtc: UILabel = {
        let label = UILabel()
        label.text = "1 btc"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let cryptoPriceInEth: UILabel = {
        let label = UILabel()
        label.text = "1 eth"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let cryptoNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name of Crypto(Bitcoin)"
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let cryptoSymbol: UILabel = {
       let label = UILabel()
        label.text = "Crypto Symbol(BTC)"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let cryptoChangePerDay: UILabel = {
        let label = UILabel()
        label.text = "+8.32"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let maxCost: UILabel = {
       let label = UILabel()
        label.text = "maxCost"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var stackView = UIStackView()
    
    var coin: CryptoData?
//MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstrains()
        setModel()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        cryptoLogo.layer.cornerRadius = cryptoLogo.frame.width / 2
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(cryptoLogo)
        view.addSubview(cryptoPrice)
        
        stackView = UIStackView(
            arrangedSubviews: [cryptoNameLabel, cryptoSymbol, maxCost, cryptoPriceInBtc, cryptoPriceInEth, cryptoChangePerDay],
            axis: .vertical,
            spacing: 10,
            distribution: .fillProportionally)

        view.addSubview(stackView)
    }
    private func setModel() {
        guard let coin = coin else { return }
        let logo = ["BTC","ETH","XRP","USDT","TRX","DOGE","ADA","XLM"]
        for image in logo {
            if image == coin.symbol {
                cryptoLogo.image = UIImage(named: image) }
        }
        cryptoNameLabel.text = coin.name
        cryptoSymbol.text = coin.symbol
        cryptoPrice.text = "$\(NSString(format: "%.2f", coin.marketData.priceUsd))"
        cryptoChangePerDay.text = "24 Hours change: \(NSString(format: "%.2f", coin.marketData.percentChangeUsdLast24Hours))%"
        maxCost.text = "Maximum cost: \(NSString(format: "%.2f", coin.allTimeHigh.price))$"
        cryptoPriceInBtc.text = "Price in BTC: \(NSString(format: "%.6f", coin.marketData.priceBtc)) BTC"
        cryptoPriceInEth.text = "Price in ETH: \(NSString(format: "%.6f", coin.marketData.priceEth)) ETH"
    }
}

//MARK: - Constrains
extension DetailCryptoViewController {
    private func setConstrains() {
        
        NSLayoutConstraint.activate([
            cryptoLogo.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            cryptoLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cryptoLogo.heightAnchor.constraint(equalToConstant: 150),
            cryptoLogo.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        NSLayoutConstraint.activate([
            cryptoPrice.topAnchor.constraint(equalTo: cryptoLogo.bottomAnchor, constant: 10),
            cryptoPrice.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: cryptoPrice.bottomAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
        ])
    }
}
