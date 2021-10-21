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
    func createUser(email: String, password: String) -> Bool
    
    /* Функция входа. При успешном выполнении возвращает true */
    func signIn(email: String, password: String) -> Bool
    
    /* Функция сброса пароля. При успешном выполнении возвращает true */
    func resetPassword(email: String) -> Bool
    
}

// Клиент работы с регистрацией Firebase
class FirebaseAuthManager: AuthManagerProtocol {
    
    static let shared = FirebaseAuthManager()
    private init() {}
    
    func createUser(email: String, password: String) -> Bool {
        
        let semaphore = Semaphore()
        var regIsDone = false
        semaphore.wait()
        Auth.auth().createUser(withEmail: email, password: password, completion: { (result, error) in
            if error == nil {
                regIsDone = true
                semaphore.signal()
            } else {
                semaphore.signal()
            }
        })
        semaphore.wait()
        return regIsDone
    }
    
    func signIn(email: String, password: String) -> Bool {
        
        let semaphore = Semaphore()
        var loginIsDone = false
        semaphore.wait()
        Auth.auth().signIn(withEmail: email, password: password, completion: { (data, error) in
            if error == nil {
                loginIsDone = true
                semaphore.signal()
            } else {
                semaphore.signal()
            }
        })
        semaphore.wait()
        return loginIsDone
    }
    
    func resetPassword(email: String) -> Bool {
        
        let semaphore = Semaphore()
        var resetIsDone = false
        semaphore.wait()
        Auth.auth().sendPasswordReset(withEmail: email, completion: { (error) in
            if error == nil {
                resetIsDone = true
                semaphore.signal()
            } else {
                semaphore.signal()
            }
        })
        semaphore.wait()
        return resetIsDone
    }
}

