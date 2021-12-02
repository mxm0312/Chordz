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
    func loadSongs() -> [Song]
    func deleteSong(songId: Int)
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
    
    func loadSongs() -> [Song] {
        var songs: [Song] = []
        
        let manager = FileManager.default
        guard let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return []
        }
//        print(url)
        let folderUrl = url.appendingPathComponent("chordz")
        do {
            let directoryContents = try FileManager.default.contentsOfDirectory(at: folderUrl, includingPropertiesForKeys: nil)
            let files = directoryContents.filter{ $0.pathExtension == "txt" }
            
            files.forEach { file in
                do {
                    //допустим, есть договоренность о том, как хранятся данные в файле
                    //первая строка -- имя артиста, вторая -- название песни, третья -- альбом, четвертая -- описание
                    let data = try String(contentsOfFile: file.path, encoding: .utf8)
                    let songData = data.components(separatedBy: .newlines)
                    
                    let song = Song(artist: songData[0], name: songData[1], album: songData[2], description: songData[3], nick: "nickname", tags: ["kshdad"], image: "radiohead", likes: 69, comments: nil)
                    songs.append(song)
                } catch {
                    print(error)
                }
            }
        } catch {
            print(error)
        }
        
        //todo create folder if not exists
        //когда будет готов экран создания, надо будет там тоже прописать логику сохранения через fileManager
        //именовать файлики с песнями можно, например, как дата+название песни, чтобы они по порядку шли
                
        return songs
    }
    
    func deleteSong(songId: Int) {
        let manager = FileManager.default
        guard let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return
        }
        let folderUrl = url.appendingPathComponent("chordz")
        do {
            let directoryContents = try FileManager.default.contentsOfDirectory(at: folderUrl, includingPropertiesForKeys: nil)
            let files = directoryContents.filter{ $0.pathExtension == "txt" }
            
            let fileToRemove = files[songId]
            
            try manager.removeItem(at: fileToRemove.absoluteURL)
        } catch {
            print(error)
        }
    }
    
    func navigateToSettings() {
        let view = SettingsViewController()
        view.modalPresentationStyle = .fullScreen
        self.view?.present(view, animated: false, completion: nil)
    }
}
