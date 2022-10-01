//
//  CryptoViewControllerExtansion.swift
//  MyCrypto
//
//  Created by Константин Каменчуков on 23.08.2022.
//

import UIKit

extension CryptoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cryptoViewModel.coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CryptoTableViewCell
        if sortPosition == CryptoViewModel.SortPosition.formHighToLow {
        let sortedByChange = cryptoViewModel.coins.sorted { firstItem, secondItem in
            return firstItem.marketData.percentChangeUsdLast24Hours > secondItem.marketData.percentChangeUsdLast24Hours
        }
            let coin = sortedByChange[indexPath.row]
            cell.configureCryptoCell(crypto: coin)
            return cell
        } else {
            let sortedByChange = cryptoViewModel.coins.sorted { firstItem, secondItem in
                return secondItem.marketData.percentChangeUsdLast24Hours > firstItem.marketData.percentChangeUsdLast24Hours
            }
            let coin = sortedByChange[indexPath.row]
            cell.configureCryptoCell(crypto: coin)
            return cell
        }
    }
}

extension CryptoViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailCryptoViewController = DetailCryptoViewController()
        if sortPosition == CryptoViewModel.SortPosition.formHighToLow {
        let sortedByChange = cryptoViewModel.coins.sorted { firstItem, secondItem in
            return firstItem.marketData.percentChangeUsdLast24Hours > secondItem.marketData.percentChangeUsdLast24Hours
        }
            let coin = sortedByChange[indexPath.row]
            detailCryptoViewController.coin = coin
            detailCryptoViewController.title = coin.name
        } else {
            let sortedByChange = cryptoViewModel.coins.sorted { firstItem, secondItem in
                return secondItem.marketData.percentChangeUsdLast24Hours > firstItem.marketData.percentChangeUsdLast24Hours
            }
                let coin = sortedByChange[indexPath.row]
                detailCryptoViewController.coin = coin
                detailCryptoViewController.title = coin.name
        }
        navigationController?.pushViewController(detailCryptoViewController, animated: true)
    }
}
