//
//  ProfilePresenter.swift
//  Chordz
//
//  Created by Алена Захарова on 14.11.2021.
//

import Foundation

protocol ProfilePresenterProtocol: AnyObject {
    func loadContent(complitionHandler: @escaping ([Song]) -> Void)
    func navigateToSettings()
    func loadInfo()
}

class ProfilePresenter: ProfilePresenterProtocol {
    
    let view: ProfileViewController?
    let service: NetworkServiceProtocol?
    
    init(view: ProfileViewController, service: NetworkServiceProtocol) {
        self.view = view
        self.service = service
    }
    
    func loadContent(complitionHandler: @escaping ([Song]) -> Void) {
        
    }
    
    func loadInfo() {
        let defaults = UserDefaults.standard
        if let currentUser = defaults.object(forKey: "currentUser") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(User.self, from: currentUser) {
                view?.setNick(nick: loadedPerson.nick)
            }
        }
    }
    
    func navigateToSettings() {
        let view = SettingsViewController()
        view.modalPresentationStyle = .fullScreen
        self.view?.present(view, animated: false, completion: nil)
    }
}
