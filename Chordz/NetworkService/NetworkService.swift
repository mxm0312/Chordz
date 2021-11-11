//
//  Model.swift
//  Chordz
//
//  Created by Maxim Perehod on 28.10.2021.
//

import Foundation

protocol NetworkServiceProtocol {
    // MARK: Auth methods
    func signUp(email: String, password: String, complition: @escaping (Any?) -> Void)
    func signIn(email: String, password: String, complition: @escaping (Any?) -> Void)
    func resetPassword(email: String, password: String, complition: @escaping (Any?) -> Void)
    //MARK: Load methods for User
    func getUser(by uid: String, complition: @escaping (Any?) -> Void)
    func getUser(with nick: String, complition: @escaping (Any?) -> Void)
    //MARK: Load methods for Song
    
}


class FirebaseNetworkService: NetworkServiceProtocol {
    
    static let shared = FirebaseNetworkService()
    private init() {}
    
    let authManager: AuthManagerProtocol = FirebaseAuthManager.shared
    let loadManager: FirestoreLoadManager = FirestoreLoadManager.shared
    
    func signUp(email: String, password: String, complition: @escaping (Any?) -> Void) {
        authManager.createUser(email: email, password: password, completionHandler: complition)
    }
    func signIn(email: String, password: String, complition: @escaping (Any?) -> Void) {
        authManager.signIn(email: email, password: password, completionHandler: complition)
    }
    func resetPassword(email: String, password: String, complition: @escaping (Any?) -> Void) {
        authManager.resetPassword(email: email, completionHandler: complition)
    }
    func getUser(by uid: String, complition: @escaping (Any?) -> Void) {
        loadManager.loadUser(uid: uid, complitionHandler: complition)
    }
    func getUser(with nick: String, complition: @escaping (Any?) -> Void) {
        loadManager.loadUser(nick: nick, complitionHandler: complition)
    }
}


protocol ServiceOutputProtocol {
    
}
