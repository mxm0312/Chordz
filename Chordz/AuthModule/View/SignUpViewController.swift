//
//  SignUpViewController.swift
//  Chordz
//
//  Created by Алена Захарова on 23.10.2021.
//

import UIKit

class SignUpViewController: UIViewController {
    
    var presenter: SignUpViewPresenterProtocol?
    
    private let logo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .logoIcon
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let usernameIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .usernameIcon
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "info about correct usernames"
        label.font =  UIFont(name: "Montserrat-Regular", size: Constants.smallTextSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let usernameField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 10
        field.placeholder = "username"
        field.font =  UIFont(name: "Montserrat-Regular", size: Constants.smallTextSize)
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .textFieldBgColor
        field.returnKeyType = .continue
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private let emailIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .emailIcon
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "info about correct emails"
        label.font =  UIFont(name: "Montserrat-Regular", size: Constants.smallTextSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 10
        field.placeholder = "email"
        field.font =  UIFont(name: "Montserrat-Regular", size: Constants.smallTextSize)
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .textFieldBgColor
        field.returnKeyType = .continue
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private let passwordIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .passwordIcon
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "info about correct passwords"
        label.font =  UIFont(name: "Montserrat-Regular", size: Constants.smallTextSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 10
        field.placeholder = "password"
        field.font =  UIFont(name: "Montserrat-Regular", size: Constants.smallTextSize)
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .textFieldBgColor
        field.isSecureTextEntry = true
        field.returnKeyType = .continue
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private let password2Field: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 10
        field.placeholder = "password again"
        field.font =  UIFont(name: "Montserrat-Regular", size: Constants.smallTextSize)
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .textFieldBgColor
        field.isSecureTextEntry = true
        field.returnKeyType = .done
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private let signupButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Montserrat-Bold", size: Constants.buttonsTextSize)
        button.backgroundColor = .buttonColor
        button.addTarget(self,action: #selector(signupButtonTapped),for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let signupTopButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign up", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Montserrat-Bold", size: Constants.buttonsTextSize)
        button.addTarget(self,action:#selector(signUpButton),for:.touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let signinTopButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign in", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: Constants.buttonsTextSize)
        button.addTarget(self,action:#selector(signInButton),for:.touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let justView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private let infoIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .infoIcon
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "by signing up you agree with our policy"
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SignUpViewPresenter(view: self, service: FirebaseNetworkService.shared)
        usernameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        password2Field.delegate = self
        setUI()
    }
    
    func setUI() {
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        view.addSubview(logo)
        logo.heightAnchor.constraint(equalToConstant: 73).isActive = true
        logo.widthAnchor.constraint(equalToConstant: 200).isActive = true
        logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        logo.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 32).isActive = true
        
        let box = UIView()
        box.frame = CGRect.zero
        view.addSubview(box)
        box.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 8).isActive = true
        box.layer.cornerRadius = 15
        box.backgroundColor = .white
        box.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        box.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        box.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        box.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView()
        stackView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        stackView.spacing = Constants.stackViewSpacing
        stackView.addArrangedSubview(signupTopButton)
        // пока убрала, потому что для идентичности нужно добавить на начальный экран и экран логина
        // есть ощущение, что можно это вынести в отдельный элемент, чтобы не дублировать код
//        justView.heightAnchor.constraint(equalToConstant: 20).isActive = true
//        justView.widthAnchor.constraint(equalToConstant: 4).isActive = true
//        stackView.addArrangedSubview(justView)
        stackView.addArrangedSubview(signinTopButton)
        box.addSubview(stackView)
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: box.topAnchor, constant: 32).isActive = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        //username
        
        box.addSubview(usernameIcon)
        usernameIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        usernameIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        usernameIcon.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 38).isActive = true
        usernameIcon.leftAnchor.constraint(equalTo: box.leftAnchor, constant: 32).isActive = true
        
        box.addSubview(usernameLabel)
        usernameLabel.leftAnchor.constraint(equalTo: usernameIcon.rightAnchor, constant: 10).isActive = true
        usernameLabel.centerYAnchor.constraint(equalTo: usernameIcon.centerYAnchor).isActive = true
       
        box.addSubview(usernameField)
        view.addConstraint(NSLayoutConstraint(item: usernameField,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .width,
                                              multiplier: 0.85,
                                              constant: 0))
        usernameField.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 8).isActive = true
        usernameField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        usernameField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        
        //email
        
        box.addSubview(emailIcon)
        emailIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        emailIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        emailIcon.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 38).isActive = true
        emailIcon.leftAnchor.constraint(equalTo: box.leftAnchor, constant: 32).isActive = true
        emailIcon.translatesAutoresizingMaskIntoConstraints = false
        
        box.addSubview(emailLabel)
        emailLabel.leftAnchor.constraint(equalTo: emailIcon.rightAnchor, constant: 10).isActive = true
        emailLabel.centerYAnchor.constraint(equalTo: emailIcon.centerYAnchor).isActive = true
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        box.addSubview(emailField)
        view.addConstraint(NSLayoutConstraint(item: emailField,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .width,
                                              multiplier: 0.85,
                                              constant: 0))
        emailField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8).isActive = true
        emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        
        //password
        
        box.addSubview(passwordIcon)
        passwordIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        passwordIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        passwordIcon.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 38).isActive = true
        passwordIcon.leftAnchor.constraint(equalTo: box.leftAnchor, constant: 32).isActive = true
        
        box.addSubview(passwordLabel)
        passwordLabel.leftAnchor.constraint(equalTo: passwordIcon.rightAnchor, constant: 10).isActive = true
        passwordLabel.centerYAnchor.constraint(equalTo: passwordIcon.centerYAnchor).isActive = true
        
        box.addSubview(passwordField)
        view.addConstraint(NSLayoutConstraint(item: passwordField,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .width,
                                              multiplier: 0.85,
                                              constant: 0))
        passwordField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8).isActive = true
        passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        box.addSubview(password2Field)
        view.addConstraint(NSLayoutConstraint(item: password2Field,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .width,
                                              multiplier: 0.85,
                                              constant: 0))
        password2Field.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 8).isActive = true
        password2Field.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        password2Field.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        
        //signup button
        
        box.addSubview(signupButton)
        signupButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        view.addConstraint(NSLayoutConstraint(item: signupButton,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .width,
                                              multiplier: 0.85,
                                              constant: 0))
        signupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signupButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        box.addSubview(infoIcon)
        infoIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        infoIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        infoIcon.bottomAnchor.constraint(equalTo: signupButton.topAnchor, constant: -8).isActive = true
        infoIcon.leftAnchor.constraint(equalTo: box.leftAnchor, constant: 32).isActive = true
   
        box.addSubview(infoLabel)
        infoLabel.leftAnchor.constraint(equalTo: infoIcon.rightAnchor, constant: 10).isActive = true
        infoLabel.centerYAnchor.constraint(equalTo: infoIcon.centerYAnchor).isActive = true
    }
    
    // MARK: Кнопка зарегестрироваться
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
    
    // MARK: Кнопка войти
    @objc func signInButton() {
        presenter?.navigateToSignIn()
    }
    
    @objc private func signupButtonTapped() {
        usernameField.resignFirstResponder()
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        password2Field.resignFirstResponder()
        
        guard let username = usernameField.text,
              let email = emailField.text,
              let password = passwordField.text,
              let password2 = password2Field.text,
              !username.isEmpty,
              !email.isEmpty,
              !password.isEmpty,
              !password2.isEmpty,
              password.count >= 6,
              password == password2
        else {
            let alert = UIAlertController(title: "Ooops!",
                                          message: "Please enter all the necessary information",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert, animated: true)
            return
        }
        
        presenter?.signupButtonTapped(enteredEmail: emailField.text!, enteredPassword: passwordField.text!)
    }
    
    //fixme
    func success() {
        let tabBarVC = UITabBarController()
        
        let feed = FeedViewController()
        let feedItem = UITabBarItem()
        feedItem.title = "feed"
        feedItem.image = UIImage(named: "home_icon")
        feed.tabBarItem = feedItem
        
        let profile = ProfileViewController()
        let profileItem = UITabBarItem()
        profileItem.title = "profile"
        profileItem.image = UIImage(named: "home_icon")
        profile.tabBarItem = profileItem
        
        
        tabBarVC.setViewControllers([feed,profile], animated: false)
        tabBarVC.modalPresentationStyle = .fullScreen
        self.present(tabBarVC, animated: true, completion: nil)
        /*let alert = UIAlertController(title: "Yoohoo!", message: "Successfully created new user", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)*/
    }
    
    func signUpProblem(error: Error) {
        let alert = UIAlertController(title: "Oops", message: "Something went wrong: " + error.localizedDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameField {
            emailField.becomeFirstResponder()
        }
        else if textField == emailField {
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField {
            password2Field.becomeFirstResponder()
        }
        else if textField == password2Field {
            signupButtonTapped()
        }
        return true
    }
}
