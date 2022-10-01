//
//  CryptoViewController.swift
//  MyCrypto
//
//  Created by Константин Каменчуков on 26.07.2022.
//

import UIKit

class CryptoViewController: UIViewController {
    var sortPosition = CryptoViewModel.SortPosition.formLowToHigh

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.register(CryptoTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    let cryptoViewModel = CryptoViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupDelegate()
        setNavigationBar()
        setConstraints()
        cryptoViewModel.fetchCryptos()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(Int(3.5))) {
            self.tableView.reloadData()
        }
    }
 
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(tableView)
    }
    
    private func setupDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setNavigationBar() {
        navigationItem.title = "Cryptos"
        let cryptologoutButton = createCustomButton(selector: #selector(cryptoLogoutTapped))
        navigationItem.leftBarButtonItem = cryptologoutButton
        
        let sortingButton = createSortingButton(selector: #selector(sortingButtonTapped(target:)))
        navigationItem.rightBarButtonItem = sortingButton
    }
    
    @objc func cryptoLogoutTapped() {
        UserDefaults.standard.set(false, forKey: "LOGGED_IN")
        AppDelegate.shared.rootViewController.switchToLogout()
    }
    
    @objc func sortingButtonTapped(target: UISwitch) {
        if target.isOn {
            sortPosition = CryptoViewModel.SortPosition.formHighToLow
            tableView.reloadData()
        } else {
            sortPosition = CryptoViewModel.SortPosition.formLowToHigh
            tableView.reloadData()
        }
        
        switch sortPosition {
        case .formHighToLow:
            print("formHighToLow")
            let sortedByChange = cryptoViewModel.coins.sorted { firstItem, secondItem in
                return secondItem.marketData.percentChangeUsdLast24Hours > firstItem.marketData.percentChangeUsdLast24Hours
            }
        case .formLowToHigh:
            print("formLowToHigh")
            let sortedByChange = cryptoViewModel.coins.sorted { firstItem, secondItem in
                return firstItem.marketData.percentChangeUsdLast24Hours > secondItem.marketData.percentChangeUsdLast24Hours
            }
        }
        tableView.reloadData()
    }
}

//MARK: - UITableViewDataSource


//MARK: - UITableViewDelegate


//MARK: - Set Constrains
extension CryptoViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}
