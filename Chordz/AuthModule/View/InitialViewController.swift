//
//  InitialViewController.swift
//  Класс для самого первого экрана
//  Chordz
//
//  Created by Maxim Perehod on 19.10.2021.
//


import UIKit


class InitialViewController: UIViewController {
    
    
    var logoImage: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 0, y: 0, width: 200, height: 73)
        image.image = UIImage(named: "logo")
        return image
    }()
    
    var cLabel: UILabel = {
        let label = UILabel()
        label.text = "C"
        label.font = UIFont(name: "RobotoCondensed-Bold", size: 64)
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    var amLabel: UILabel = {
        let label = UILabel()
        label.text = "Am"
        label.font = UIFont(name: "RobotoCondensed-Bold", size: 64)
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    var emLabel: UILabel = {
        let label = UILabel()
        label.text = "Em"
        label.font = UIFont(name: "RobotoCondensed-Bold", size: 64)
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    var reateLabel: UILabel = {
        let label = UILabel()
        label.text = "reate"
        label.font = UIFont(name: "RobotoCondensed-Bold", size: 64)
        label.frame = CGRect(x: 0, y: 0, width: 169, height: 75)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    var azeLabel: UILabel = {
        let label = UILabel()
        label.text = "aze"
        label.font = UIFont(name: "RobotoCondensed-Bold", size: 64)
        label.frame = CGRect(x: 0, y: 0, width: 174, height: 75)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    var powerLabel: UILabel = {
        let label = UILabel()
        label.text = "power"
        label.font = UIFont(name: "RobotoCondensed-Bold", size: 64)
        label.frame = CGRect(x: 0, y: 0, width: 235, height: 75)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    var redView: UIView = {
        let coloredView = UIView()
        coloredView.frame = CGRect(x: 0, y: 0, width: 49, height: 66)
        coloredView.layer.backgroundColor = UIColor(red: 0.898, green: 0.227, blue: 0.349, alpha: 1).cgColor
        coloredView.layer.cornerRadius = 12
        return coloredView
    }()
    
    var blueView: UIView = {
        let coloredView = UIView()
        coloredView.backgroundColor = .white
        coloredView.layer.backgroundColor = UIColor(red: 0, green: 0.591, blue: 0.721, alpha: 1).cgColor
        coloredView.layer.cornerRadius = 12
        return coloredView
    }()
    
    var greenView: UIView = {
        let coloredView = UIView()
        coloredView.frame = CGRect(x: 0, y: 0, width: 96, height: 66)
        coloredView.layer.backgroundColor = UIColor(red: 0.184, green: 0.658, blue: 0.231, alpha: 1).cgColor
        coloredView.layer.cornerRadius = 12
        return coloredView
    }()
    
    var signUp: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Sign up", for: .normal)
        button.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 24)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self,action:#selector(signUpButton),
                         for:.touchUpInside)
        return button
    }()
    
    var signIn: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Sign in", for: .normal)
        button.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 24)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self,action:#selector(signInButton),
                         for:.touchUpInside)
        return button
    }()
    
    var handImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        apearAnimation()
    }
   
    
    func setUI() {
        
        guard let parent = self.view else { return }
        parent.addSubview(redView)
        parent.sendSubviewToBack(redView)
        parent.addSubview(blueView)
        parent.sendSubviewToBack(blueView)
        parent.addSubview(greenView)
        parent.sendSubviewToBack(greenView)
        
        // logo
        
        view.addSubview(logoImage)
        logoImage.heightAnchor.constraint(equalToConstant: 73).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
        logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        logoImage.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 32).isActive = true
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        redView.addSubview(cLabel)
        blueView.addSubview(amLabel)
        greenView.addSubview(emLabel)
        view.addSubview(reateLabel)
        view.addSubview(azeLabel)
        view.addSubview(powerLabel)

        // redView
        
        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        redView.heightAnchor.constraint(equalToConstant: 66).isActive = true
        redView.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 24).isActive = true
        self.view.addConstraint(NSLayoutConstraint(item: redView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 0.6, constant: 0))
        
        
        // BlueView
        
        blueView.translatesAutoresizingMaskIntoConstraints = false
        blueView.widthAnchor.constraint(equalToConstant: 96).isActive = true
        blueView.heightAnchor.constraint(equalToConstant: 66).isActive = true
        blueView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 45).isActive = true
        blueView.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 24).isActive = true
        
        // GreenView
        
        greenView.translatesAutoresizingMaskIntoConstraints = false
        greenView.widthAnchor.constraint(equalToConstant: 96).isActive = true
        greenView.heightAnchor.constraint(equalToConstant: 66).isActive = true
        greenView.topAnchor.constraint(equalTo: blueView.bottomAnchor, constant: 45).isActive = true
        greenView.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 24).isActive = true
        
        // Labels
        
        cLabel.centerXAnchor.constraint(equalTo: redView.centerXAnchor).isActive = true
        cLabel.centerYAnchor.constraint(equalTo: redView.centerYAnchor).isActive = true
        cLabel.translatesAutoresizingMaskIntoConstraints = false
        
        amLabel.centerXAnchor.constraint(equalTo: blueView.centerXAnchor).isActive = true
        amLabel.centerYAnchor.constraint(equalTo: blueView.centerYAnchor).isActive = true
        amLabel.translatesAutoresizingMaskIntoConstraints = false
        
        emLabel.centerXAnchor.constraint(equalTo: greenView.centerXAnchor).isActive = true
        emLabel.centerYAnchor.constraint(equalTo: greenView.centerYAnchor).isActive = true
        emLabel.translatesAutoresizingMaskIntoConstraints = false
        
        reateLabel.centerYAnchor.constraint(equalTo: redView.centerYAnchor).isActive = true
        reateLabel.leftAnchor.constraint(equalTo: redView.rightAnchor, constant: 2).isActive = true
        reateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        azeLabel.centerYAnchor.constraint(equalTo: blueView.centerYAnchor).isActive = true
        azeLabel.leftAnchor.constraint(equalTo: blueView.rightAnchor, constant: 2).isActive = true
        azeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        powerLabel.centerYAnchor.constraint(equalTo: greenView.centerYAnchor).isActive = true
        powerLabel.leftAnchor.constraint(equalTo: greenView.rightAnchor, constant: 2).isActive = true
        powerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // StackView with two buttons
        
        let stackView = UIStackView()
        stackView.frame = CGRect(x: 0, y: 0, width: 0, height: 45)
        stackView.spacing = 45
        stackView.addArrangedSubview(signUp)
        stackView.addArrangedSubview(signIn)
        view.addSubview(stackView)
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32).isActive = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Пикча с рукой
        
        handImage.image = UIImage(named: "hand")
        view.addSubview(handImage)
        view.sendSubviewToBack(handImage)
        handImage.frame = CGRect.zero
        handImage.heightAnchor.constraint(equalToConstant: view.frame.height*0.45).isActive = true
        handImage.widthAnchor.constraint(equalToConstant: view.frame.height*0.45*0.45).isActive = true
        handImage.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: handImage, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 0.8, constant: 0))
        handImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        // Текст
        
        let descriptionText = UILabel()
        descriptionText.frame = CGRect(x: 0, y: 0, width: 358, height: 84)

        descriptionText.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        descriptionText.font = UIFont(name: "Montserrat-Regular", size: 20)
        descriptionText.numberOfLines = 0
        descriptionText.lineBreakMode = .byWordWrapping
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.04


        descriptionText.attributedText = NSMutableAttributedString(string: "Create chords for your favourite songs and empower others to be better musicians", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])

        parent.addSubview(descriptionText)
        descriptionText.translatesAutoresizingMaskIntoConstraints = false
        descriptionText.topAnchor.constraint(equalTo: emLabel.bottomAnchor, constant: 32).isActive = true
        descriptionText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32).isActive = true
        descriptionText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
       
    }
    
    // MARK: Кнопка зарегестрироваться
    @objc func signUpButton(sender:UIButton) {
        sender.tapAnimation {
            let view = SignUpViewController()
            view.modalPresentationStyle = .fullScreen
            self.present(view, animated: true, completion: nil)
        }
    }
    
    // MARK: Кнопка войти
    @objc func signInButton(sender:UIButton) {
        sender.tapAnimation {
            let view = LoginViewController()
            view.modalPresentationStyle = .fullScreen
            self.present(view, animated: true, completion: nil)
        }
    }
}


extension InitialViewController {
    

    
    // MARK: Анимация появления текста
    func apearAnimation() {
        redView.transform = CGAffineTransform(scaleX: 0, y: 0)
        blueView.transform = CGAffineTransform(scaleX: 0, y: 0)
        greenView.transform = CGAffineTransform(scaleX: 0, y: 0)
        cLabel.alpha = 0
        amLabel.alpha = 0
        emLabel.alpha = 0
        reateLabel.alpha = 0
        azeLabel.alpha = 0
        powerLabel.alpha = 0
        
        UIView.animate(withDuration: 0.4, animations: {
            self.redView.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.cLabel.alpha = 1
            self.reateLabel.alpha = 1
        }, completion: { _ in
            UIView.animate(withDuration: 0.4, animations: {
                self.blueView.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.amLabel.alpha = 1
                self.azeLabel.alpha = 1
            }, completion: { _ in
                UIView.animate(withDuration: 0.4, animations: {
                    self.greenView.transform = CGAffineTransform(scaleX: 1, y: 1)
                    self.emLabel.alpha = 1
                    self.powerLabel.alpha = 1
                }, completion: nil)
            })
        })
    }
}
