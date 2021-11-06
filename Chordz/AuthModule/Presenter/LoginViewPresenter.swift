//
//  LoginViewPresenter.swift
//  Chordz
//
//  Created by Maxim Perehod on 06.11.2021.
//

import Foundation

protocol LoginViewPresenterProtocol {
    func logInButtonTapped(enteredEmail: String, enteredPassword: String)
}

class LoginViewPresenter: LoginViewPresenterProtocol {
    
    var view: LoginViewController?
    var service: NetworkServiceProtocol?
    
    init(view: LoginViewController, service: NetworkServiceProtocol) {
        self.view = view
        self.service = service
    }
    
    func logInButtonTapped(enteredEmail: String, enteredPassword: String) {
        service?.signIn(email: enteredEmail, password: enteredPassword, complition: { err in
            if err == nil {
                self.view?.showFeedView()
            } else {
                self.view?.signInProblem()
            }
        })
    }
}


