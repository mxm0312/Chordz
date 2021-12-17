//
//  Extensions.swift
//  Chordz
//
//  Created by Алена Захарова on 04.11.2021.
//

import UIKit

extension UIImage {
    static let logoIcon = UIImage(named: "logo")
    static let usernameIcon = UIImage(named: "username-icon")
    static let emailIcon = UIImage(named: "email-icon")
    static let passwordIcon = UIImage(named: "password-icon")
    static let infoIcon = UIImage(named: "warning-icon")
    static let settingsIcon = UIImage(named: "settings")
    static let profileTabBarIcon = UIImage(named: "profileTabBar")
    static let feedTapBarIcon = UIImage(named: "feedTapBar")
    static let searchIcon = UIImage(named: "search")
    static let createIcon = UIImage(named: "add")
    static let account = UIImage(named: "account")
}

extension UIColor {
    static let buttonColor = UIColor(named: "button-color")
    static let textFieldBgColor = UIColor(named: "text-field-bg-color")
}

extension UIView {
    func tapAnimation(complition: @escaping() -> Void) {
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            self.alpha = 0.5
        }, completion: { _ in
            UIView.animate(withDuration: 0.2, animations: {
                self.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.alpha = 1
            },completion: { _ in
                complition()
            })
        })
    }
}
