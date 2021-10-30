//
//  Model.swift
//  Chordz
//
//  Created by Maxim Perehod on 28.10.2021.
//

import Foundation

protocol ModelProtocol {
    // MARK: Auth methods
    func signUp(email: String, password: String, complition: @escaping (Any?) -> Void)
    func signIn(email: String, password: String, complition: @escaping (Any?) -> Void)
    func resetPassword(email: String, password: String, complition: @escaping (Any?) -> Void)
}


class Model: ModelProtocol {
    
    let authManager: AuthManagerProtocol = FirebaseAuthManager.shared
    
    func signUp(email: String, password: String, complition: @escaping (Any?) -> Void) {
        authManager.createUser(email: email, password: password, completionHandler: complition)
    }
    
    func signIn(email: String, password: String, complition: @escaping (Any?) -> Void) {
        authManager.signIn(email: email, password: password, completionHandler: complition)
    }
    
    func resetPassword(email: String, password: String, complition: @escaping (Any?) -> Void) {
        authManager.resetPassword(email: email, completionHandler: complition)
    }
}
