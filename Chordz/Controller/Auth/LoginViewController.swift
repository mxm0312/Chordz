//
//  ViewController.swift
//  Chordz
//
//  Created by Maxim Perehod on 01.10.2021.
//

import UIKit


class LoginViewController: UIViewController, UITextFieldDelegate {
    
    var loginField = UITextField()
    var passwordField = UITextField()
    var signinButton = UIButton()
    var logoImage = UIImageView()
    var chordzLabel = UILabel()
    var signUp = UIButton()
    var signIn = UIButton()
    
    var screenHeight: Int?
    var screenWidth: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginField.delegate = self
        passwordField.delegate = self
        screenHeight = Int(view.frame.height)
        screenWidth = Int(view.frame.width)
        setUI()
    }
    
    
    func setUI() {
        
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        // logoImage
        
        logoImage.frame = CGRect(x: 100, y: 100, width: 45, height: 45)
        view.addSubview(logoImage)
        logoImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24).isActive = true
        logoImage.heightAnchor.constraint(equalToConstant: 45).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 45).isActive = true
        logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        logoImage.image = UIImage(named: "logo")
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        // ChordzLabel
        
        chordzLabel.frame = CGRect(x: 0, y: 0, width: 132, height: 49)
        chordzLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        chordzLabel.font = UIFont(name: "RobotoCondensed-Bold", size: 40)
        chordzLabel.text = "Chord"
        view.addSubview(chordzLabel)
        chordzLabel.leadingAnchor.constraint(equalTo: logoImage.trailingAnchor, constant: 5).isActive = true
        chordzLabel.centerYAnchor.constraint(equalTo: logoImage.centerYAnchor).isActive = true
        chordzLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // contentView
        
        let box = UIView()
        box.frame = CGRect.zero
        view.addSubview(box)
        box.topAnchor.constraint(equalTo: chordzLabel.bottomAnchor, constant: 8).isActive = true
        box.layer.cornerRadius = 15
        box.backgroundColor = .white
        box.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        box.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        box.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            .isActive = true
        box.translatesAutoresizingMaskIntoConstraints = false
        
        // StackView with two buttons
        
        signUp.frame = CGRect.zero
        signUp.setTitle("Sign up", for: .normal)
        signUp.titleLabel?.font = UIFont(name: "RobotoCondensed-Bold", size: 24)
        signUp.setTitleColor(UIColor.black, for: .normal)
        signUp.addTarget(self,action:#selector(signUpButton),
                         for:.touchUpInside)
        
        
        signIn.frame = CGRect.zero
        signIn.setTitle("Sign up", for: .normal)
        signIn.titleLabel?.font = UIFont(name: "RobotoCondensed-Regular", size: 24)
        signIn.setTitleColor(UIColor.black, for: .normal)
        signIn.addTarget(self,action:#selector(signInButton),
                         for:.touchUpInside)
        
        
        let stackView = UIStackView()
        stackView.frame = CGRect(x: 0, y: 0, width: 0, height: 45)
        stackView.spacing = 45
        stackView.addArrangedSubview(signUp)
        stackView.addArrangedSubview(signIn)
        box.addSubview(stackView)
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: box.topAnchor, constant: 32).isActive = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // email icon
       
        let emailImage = UIImageView()
        emailImage.image = UIImage(named: "account")
        box.addSubview(emailImage)
        emailImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        emailImage.widthAnchor.constraint(equalToConstant: 18).isActive = true
        emailImage.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 38).isActive = true
        emailImage.leftAnchor.constraint(equalTo: box.leftAnchor, constant: 32).isActive = true
        emailImage.translatesAutoresizingMaskIntoConstraints = false
        
        
        // email Label
        let emailLabel = UILabel()
        emailLabel.font =  UIFont(name: "RobotoCondensed-Regular", size: 22)
        emailLabel.text = "Info about correct email"
        box.addSubview(emailLabel)
        emailLabel.leftAnchor.constraint(equalTo: emailImage.rightAnchor, constant: 10).isActive = true
        emailLabel.centerYAnchor.constraint(equalTo: emailImage.centerYAnchor).isActive = true
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // emailField
        loginField.layer.cornerRadius = 10
        loginField.placeholder = "email"
        loginField.textContentType = .emailAddress
        loginField.borderStyle = .none
        loginField.textAlignment = .center
        loginField.textContentType = .emailAddress
        loginField.tintColor = .black
        loginField.backgroundColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 0.2)
        box.addSubview(loginField)
        view.addConstraint(NSLayoutConstraint(item: loginField, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0.85, constant: 0))
        loginField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8).isActive = true
        loginField.font = UIFont(name: "RobotoCondensed-Regular", size: 22)
        loginField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        loginField.translatesAutoresizingMaskIntoConstraints = false
        
        
        // password icon
       
        let passwordIcon = UIImageView()
        passwordIcon.image = UIImage(named: "lock")
        box.addSubview(passwordIcon)
        passwordIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        passwordIcon.widthAnchor.constraint(equalToConstant: 18).isActive = true
        passwordIcon.topAnchor.constraint(equalTo: loginField.bottomAnchor, constant: 38).isActive = true
        passwordIcon.leftAnchor.constraint(equalTo: box.leftAnchor, constant: 32).isActive = true
        passwordIcon.translatesAutoresizingMaskIntoConstraints = false
        
        
        // password Label
        let passwordLabel = UILabel()
        passwordLabel.font =  UIFont(name: "RobotoCondensed-Regular", size: 22)
        passwordLabel.text = "Info about correct password"
        box.addSubview(passwordLabel)
        passwordLabel.leftAnchor.constraint(equalTo: passwordIcon.rightAnchor, constant: 10).isActive = true
        passwordLabel.centerYAnchor.constraint(equalTo: passwordIcon.centerYAnchor).isActive = true
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        // password field
        passwordField.layer.cornerRadius = 10
        passwordField.font = UIFont(name: "RobotoCondensed-Regular", size: 22)
        passwordField.isSecureTextEntry = true
        passwordField.placeholder = "password"
        passwordField.textAlignment = .center
        passwordField.tintColor = .black
        passwordField.borderStyle = .none
        passwordField.backgroundColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 0.2)
        box.addSubview(passwordField)
        view.addConstraint(NSLayoutConstraint(item: passwordField, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0.85, constant: 0))
        passwordField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        
        // pass reset icon
        
        let passresetIcon = UIImageView()
        passresetIcon.image = UIImage(named: "question")
        box.addSubview(passresetIcon)
        passresetIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        passresetIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        passresetIcon.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 38).isActive = true
        passresetIcon.leftAnchor.constraint(equalTo: box.leftAnchor, constant: 32).isActive = true
        passresetIcon.translatesAutoresizingMaskIntoConstraints = false
        
        // resetButton
        
        let resetButton = UIButton()
        resetButton.setTitle("Forgot password?", for: .normal)
        resetButton.titleLabel?.font = UIFont(name: "RobotoCondensed-Regular", size: 22)
        resetButton.setTitleColor(UIColor(red: 0.898, green: 0.227, blue: 0.349, alpha: 1), for: .normal)
        resetButton.addTarget(self,action:#selector(reset),
                              for:.touchUpInside)
        box.addSubview(resetButton)
        resetButton.leftAnchor.constraint(equalTo: passresetIcon.rightAnchor, constant: 10).isActive = true
        resetButton.centerYAnchor.constraint(equalTo: passresetIcon.centerYAnchor).isActive = true
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        
        // confirmButton
        let confirmButton = UIButton()
        confirmButton.setTitle("Sign in", for: .normal)
        confirmButton.titleLabel?.font = UIFont(name: "RobotoCondensed-Bold", size: 25)
        confirmButton.setTitleColor(UIColor.white, for: .normal)
        confirmButton.backgroundColor = UIColor(red: 0, green: 0.591, blue: 0.721, alpha: 1)
        confirmButton.layer.cornerRadius = 10
        confirmButton.addTarget(self, action:#selector(submitButton),
                              for: .touchUpInside)
        box.addSubview(confirmButton)
        confirmButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -85).isActive = true
        view.addConstraint(NSLayoutConstraint(item: confirmButton, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0.85, constant: 0))
        confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        confirmButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc func submitButton(_ sender: Any) {
        if (loginField.text != "" && passwordField.text != "") {
            FirebaseAuthManager.shared.signIn(email: loginField.text!, password: passwordField.text!, completionHandler: { err in
               
                if err == nil {
                    print("Success")
                    // Переход на главный экран
                } else {
                    let alert = UIAlertController(title: "Oops", message: "Checkout ur email or password", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                }
            })
        } else {
            let alert = UIAlertController(title: "Oops", message: "You haven't filled out the data", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        loginField.resignFirstResponder()
        passwordField.resignFirstResponder()
        return true
    }
    
    @objc func signUpButton(sender:UIButton) {
        UIView.animate(withDuration: 0.1, animations: {
            sender.alpha = 0.5
            sender.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }, completion: { _ in
            UIView.animate(withDuration: 0.2, animations: {
                sender.alpha = 1
                sender.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
        })
    }
    
    @objc func signInButton(sender:UIButton) {
        UIView.animate(withDuration: 0.1, animations: {
            sender.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            sender.alpha = 0.5
        }, completion: { _ in
            UIView.animate(withDuration: 0.2, animations: {
                sender.transform = CGAffineTransform(scaleX: 1, y: 1)
                sender.alpha = 1
            })
        })
    }
    
    @objc func reset(sender:UIButton) {
        
    }
    
}

