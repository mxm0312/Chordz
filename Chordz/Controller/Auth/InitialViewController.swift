//
//  InitialViewController.swift
//  Класс для самого первого экрана
//  Chordz
//
//  Created by Maxim Perehod on 19.10.2021.
//


import UIKit


class InitialViewController: UIViewController {
    
    
    var logoImage = UIImageView()
    var handImage = UIImageView()
    var chordzLabel = UILabel()
    var createLabel = UILabel()
    var amazeLabel = UILabel()
    var empowerLabel = UILabel()
    var redView = UIView()
    var blueView = UIView()
    var greenView = UIView()
    var signUp = UIButton()
    var signIn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setLabels()
        apearAnimation()
       
    }
   

    @IBAction func signUp(_ sender: Any) {
        
    }
    
    @IBAction func signIn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "login")
        vc!.modalPresentationStyle = .fullScreen
        self.present(vc!, animated: false, completion: nil)
    }
    
    func setUI() {
        
        // redView
        
        redView.frame = CGRect(x: 0, y: 0, width: 49, height: 66)
        redView.layer.backgroundColor = UIColor(red: 0.898, green: 0.227, blue: 0.349, alpha: 1).cgColor
        redView.layer.cornerRadius = 12

        var parent = self.view!
        parent.addSubview(redView)
        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.widthAnchor.constraint(equalToConstant: 49).isActive = true
        redView.heightAnchor.constraint(equalToConstant: 66).isActive = true
        redView.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 24).isActive = true
        redView.topAnchor.constraint(equalTo: parent.topAnchor, constant: 251).isActive = true
        
        // BlueView
       
        blueView.backgroundColor = .white

        blueView.layer.backgroundColor = UIColor(red: 0, green: 0.591, blue: 0.721, alpha: 1).cgColor
        blueView.layer.cornerRadius = 12

        parent.addSubview(blueView)
        blueView.translatesAutoresizingMaskIntoConstraints = false
        blueView.widthAnchor.constraint(equalToConstant: 96).isActive = true
        blueView.heightAnchor.constraint(equalToConstant: 66).isActive = true
        blueView.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 24).isActive = true
        blueView.topAnchor.constraint(equalTo: parent.topAnchor, constant: 346).isActive = true
        
        // GreenView
        
        greenView.frame = CGRect(x: 0, y: 0, width: 96, height: 66)
        greenView.backgroundColor = .white

        greenView.layer.backgroundColor = UIColor(red: 0.184, green: 0.658, blue: 0.231, alpha: 1).cgColor
        greenView.layer.cornerRadius = 12

        parent.addSubview(greenView)
        greenView.translatesAutoresizingMaskIntoConstraints = false
        greenView.widthAnchor.constraint(equalToConstant: 96).isActive = true
        greenView.heightAnchor.constraint(equalToConstant: 66).isActive = true
        greenView.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 24).isActive = true
        greenView.topAnchor.constraint(equalTo: parent.topAnchor, constant: 438).isActive = true

        // CreateLabel
        
        createLabel.frame = CGRect(x: 0, y: 0, width: 169, height: 75)

        createLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        createLabel.font = UIFont(name: "RobotoCondensed-Bold", size: 64)

        createLabel.text = "Create"
        parent.addSubview(createLabel)
        createLabel.translatesAutoresizingMaskIntoConstraints = false
        createLabel.widthAnchor.constraint(equalToConstant: 169).isActive = true
        createLabel.heightAnchor.constraint(equalToConstant: 75).isActive = true
        createLabel.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 31).isActive = true
        createLabel.topAnchor.constraint(equalTo: parent.topAnchor, constant: 248).isActive = true
        
        // AmazeLabel
        
        amazeLabel.frame = CGRect(x: 0, y: 0, width: 174, height: 75)
        amazeLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        amazeLabel.font = UIFont(name: "RobotoCondensed-Bold", size: 64)
        amazeLabel.text = "Amaze"
        parent.addSubview(amazeLabel)
        amazeLabel.translatesAutoresizingMaskIntoConstraints = false
        amazeLabel.widthAnchor.constraint(equalToConstant: 174).isActive = true
        amazeLabel.heightAnchor.constraint(equalToConstant: 75).isActive = true
        amazeLabel.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 31).isActive = true
        amazeLabel.topAnchor.constraint(equalTo: parent.topAnchor, constant: 341).isActive = true
        
        // EmpowerLabel
        
        empowerLabel.frame = CGRect(x: 0, y: 0, width: 235, height: 75)
        
        empowerLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        empowerLabel.font = UIFont(name: "RobotoCondensed-Bold", size: 64)
        empowerLabel.text = "Empower"
        parent.addSubview(empowerLabel)
        empowerLabel.translatesAutoresizingMaskIntoConstraints = false
        empowerLabel.widthAnchor.constraint(equalToConstant: 235).isActive = true
        empowerLabel.heightAnchor.constraint(equalToConstant: 75).isActive = true
        empowerLabel.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 31).isActive = true
        empowerLabel.topAnchor.constraint(equalTo: parent.topAnchor, constant: 434).isActive = true
        
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
        parent.addSubview(chordzLabel)
        chordzLabel.leadingAnchor.constraint(equalTo: logoImage.trailingAnchor, constant: 5).isActive = true
        chordzLabel.centerYAnchor.constraint(equalTo: logoImage.centerYAnchor).isActive = true
        chordzLabel.translatesAutoresizingMaskIntoConstraints = false
        
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
        
        var descriptionText = UILabel()
        descriptionText.frame = CGRect(x: 0, y: 0, width: 358, height: 84)
        descriptionText.backgroundColor = .white

        descriptionText.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        descriptionText.font = UIFont(name: "RobotoCondensed-Regular", size: 22)
        descriptionText.numberOfLines = 0
        descriptionText.lineBreakMode = .byWordWrapping
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.04


        descriptionText.attributedText = NSMutableAttributedString(string: "Create chords for your favourite songs and empower others to be better musicians", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])

        parent.addSubview(descriptionText)
        descriptionText.translatesAutoresizingMaskIntoConstraints = false
        descriptionText.topAnchor.constraint(equalTo: empowerLabel.bottomAnchor, constant: 50).isActive = true
        descriptionText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32).isActive = true
        descriptionText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
       
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
