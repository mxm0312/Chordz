//
//  FeedViewPresenter.swift
//  Chordz
//
//  Created by Maxim Perehod on 06.11.2021.
//

import Foundation


protocol FeedViewPresenterProtocol: AnyObject {
    var content: [Song] { get }
    var searchFieldIsShown: Bool { get }
    func loadContent()
    func searchButtonTapped()
    func search(by nick: String)
}

class FeedViewPresenter: FeedViewPresenterProtocol {
    
    var searchFieldIsShown: Bool = false

    let view: FeedView?
    let service: NetworkServiceProtocol?
    var content: [Song] {
        didSet {
            view?.tableView.reloadData()
        }
    }
    
    init(view: FeedViewController, service: NetworkServiceProtocol) {
        self.view = view
        self.service = service
        self.content = []
        
    }
    
    func searchButtonTapped() {
        if !searchFieldIsShown {
            searchFieldIsShown = true
            view?.showSearch()
        } else {
            searchFieldIsShown = false
            view?.hideSearch()
        }
        
    }
    
    func search(by nick: String) {
        service?.loadSongs(by: nick, complition: { songs in
            guard var songs = songs else { return }
            songs.sort(by: { firstSong, secondSong in
                return firstSong.date ?? 0 > secondSong.date ?? 0
            })
            self.content = songs
        })
    }
    
    func loadContent() {
        service?.loadAllSongs(complition: { songs in
            guard var songs = songs else { return }
            songs.sort(by: { firstSong, secondSong in
                return firstSong.date ?? 0 > secondSong.date ?? 0
            })
            self.content = songs
        })
        
        // MARK: - СНИЗУ НОРМАЛЬНЫЙ КОД (НЕ ДЛЯ РК2)
        
         /* if let currentUser = UserDefaults.standard.object(forKey: "currentUser") as? User {
            guard let nicks = currentUser.followingUsers else {
                // ни на кого не подписан
                return
            }
            for nick in nicks {
                service?.loadSongs(by: nick, complition: { songs in
                     guard let songs = songs else { return }
                     self.content = songs
                     self.content.sort(by: { firstSong, secondSong in
                         return firstSong.date ?? 0 > secondSong.date ?? 0
                     })
                    self.content += songs
                })
            }
        } else {
            guard service?.getUID() != nil else {
                return
            }
            service?.getUser(by: (service?.getUID())!, complition: { currentUser in
                guard let currentUser = currentUser as? User else {return}
                guard let nicks = currentUser.followingUsers else {
                    // ни на кого не подписан
                    return
                }
                for nick in nicks {
                    self.service?.loadSongs(by: nick, complition: { songs in
                         guard let songs = songs else { return }
                         self.content = songs
                         self.content.sort(by: { firstSong, secondSong in
                             return firstSong.date ?? 0 > secondSong.date ?? 0
                         })
                    })
                }
            })
        } */
    }
}
