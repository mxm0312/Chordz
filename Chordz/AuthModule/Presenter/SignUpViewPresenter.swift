//
//  SignUpViewPresenter.swift
//  Chordz
//
//  Created by Алена Захарова on 13.11.2021.
//

import Foundation

protocol SignUpViewPresenterProtocol: AnyObject {
    func signupButtonTapped(enteredEmail: String, enteredPassword: String)
    func navigateToSignIn()
    init(view: SignUpViewController, service: NetworkServiceProtocol)
}

class SignUpViewPresenter: SignUpViewPresenterProtocol {
    var view: SignUpViewController?
    var service: NetworkServiceProtocol?
    
    required init(view: SignUpViewController, service: NetworkServiceProtocol) {
        self.view = view
        self.service = service
    }
    
    func signupButtonTapped(enteredEmail: String, enteredPassword: String) {
        service?.signUp(email: enteredEmail, password: enteredPassword, complition: { err in
            if err == nil {
                self.view?.success()
            } else {
                self.view?.signUpProblem(error: err as! Error)
            }
        })
    }
    
    func navigateToSignIn() {
        let view = LoginViewController()
        view.modalPresentationStyle = .fullScreen
        self.view?.present(view, animated: false, completion: nil)
    }
}
