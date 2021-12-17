//
//  SongViewingPresenter.swift
//  Chordz
//
//  Created by Maxim Perehod on 07.12.2021.
//

import Foundation

protocol SongViewingPresenterProtocol {
    var song: Song? {get set}
    var songIsLiked: Bool? {get set}
    func likeTapped()
    func unlikeTapped()
    func commentTapped()
    func addTapped()
    func loadAlbumImage(songID: String, complition: @escaping (Data?) -> Void)
    init(view: SongViewingViewControllerProtocol, service: NetworkServiceProtocol)
}

class SongViewingPresenter: SongViewingPresenterProtocol {
    
    weak var view: SongViewingViewControllerProtocol?
    var service: NetworkServiceProtocol?
    var song: Song?
    
    var songIsLiked: Bool?
    
    required init(view: SongViewingViewControllerProtocol, service: NetworkServiceProtocol) {
        self.view = view
        self.service = service
    }
    func likeTapped() {
        
        guard let id = song?.id else {
            return
        }
        service?.addLike(songID: id)
        
        var likedSongs = UserDefaults.standard.array(forKey: "likedSongs") ?? []
        likedSongs.append(self.song?.id)
        UserDefaults.standard.set(likedSongs, forKey: "likedSongs")
    }
    
    func unlikeTapped() {
        guard let id = song?.id else {
            return
        }
        service?.unlikeSong(songID: id)
        
        var likedSongs = UserDefaults.standard.array(forKey: "likedSongs") ?? []
        likedSongs.removeAll(where: { id in
            guard let id = id as? String else {
                return false
            }
            if id == self.song?.id {
                return true
            } else {
                return false
            }
        })
        UserDefaults.standard.set(likedSongs, forKey: "likedSongs")
        
    }
    
    func commentTapped() {
        guard let id = song?.id else {
            return
        }
        service?.addComment(songID: id)
    }
    
    func loadAlbumImage(songID: String, complition: @escaping (Data?) -> Void) {
        service?.loadAlbumImage(songID: songID, complition: complition)
    }
    
    func addTapped() {
        guard let id = song?.id else {
            return
        }
        
        var addedSongs = UserDefaults.standard.array(forKey: "addedSongs") ?? []
        addedSongs.append(self.song?.id)
        UserDefaults.standard.set(addedSongs, forKey: "addedSongs")
    }
}
