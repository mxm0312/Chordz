//
//  FeedViewPresenter.swift
//  Chordz
//
//  Created by Maxim Perehod on 06.11.2021.
//

import Foundation

protocol FeedViewPresenterProtocol: AnyObject {
    func loadContent(complitionHandler: @escaping ([Song]) -> Void)
}

class FeedViewPresente: FeedViewPresenterProtocol {
    
    let view: FeedViewController?
    let service: NetworkServiceProtocol?
    
    init(view: FeedViewController, service: NetworkServiceProtocol) {
        self.view = view
        self.service = service
    }
    
    func loadContent(complitionHandler: @escaping ([Song]) -> Void) {
        
    }
}
