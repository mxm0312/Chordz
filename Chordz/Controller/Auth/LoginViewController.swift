//
//  ViewController.swift
//  Chordz
//
//  Created by Maxim Perehod on 01.10.2021.
//

import UIKit


class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var loginField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var signinButton: UIButton!
    @IBOutlet var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginField.layer.cornerRadius = 10
        signinButton.layer.cornerRadius = 10
        passwordField.layer.cornerRadius = 10
        contentView.layer.cornerRadius = 15
        loginField.delegate = self
        passwordField.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    
    @IBAction func forgotButton(_ sender: Any) {
    }
    
    
    @IBAction func singupButton(_ sender: Any) {
    }
    
    @IBAction func submitButton(_ sender: Any) {
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
            let alert = UIAlertController(title: "Oops", message: "You haven't filled the data", preferredStyle: .alert)
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
    
}

