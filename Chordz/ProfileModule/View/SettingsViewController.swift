//
//  SettingsViewController.swift
//  Chordz
//
//  Created by Алена Захарова on 30.11.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var presenter: SettingsPresenterProtocol?
    
    private let settingsLabel: UILabel = {
        let label = UILabel()
        label.text = "Settings"
        label.font =  UIFont(name: "Montserrat-Bold", size: Constants.buttonsTextSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let goBackButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Montserrat-Bold", size: Constants.buttonsTextSize)
        button.addTarget(self,action: #selector(goBackButtonTapped),for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
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
        
        view.backgroundColor = .white
        
        view.addSubview(settingsLabel)
        settingsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        settingsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        
        view.addSubview(goBackButton)
        goBackButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        goBackButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        
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
        presenter?.logoutButtonTapped()
    }
    
    @objc private func goBackButtonTapped() {
        presenter?.navigateToProfile()
    }
}
