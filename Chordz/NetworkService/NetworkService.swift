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
    func saveUser(uid: String, nick: String, completionHandler: @escaping () -> Void)
    //MARK: Load methods for User
    func getUser(by uid: String, complition: @escaping (Any?) -> Void)
    func getUser(with nick: String, complition: @escaping (Any?) -> Void)
    func getUID() -> String?
    //MARK: Load methods for Song
    func loadSongs(by nick: String, complition: @escaping ([Song]?) -> Void)
    func loadAllSongs(complition: @escaping ([Song]?) -> Void)
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
    func loadSongs(by nick: String, complition: @escaping ([Song]?) -> Void) {
        loadManager.loadSongs(by: nick, complitionHandler: complition)
    }
    func getUID() -> String? {
        return loadManager.getUID()
    }
    func loadAllSongs(complition: @escaping ([Song]?) -> Void) {
        loadManager.loadAllSongs(complitionHandler: complition)
    }
    func saveUser(uid: String, nick: String, completionHandler: @escaping () -> Void) {
        authManager.saveUser(uid: uid, nick: nick, completionHandler: completionHandler)
    }
    
    
}


protocol ServiceOutputProtocol {
    
}
