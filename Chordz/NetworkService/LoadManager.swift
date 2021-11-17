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
    
    /* Загрузка пользователя по uid */
    func loadUser(uid: String, complitionHandler: @escaping (User?) -> Void)
    
    /* Загрузка пользователя по niсk */
    func loadUser(nick: String, complitionHandler: @escaping (User?) -> Void)
    
    /* Загрузка всех песен с таким названием */
    func loadSongs(name: String, complitionHandler: @escaping ([Song]?) -> Void)
    
    /* Загрузка всех песен с таким исполнителем */
    func loadSongs(artist: String, complitionHandler: @escaping ([Song]?) -> Void)
    
    /* Загрузка всех песен конкретного пользователя */
    func loadSongs(uid: String, complitionHandler: @escaping ([Song]?) -> Void)
    
    /* Загрузка всех песен c данным тэгом */
    func loadSongs(tag: String, complitionHandler: @escaping ([Song]?) -> Void)
}


class FirestoreLoadManager: LoadManagerProtocol {

    let db = Firestore.firestore()
    let userRef: CollectionReference?
    let songRef: CollectionReference?

    static let shared = FirestoreLoadManager()

    private init() {
        userRef = db.collection("User")
        songRef = db.collection("Song")
    }

    func loadUser(uid: String, complitionHandler: @escaping (User?) -> Void) {
        userRef?.document("ZOxQT2SqnrjZa36UXbJ0").getDocument(completion: { snap, error in
            if error == nil {
                complitionHandler(FirestoreDataParser.shared.parseToUser(this: snap?.data()))
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
        return
    }

    func loadSongs(tag: String, complitionHandler: @escaping ([Song]?) -> Void) {
        return
    }
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
}
