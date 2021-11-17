//
//  ProfilePresenter.swift
//  Chordz
//
//  Created by Алена Захарова on 14.11.2021.
//

import Foundation

protocol ProfilePresenterProtocol: AnyObject {
    func loadContent(complitionHandler: @escaping ([Song]) -> Void)
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
}
