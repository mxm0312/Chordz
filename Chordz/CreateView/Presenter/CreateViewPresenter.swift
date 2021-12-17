//
//  CreateViewPresenter.swift
//  Chordz
//
//  Created by Maxim Perehod on 13.12.2021.
//

import Foundation

protocol CreateViewPresenterProtocol {
    var albumImageData: Data? { get set }
    func publish(name: String, artist: String, album: String, content: String)
}

class CreateViewPresenter: CreateViewPresenterProtocol {
    
    var albumImageData: Data?
    weak var view: CreateViewProtocol?
    var service: NetworkServiceProtocol?
    
    
    init(view: CreateViewProtocol, service: NetworkServiceProtocol) {
        self.view = view
        self.service = service
    }
    
    func publish(name: String, artist: String, album: String, content: String) {
        
        guard let albumImageData = albumImageData else {
            self.view?.showNoImageAlert()
            return
        }
        
        service?.getUser(by: service?.getUID() ?? "", complition: { user in
            if let user = user as? User {
                var song = Song()
                song.nick = user.nick
                song.content = content
                song.album = album
                song.artist = artist
                song.name = name
                song.likes = 0
                song.id = self.randomString(length: 8)
                song.date = Int(Date().timeIntervalSince1970)
                self.service?.publish(song: song, complition: {
                    self.view?.success()
                })
                self.service?.setAlbumImage(data: albumImageData, songID: song.id!)
            }
        })
    }
    
    func randomString(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
}


