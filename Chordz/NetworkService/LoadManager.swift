//
//  LoadManager.swift
//  Chordz
//
//  Created by Maxim Perehod on 13.10.2021.
//

import Foundation
import Firebase

// MARK: Протокол работы с БД
protocol LoadManagerProtocol {
    
    /// Загрузка пользователя по uid
    func loadUser(uid: String, complitionHandler: @escaping (User?) -> Void)
    
    /// Загрузка пользователя по niсk
    func loadUser(nick: String, complitionHandler: @escaping (User?) -> Void)
    
    /// Загрузка всех песен с таким названием
    func loadSongs(name: String, complitionHandler: @escaping ([Song]?) -> Void)
    
    /// Загрузка всех песен с таким исполнителем
    func loadSongs(artist: String, complitionHandler: @escaping ([Song]?) -> Void)
    
    /// Загрузка всех песен конкретного пользователя
    func loadSongs(uid: String, complitionHandler: @escaping ([Song]?) -> Void)
    
    /// Загрузка всех песен c данным тэгом
    func loadSongs(tag: String, complitionHandler: @escaping ([Song]?) -> Void)
    
    /// загрузить песни чела с таким ником
    func loadSongs(by nick: String, complitionHandler: @escaping ([Song]?) -> Void)
    
    /// загрузить песню по её айди
    func loadSong(id: String, complition: @escaping ((Song?) -> Void))
    
    /// получить uid пользователя
    func getUID() -> String?
    
    /// загрузить все песни
    func loadAllSongs(complitionHandler: @escaping ([Song]?) -> Void)
    
}


class FirestoreLoadManager: LoadManagerProtocol {
    
    let db = Firestore.firestore()
    let storage = Storage.storage()
    let userRef: CollectionReference?
    let songRef: CollectionReference?
    var profileImageRef: StorageReference?
    var output: LoadErrorOutputDelegate?
   
    static let shared = FirestoreLoadManager()
    
    private init() {
        userRef = db.collection("Users")
        songRef = db.collection("Songs")
        profileImageRef = storage.reference(withPath: "userProfileImages")
    }
    
    func loadUser(uid: String, complitionHandler: @escaping (User?) -> Void) {
        userRef?.whereField("uid", isEqualTo: uid).getDocuments(completion: { snap, error in
            if error == nil {
                complitionHandler(FirestoreDataParser.shared.parseToUser(this: snap?.documents[0].data()))
            }
        })
    }
    
    func loadUser(nick: String, complitionHandler: @escaping (User?) -> Void) {
        userRef?.whereField("nick", isEqualTo: nick).getDocuments(completion: { snap, error in
            if error == nil {
                complitionHandler(FirestoreDataParser.shared.parseToUser(this: snap?.documents[0].data()))
            }
        })
    }
    
    func loadSongs(name: String, complitionHandler: @escaping ([Song]?) -> Void) {
        return
    }
    
    func loadSongs(artist: String, complitionHandler: @escaping ([Song]?) -> Void) {
        return
    }
    
    func loadSongs(uid: String, complitionHandler: @escaping ([Song]?) -> Void) {
        
    }
    
    func loadSongs(tag: String, complitionHandler: @escaping ([Song]?) -> Void) {
        return
    }
    
    
    func loadSong(id: String, complition: @escaping ((Song?) -> Void)) {
        songRef?.whereField("id", isEqualTo: id).getDocuments(completion: { snaps, err in
            
            guard err == nil else {
                self.output?.loadMistake(messsage: err?.localizedDescription)
                return
            }
            guard let snaps = snaps else {
                return
            }
            if snaps.documents.isEmpty {
                return
            }
            print("я в лоудере \(snaps)")
            complition(FirestoreDataParser.shared.parseToSong(this: snaps.documents[0].data()))
        })
    }
    
    func loadSongs(by nick: String, complitionHandler: @escaping ([Song]?) -> Void) {
        songRef?.whereField("nick", isEqualTo: nick).getDocuments(completion: { snaps, err in
            
            var songs = [Song]()
            guard err == nil else {
                self.output?.loadMistake(messsage: err?.localizedDescription)
                return
            }
            guard let snaps = snaps else {
                return
            }
            for snap in snaps.documents {
                songs.append(FirestoreDataParser.shared.parseToSong(this: snap.data()))
            }
            complitionHandler(songs)
        })
    }
    
    func getUID() -> String? {
        print(Auth.auth().currentUser?.uid)
        return Auth.auth().currentUser?.uid
    }
    
    func loadAllSongs(complitionHandler: @escaping ([Song]?) -> Void) {
        songRef?.addSnapshotListener { snaps, err in
            var songs = [Song]()
            if err == nil {
                guard let snaps = snaps else {
                    return
                }
                for snap in snaps.documents {
                    songs.append(FirestoreDataParser.shared.parseToSong(this: snap.data()))
                }
                complitionHandler(songs)
            }
        }
    }
}

/// Протокол вывода ошибок из LoadManager
protocol LoadErrorOutputDelegate: AnyObject {
    /// Ошибка загрузки песни
    ///
    /// - Parameters:
    ///   - message: Тело ошибки
    func loadMistake(messsage: String?)
}

class FirestoreDataParser {
    
    static let shared = FirestoreDataParser()
    private init() {}
    
    // Парсит всё в User по полученному словарю
    func parseToUser(this dict: Dictionary<String, Any>?) -> User {
        var user = User()
        if let nick = dict?["nick"] as? String {
            user.nick = nick
        }
        if let songs = dict?["songs"] as? [String] {
            user.songs = songs
        }
        if let followingUsers = dict?["followingUsers"] as? [String] {
            user.followingUsers = followingUsers
        }
        if let followingTags = dict?["followingTags"] as? [String] {
            user.followingTags = followingTags
        }
        
        return user
    }
    
    func parseToSong(this dict: Dictionary<String, Any>?) -> Song {
        var song = Song()
        if let artist = dict?["artist"] as? String {
            song.artist = artist
        }
        if let name = dict?["name"] as? String {
            song.name = name
        }
        if let album = dict?["album"] as? String {
            song.album = album
        }
        if let description = dict?["description"] as? String {
            song.description = description
        }
        if let nick = dict?["nick"] as? String {
            song.nick = nick
        }
        if let tags = dict?["tags"] as? [String]? {
            song.tags = tags
        }
        if let image = dict?["image"] as? String {
            song.image = image
        }
        if let likes = dict?["likes"] as? Int {
            song.likes = likes
        }
        if let comments = dict?["comments"] as? [Comment] {
            song.comments = comments
        }
        if let content = dict?["content"] as? String {
            song.content = content
        }
        if let date = dict?["date"] as? Int {
            song.date = date
        }
        if let id = dict?["id"] as? String {
            song.id = id
        }
        return song
    }
    
}
