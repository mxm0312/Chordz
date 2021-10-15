//
//  File.swift
//  Chordz
//
//  Created by Maxim Perehod on 13.10.2021.
//

import Foundation

// MARK: Протокол регистрации
protocol AuthManagerProtocol {
    
    /* Функция создания нового пользователя. При успешном завершении возвращает true */
    func createUser(email: String, password: String) -> Bool
    
    /* Функция входа. При успешном выполнении возвращает true */
    func signIn(email: String, password: String) -> Bool
    
}

//class FirebaseAuthManager: AuthManagerProtocol {
//    
//    func createUser(email: String, password: String) -> Bool {
//        <#code#>
//    }
//    
//    func signIn(email: String, password: String) -> Bool {
//        <#code#>
//    }
//    
//}

