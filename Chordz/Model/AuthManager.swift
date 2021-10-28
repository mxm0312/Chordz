//
//  File.swift
//  Chordz
//
//  Created by Maxim Perehod on 13.10.2021.
//

import Foundation
import FirebaseAuth


// MARK: Протокол клиента для работы с регистрацией
protocol AuthManagerProtocol {
    
    /* Функция создания нового пользователя. При успешном завершении возвращает true */
    func createUser(email: String, password: String, completionHandler: @escaping (Any?) -> Void)
    
    /* Функция входа. При успешном выполнении возвращает true */
    func signIn(email: String, password: String, completionHandler: @escaping (Any?) -> Void)
    
    /* Функция сброса пароля. При успешном выполнении возвращает true */
    func resetPassword(email: String, completionHandler: @escaping (Any?) -> Void)
    
}

// Клиент работы с регистрацией Firebase
class FirebaseAuthManager: AuthManagerProtocol {
    
    static let shared = FirebaseAuthManager()
    private init() {}
    
    func createUser(email: String, password: String, completionHandler: @escaping (Any?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password, completion: { (result, error) in
            completionHandler(error)
        })
    }
    
    func signIn(email: String, password: String, completionHandler: @escaping (Any?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password, completion: { (data, error) in
            completionHandler(error)
        })
       
    }
    
    func resetPassword(email: String, completionHandler: @escaping (Any?) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email, completion: { (error) in
            completionHandler(error)
        })
    }
}

