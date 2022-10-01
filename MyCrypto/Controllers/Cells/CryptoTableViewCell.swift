//
//  CryptoTableViewCell.swift
//  MyCrypto
//
//  Created by Константин Каменчуков on 27.07.2022.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {
    private let cryptoLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
    
    private let cryptoPrice: UILabel = {
       let label = UILabel()
        label.text = "$ 1"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let cryptoChange: UILabel = {
        let label = UILabel()
        label.text = "+0.68"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var stackViewName = UIStackView()
    var stackViewPrice = UIStackView()

    override func layoutSubviews() {
        super.layoutSubviews()
        cryptoLogo.layer.cornerRadius = cryptoLogo.frame.width / 2
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SetupViews
    private func setupViews() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
        self.addSubview(cryptoLogo)

        stackViewName = UIStackView(
            arrangedSubviews: [cryptoNameLabel, cryptoSymbol],
            axis: .vertical,
            spacing: 10,
            distribution: .equalCentering)
        self.addSubview(stackViewName)

        stackViewPrice = UIStackView(
            arrangedSubviews: [cryptoPrice, cryptoChange],
            axis: .vertical,
            spacing: 10,
            distribution: .equalCentering)
        self.addSubview(stackViewPrice)
    }
    
    //MARK: - Конфигурация ячейки
     func configureCryptoCell(crypto: CryptoData) {
         let logo = ["BTC","ETH","XRP","USDT","TRX","DOGE","ADA","XLM"]
         for image in logo {
             if image == crypto.symbol {
                 cryptoLogo.image = UIImage(named: image) }
         }
         cryptoNameLabel.text = crypto.name
         cryptoSymbol.text = crypto.symbol
         cryptoPrice.text = "$\(NSString(format: "%.2f", crypto.marketData.priceUsd))"
         cryptoChange.text = "\(NSString(format: "%.2f", crypto.marketData.percentChangeUsdLast24Hours))%"
    }
    
    //MARK: - Constrains
    private func setConstrains() {
        NSLayoutConstraint.activate([
            cryptoLogo.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            cryptoLogo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            cryptoLogo.heightAnchor.constraint(equalToConstant: 60),
            cryptoLogo.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            stackViewName.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            stackViewName.leadingAnchor.constraint(equalTo: cryptoLogo.trailingAnchor, constant: 10),
            stackViewName.trailingAnchor.constraint(equalTo: stackViewPrice.leadingAnchor, constant: -10),
            stackViewName.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])

        NSLayoutConstraint.activate([
            stackViewPrice.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            stackViewPrice.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            stackViewPrice.leadingAnchor.constraint(equalTo: stackViewName.trailingAnchor, constant: 10),
            stackViewPrice.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
}
