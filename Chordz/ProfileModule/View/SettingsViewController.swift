//
//  SettingsViewController.swift
//  Chordz
//
//  Created by Алена Захарова on 30.11.2021.
//

import UIKit

class SettingsViewController: UIViewController, UINavigationBarDelegate {
    
    var presenter: SettingsPresenterProtocol?
    
    private let logoutButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitle("Log Out", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Montserrat-Bold", size: Constants.buttonsTextSize)
        button.backgroundColor = .buttonColor
        button.addTarget(self,action: #selector(logoutButtonTapped),for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = SettingsPresenter(view: self)
        overrideUserInterfaceStyle = .light
        
        view.backgroundColor = .white
        
        let height: CGFloat = 75
        //шо-то до меня не дошло, как сделать так, чтобы оно нормально расположилось
//        let navbar = UINavigationBar(frame: CGRect(x: 0, y: 40, width: UIScreen.main.bounds.width, height: 75))
//        navbar.backgroundColor = UIColor.white
//        navbar.delegate = self
//        
//        let navItem = UINavigationItem()
//        navItem.title = "Settings"
//        navItem.leftBarButtonItem = UIBarButtonItem(title: "Back",
//                                                    style: .done,
//                                                    target: self,
//                                                    action: #selector(goBackButtonTapped))
//        
//        navbar.items = [navItem]
//        
//        view.addSubview(navbar)
//        
        self.view.frame = CGRect(x: 0, y: height, width: UIScreen.main.bounds.width, height: (UIScreen.main.bounds.height - height))
        
        view.addSubview(logoutButton)
        logoutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        view.addConstraint(NSLayoutConstraint(item: logoutButton,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .width,
                                              multiplier: 0.85,
                                              constant: 0))
        logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoutButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    @objc private func logoutButtonTapped() {
        let alert = UIAlertController(title: "Log out?", message: nil, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            self.presenter?.logoutButtonTapped()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
        }))
        
        
        let view = InitialViewController()
        view.modalPresentationStyle = .fullScreen
        self.present(view, animated: true, completion: nil)
    }
    
    @objc private func goBackButtonTapped() {
        presenter?.navigateToProfile()
    }
}
