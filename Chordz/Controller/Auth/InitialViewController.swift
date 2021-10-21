//
//  InitialViewController.swift
//  Класс для самого первого экрана
//  Chordz
//
//  Created by Maxim Perehod on 19.10.2021.
//


import UIKit
import FirebaseAuth

class InitialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        DispatchQueue.global().async {
            let a = FirebaseAuthManager.shared.createUser(email: "maxim_perehod@mail.ru", password: "asdaasdsd")
        }
        
       
    }
}
