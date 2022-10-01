//
//  RootViewController.swift
//  MyCrypto
//
//  Created by Константин Каменчуков on 16.08.2022.
//

import UIKit

class RootViewController: UIViewController {
    private var current: UIViewController
    
    init() {
        self.current = SplashViewController()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild(current)
        current.view.frame = view.bounds
        view.addSubview(current.view)
        current.didMove(toParent: self)
    }

    func showLoginScreen() {
        let new = UINavigationController(rootViewController: LoginViewController())
        addChild(new)
        new.view.frame = view.bounds
        view.addSubview(new.view)
        new.didMove(toParent: self)
        current.willMove(toParent: nil)
        current.view.removeFromSuperview()
        current.removeFromParent()
        current = new
    }
    
    func switchToCryptoScreen() {
        let cryptoViewController = CryptoViewController()
        let cryptoScreen = UINavigationController(rootViewController: cryptoViewController)
        addChild(cryptoScreen)
        cryptoScreen.view.frame = view.bounds
        view.addSubview(cryptoScreen.view)
        cryptoScreen.didMove(toParent: self)
        current.willMove(toParent: nil)
        current.view.removeFromSuperview()
        current.removeFromParent()
        current = cryptoScreen
    }
    
    func switchToLogout() {
        let loginViewController = LoginViewController()
        let logoutScreen = UINavigationController(rootViewController: loginViewController)
        addChild(logoutScreen)
        logoutScreen.view.frame = view.bounds
        view.addSubview(logoutScreen.view)
        logoutScreen.didMove(toParent: self)
        current.willMove(toParent: nil)
        current.view.removeFromSuperview()
        current.removeFromParent()
        current = logoutScreen
    }
}
