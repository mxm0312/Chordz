//
//  ProfilePresenter.swift
//  Chordz
//
//  Created by Алена Захарова on 14.11.2021.
//

import Foundation
import UIKit

/// Протокол отвечает за логику экрана профиль
protocol ProfilePresenterProtocol: AnyObject {
    /// Навигация в настройки
    func navigateToSettings()
    /// Загрузка информации о пользователе
    func loadInfo()
    /// Загрузка сохраненных песен
    func loadSavedSongs()
    /// Загрузка своих песен
    func loadMySongs()
    /// Удаление песни
    func deleteSong(songId: Int)
    /// Загрузка аватарки пользователя
    func loadMyProfileImage()
    /// Изменение аватарки пользователя
    func changeMyProfileImage(data: Data)
    /// Загрузить обложку альбома
    func loadAlbumImage(songID: String, complition: @escaping (Data?) -> Void)
}

class ProfilePresenter: ProfilePresenterProtocol {
    
    let view: ProfileViewController?
    let service: NetworkServiceProtocol?
    var user: User?
    
    init(view: ProfileViewController, service: NetworkServiceProtocol) {
        self.view = view
        self.service = service
    }
    
    func loadInfo() {

        // загрузи по сети
        service?.getUser(by: service?.getUID() ?? "", complition: { user in
            if let user = user as? User {
                self.user = user
                self.view?.setNick(nick: user.nick)
                self.loadMySongs()
            }
        })
    }
    
    func loadMySongs() {
        
//        let manager = FileManager.default
//        guard let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first else {
//            return []
//        }
////        print(url)
//        let folderUrl = url.appendingPathComponent("chordz")
//        do {
//            let directoryContents = try FileManager.default.contentsOfDirectory(at: folderUrl, includingPropertiesForKeys: nil)
//            let files = directoryContents.filter{ $0.pathExtension == "txt" }
//
//            files.forEach { file in
//                do {
//                    //допустим, есть договоренность о том, как хранятся данные в файле
//                    //первая строка -- имя артиста, вторая -- название песни, третья -- альбом, четвертая -- описание
//                    let data = try String(contentsOfFile: file.path, encoding: .utf8)
//                    let songData = data.components(separatedBy: .newlines)
//
//                    let song = Song(artist: songData[0], name: songData[1], album: songData[2], description: songData[3], nick: "nickname", tags: ["kshdad"], image: "radiohead", likes: 69, comments: nil)
//                    songs.append(song)
//                } catch {
//                    print(error)
//                }
//            }
//        } catch {
//            print(error)
//        }
//
//        //todo create folder if not exists
//        //когда будет готов экран создания, надо будет там тоже прописать логику сохранения через fileManager
//        //именовать файлики с песнями можно, например, как дата+название песни, чтобы они по порядку шли
        service?.loadSongs(by: user?.nick ?? "", complition: { songs in
            self.view?.songs = songs ?? []
            self.view?.tableView.reloadData()
        })
                
    }
    
    func loadSavedSongs() {
        let addedSongs = UserDefaults.standard.array(forKey: "addedSongs") as? [String] ?? [String]()
        print(addedSongs)
        for songId in addedSongs {
            print(songId)
            service?.loadSong(id: songId, complition: { song in
                guard let song = song else {
                    return
                }
                self.view?.songs.append(song)
                self.view?.tableView.scrollsToTop = true
                self.view?.tableView.reloadData()
            })
        }
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
    
    func loadMyProfileImage() {
        service?.loadPhoto(uid: service?.getUID() ?? "", complition: { data in
            self.view?.setMyProfileImage(data: data)
        })
    }
    
    func changeMyProfileImage(data: Data) {
        service?.changePhoto(data: data, uid: service?.getUID() ?? "")
    }
    
    func navigateToSettings() {
        let view = SettingsViewController()
        view.modalPresentationStyle = .fullScreen
        
        guard let tabBar = self.view?.parent as? UITabBarController else {
            return
        }
        tabBar.navigationController?.pushViewController(view, animated: true)
    }
    
    func loadAlbumImage(songID: String, complition: @escaping (Data?) -> Void) {
        service?.loadAlbumImage(songID: songID, complition: complition)
    }
}
