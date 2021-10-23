//
//  SignUpViewController.swift
//  Chordz
//
//  Created by Алена Захарова on 23.10.2021.
//

import UIKit

class SignUpViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let logo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let usernameIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "username-icon")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "info about correct usernames"
        return label
    }()
    
    private let usernameField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 10
        field.placeholder = "username"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = UIColor(named: "text-field-bg-color")
        return field
    }()
    
    private let emailIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "email-icon")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "info about correct emails"
        return label
    }()
    
    private let emailField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 10
        field.placeholder = "email"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = UIColor(named: "text-field-bg-color")
        return field
    }()
    
    private let passwordIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "password-icon")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "info about correct passwords"
        return label
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 10
        field.placeholder = "password"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = UIColor(named: "text-field-bg-color")
        return field
    }()
    
    private let password2Field: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 10
        field.placeholder = "password again"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = UIColor(named: "text-field-bg-color")
        return field
    }()
    
    private let signupButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "button-color")
        button.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
        return button
    }()
    
    private let signupTopButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign up", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
        return button
    }()
    
    private let signinTopButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign in", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(scrollView)
        scrollView.addSubview(signupTopButton)
        scrollView.addSubview(signinTopButton)
        scrollView.addSubview(logo)
        scrollView.addSubview(usernameLabel)
        scrollView.addSubview(usernameField)
        scrollView.addSubview(emailLabel)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordLabel)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(password2Field)
        scrollView.addSubview(signupButton)
        scrollView.addSubview(usernameIcon)
        scrollView.addSubview(emailIcon)
        scrollView.addSubview(passwordIcon)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        //fixme y
        //чота я пока не поняла, как по-человечески расположить
        //и еще под лого не белый фон, а светло-серый
        logo.frame = CGRect(x: 30, y: 60, width: 150, height: 60)
        signupTopButton.frame = CGRect(x: scrollView.width/2-115, y: logo.bottom+35, width: 95, height: 35)
        signinTopButton.frame = CGRect(x: scrollView.width/2+20, y: logo.bottom+35, width: 95, height: 35)
        
        usernameIcon.frame = CGRect(x: 30, y: signupTopButton.bottom+35, width: 20, height: 20)
        usernameLabel.frame = CGRect(x: usernameIcon.right+10, y: signupTopButton.bottom+35, width: scrollView.width-60, height: 20)
        usernameField.frame = CGRect(x: 30, y: usernameLabel.bottom+7, width: scrollView.width-60, height: 45)
        
        emailIcon.frame = CGRect(x: 30, y: usernameField.bottom+20, width: 20, height: 20)
        emailLabel.frame = CGRect(x: emailIcon.right+10, y: usernameField.bottom+20, width: scrollView.width-60, height: 20)
        emailField.frame = CGRect(x: 30, y: emailLabel.bottom+7, width: scrollView.width-60, height: 45)
        
        passwordIcon.frame = CGRect(x: 30, y: emailField.bottom+20, width: 20, height: 20)
        passwordLabel.frame = CGRect(x: passwordIcon.right+10, y: emailField.bottom+20, width: scrollView.width-60, height: 20)
        passwordField.frame = CGRect(x: 30, y: passwordLabel.bottom+7, width: scrollView.width-60, height: 45)
        password2Field.frame = CGRect(x: 30, y: passwordField.bottom+7, width: scrollView.width-60, height: 45)
        
        //fixme y
        //какая-то лажа при повороте экрана, наверное, надо как-то к низу safeArea привязываться, если это возможно
        signupButton.frame = CGRect(x: 30, y: scrollView.bottom - 100, width: scrollView.width-60, height: 60)
    }
}
