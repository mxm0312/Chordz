//
//  InitialViewController.swift
//  Класс для самого первого экрана
//  Chordz
//
//  Created by Maxim Perehod on 19.10.2021.
//


import UIKit


class InitialViewController: UIViewController {

    @IBOutlet var createLabel: UILabel!
    @IBOutlet var amazeLabel: UILabel!
    @IBOutlet var empowerLabel: UILabel!
    
    @IBOutlet var redView: UIView!
    @IBOutlet var blueView: UIView!
    @IBOutlet var greenView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redView.layer.cornerRadius = 12
        blueView.layer.cornerRadius = 12
        greenView.layer.cornerRadius = 12
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
