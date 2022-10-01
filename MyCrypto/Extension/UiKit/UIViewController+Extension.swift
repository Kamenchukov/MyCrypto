//
//  UIViewController+Extension.swift
//  MyCrypto
//
//  Created by Константин Каменчуков on 28.07.2022.
//

import UIKit

extension UIViewController {
    
    func createCustomButton(selector: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrow.uturn.backward"), for: .normal)
        button.setTitle(" Logout", for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: selector, for: .touchUpInside)
        
        let menuBarItem = UIBarButtonItem(customView: button)
        return menuBarItem
    }
    
    func createSortingButton(selector: Selector) -> UIBarButtonItem {
        let button = UISwitch()
        button.isOn = true
        button.tintColor = .black
        button.addTarget(self, action: selector, for: .valueChanged)
        
        let menuBarItem = UIBarButtonItem(customView: button)
        return menuBarItem
    }
}
