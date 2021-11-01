//
//  File.swift
//  Chordz
//
//  Created by Maxim Perehod on 08.10.2021.
//

import Foundation


// MARK: структура аккорда
struct Chord {
    var name: String?
    var index: Int?
}

// MARK: структура песни
struct Song {
    var nick: String?
    var name: String?
    var album: String?
    var tags: [String]?
    var image: String?
    var likes: Int?
    var comments: [Comment]?
    var text: String?
    var chords: [Chord]?
}

// MARK: структура пользователя
struct User {
    var nick: String?
    var songs: [String]? // массив идентификаторов песен
    
    init(nick: String, songs: [String]) {
        self.nick = nick
        self.songs = songs
    }
}

struct Comment {
    var nick: String?
    var text: String?
}
