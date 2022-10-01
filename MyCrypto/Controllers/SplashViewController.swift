//
//  SplashViewController.swift
//  MyCrypto
//
//  Created by Константин Каменчуков on 17.08.2022.
//

import UIKit

class SplashViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        makeServiceCall()
    }
    
    private func makeServiceCall() {
        if UserDefaults.standard.bool(forKey: "LOGGED_IN") {
            AppDelegate.shared.rootViewController.switchToCryptoScreen()
        } else {
            AppDelegate.shared.rootViewController.showLoginScreen()
        }
    }
}
