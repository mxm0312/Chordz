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
    
    var createLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 169, height: 75)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        //label.font = UIFont(name: "Montserrat-Bold", size: 64)
        //label.text = "Create"
        return label
    }()
    var amazeLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 174, height: 75)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        //label.font = UIFont(name: "RobotoCondensed-Bold", size: 64)
        //label.text = "Amaze"
        return label
    }()
    var empowerLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 235, height: 75)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        //label.font = UIFont(name: "Montserrat-Bold", size: 64)
        //label.text = "Empower"
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
        let button = UIButton()
        button.frame = CGRect.zero
        button.setTitle("Sign up", for: .normal)
        button.titleLabel?.font = UIFont(name: "Montserrat-Bold", size: 24)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self,action:#selector(signUpButton),
                         for:.touchUpInside)
        return button
    }()
    
    var signIn: UIButton = {
        let button = UIButton()
        button.frame = CGRect.zero
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
        setLabels()
        apearAnimation()
    }
   
    
    func setUI() {
        
        let parent = self.view!
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

        // CreateLabel
        
        parent.addSubview(createLabel)
        createLabel.translatesAutoresizingMaskIntoConstraints = false
       // createLabel.widthAnchor.constraint(equalToConstant: 169).isActive = true
        createLabel.heightAnchor.constraint(equalToConstant: 75).isActive = true
        createLabel.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 28).isActive = true
        view.addConstraint(NSLayoutConstraint(item: createLabel, attribute: .centerY, relatedBy: .equal, toItem: redView, attribute: .centerY, multiplier: 1, constant: 0))
        
        // AmazeLabel
        
        parent.addSubview(amazeLabel)
        amazeLabel.translatesAutoresizingMaskIntoConstraints = false
        //amazeLabel.widthAnchor.constraint(equalToConstant: 174).isActive = true
        amazeLabel.heightAnchor.constraint(equalToConstant: 75).isActive = true
        amazeLabel.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 31).isActive = true
        view.addConstraint(NSLayoutConstraint(item: amazeLabel, attribute: .centerY, relatedBy: .equal, toItem: blueView, attribute: .centerY, multiplier: 1, constant: 0))
        
        // EmpowerLabel
        
        parent.addSubview(empowerLabel)
        empowerLabel.translatesAutoresizingMaskIntoConstraints = false
        //empowerLabel.widthAnchor.constraint(equalToConstant: 235).isActive = true
        empowerLabel.heightAnchor.constraint(equalToConstant: 75).isActive = true
        empowerLabel.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 31).isActive = true
        view.addConstraint(NSLayoutConstraint(item: empowerLabel, attribute: .centerY, relatedBy: .equal, toItem: greenView, attribute: .centerY, multiplier: 1, constant: 0))
        
        // redView
        
        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.widthAnchor.constraint(equalTo: createLabel.widthAnchor, multiplier: 0.25).isActive = true
        redView.heightAnchor.constraint(equalToConstant: 66).isActive = true
        redView.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 24).isActive = true
        self.view.addConstraint(NSLayoutConstraint(item: redView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 0.6, constant: 0))
        
        
        // BlueView
        
        blueView.translatesAutoresizingMaskIntoConstraints = false
        blueView.widthAnchor.constraint(equalTo: amazeLabel.widthAnchor, multiplier: 0.53).isActive = true
        blueView.heightAnchor.constraint(equalToConstant: 66).isActive = true
        blueView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 45).isActive = true
        blueView.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 24).isActive = true
        
        // GreenView
        
        greenView.translatesAutoresizingMaskIntoConstraints = false
        greenView.widthAnchor.constraint(equalTo: empowerLabel.widthAnchor, multiplier: 0.37).isActive = true
        greenView.heightAnchor.constraint(equalToConstant: 66).isActive = true
        greenView.topAnchor.constraint(equalTo: blueView.bottomAnchor, constant: 45).isActive = true
        greenView.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 24).isActive = true
        
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
        handImage.heightAnchor.constraint(equalToConstant: 440).isActive = true
        handImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
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
        descriptionText.topAnchor.constraint(equalTo: empowerLabel.bottomAnchor, constant: 32).isActive = true
        descriptionText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32).isActive = true
        descriptionText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
       
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
    @objc func signInButton(sender:UIButton) {
        UIView.animate(withDuration: 0.1, animations: {
            sender.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            sender.alpha = 0.5
        }, completion: { _ in
            UIView.animate(withDuration: 0.2, animations: {
                sender.transform = CGAffineTransform(scaleX: 1, y: 1)
                sender.alpha = 1
            },completion: { _ in
                let view = LoginViewController()
                view.modalPresentationStyle = .fullScreen
                self.present(view, animated: true, completion: nil)
            })
        })
    }
}


extension InitialViewController {
    
    // MARK: Функция отрисовки лэйблов
    func setLabels() {
        // Create Label
        var attrs1 = [NSAttributedString.Key.font : UIFont(name: "RobotoCondensed-Bold", size: 64), NSAttributedString.Key.foregroundColor : UIColor.white]

        var attrs2 = [NSAttributedString.Key.font : UIFont(name: "RobotoCondensed-Bold", size: 64), NSAttributedString.Key.foregroundColor : UIColor.black]

        var attributedString1 = NSMutableAttributedString(string:"C", attributes:attrs1)

        var attributedString2 = NSMutableAttributedString(string:"reate", attributes:attrs2)

        attributedString1.append(attributedString2)
        self.createLabel.attributedText = attributedString1
        
        
        // Amaze Label
        attrs1 = [NSAttributedString.Key.font : UIFont(name: "RobotoCondensed-Bold", size: 64), NSAttributedString.Key.foregroundColor : UIColor.white]

        attrs2 = [NSAttributedString.Key.font : UIFont(name: "RobotoCondensed-Bold", size: 64), NSAttributedString.Key.foregroundColor : UIColor.black]

        attributedString1 = NSMutableAttributedString(string:"Am", attributes:attrs1)

        attributedString2 = NSMutableAttributedString(string:"aze", attributes:attrs2)

        attributedString1.append(attributedString2)
        self.amazeLabel.attributedText = attributedString1
        
        // Empower Label
        attrs1 = [NSAttributedString.Key.font : UIFont(name: "RobotoCondensed-Bold", size: 64), NSAttributedString.Key.foregroundColor : UIColor.white]

        attrs2 = [NSAttributedString.Key.font : UIFont(name: "RobotoCondensed-Bold", size: 64), NSAttributedString.Key.foregroundColor : UIColor.black]

        attributedString1 = NSMutableAttributedString(string:"Em", attributes:attrs1)

        attributedString2 = NSMutableAttributedString(string:"power", attributes:attrs2)

        attributedString1.append(attributedString2)
        self.empowerLabel.attributedText = attributedString1
    }
    
    // MARK: Анимация появления текста
    func apearAnimation() {
        redView.transform = CGAffineTransform(scaleX: 0, y: 0)
        blueView.transform = CGAffineTransform(scaleX: 0, y: 0)
        greenView.transform = CGAffineTransform(scaleX: 0, y: 0)
        createLabel.alpha = 0
        amazeLabel.alpha = 0
        empowerLabel.alpha = 0
        
        UIView.animate(withDuration: 0.4, animations: {
            self.redView.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.createLabel.alpha = 1
        }, completion: { _ in
            UIView.animate(withDuration: 0.4, animations: {
                self.blueView.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.amazeLabel.alpha = 1
            }, completion: { _ in
                UIView.animate(withDuration: 0.4, animations: {
                    self.greenView.transform = CGAffineTransform(scaleX: 1, y: 1)
                    self.empowerLabel.alpha = 1
                }, completion: nil)
            })
        })
    }
}
